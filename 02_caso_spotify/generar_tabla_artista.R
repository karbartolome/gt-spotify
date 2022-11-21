library(tidyverse) # Manipulación de datos
library(gt)        # Tablas gt: grammar of tables
library(gtExtras)  # Extras de tablas gt
library(spotifyr)  # API de spotify
library(rjson)     # Trabajar con archivos json
library(ggrepel)   # Texto en ggplots

color_spotify = "#1DB954"

# credentials <- fromJSON(file = "credentials.json")
# 
# Sys.setenv(SPOTIFY_CLIENT_ID = credentials$SPOTIFY_CLIENT_ID)
# Sys.setenv(SPOTIFY_CLIENT_SECRET = credentials$SPOTIFY_CLIENT_SECRET)
# 
# access_token <- get_spotify_access_token()


get_imagen = function(album_images){
  album_images %>% 
    data.frame() %>% 
    filter(height==64) %>% 
    pull(url) %>% 
    as.character()
}

my_theme <- function(gt_object, ...){
  gt_object %>%
    tab_options(
      column_labels.background.color = "#39423c",
      footnotes.background.color = "#39423c",
      source_notes.background.color = "#39423c",
      heading.background.color = "#39423c",
      heading.align = "left",
      ...
    ) %>%
    tab_style(
      style = cell_text(color = color_spotify, size = px(32)),
      locations = cells_title("title")
    )
}

is_outlier <- function(x) {
  # outliers <- x < quantile(x, 0.25) - 1.5 * IQR(x) | 
  #             x > quantile(x, 0.75) + 1.5 * IQR(x)
  
  outliers <- x == max(x)
  return(outliers)
}


gen_outliers_plots<- function(.df, .variable, .font_size=22){
  temp <- .df %>% 
    select(all_of(c('track_name',.variable))) %>% 
    pivot_longer(cols=-track_name) 
  
  track <- temp %>% 
    slice(which.max(value)) %>% 
    pull(track_name)
  
  temp %>% 
    mutate(is_outlier=ifelse(track_name==track, track_name, NA)) %>% 
    ggplot(aes(y=value, x=name)) + 
    geom_boxplot(
      fill=color_spotify, width=0.2, lwd=3, outlier.size=5
    ) + 
    ggrepel::geom_text_repel(
      aes(label=is_outlier), 
      na.rm=TRUE, 
      nudge_x=0.4, 
      #position = position_nudge(x = +0.2),
      size=.font_size)+
    coord_flip()+
    theme_void()
}


gen_data_artista <- function(.artista){
  
  vars_audio = c(
    'danceability',
    'energy',
    'loudness',
    # 'liveness'
    # 'speechiness', 
    'acousticness', 
    'instrumentalness'
    # 'valence', 
    # 'tempo'       
  )
  
  tracks_features <- get_artist_audio_features(artist = .artista) %>%
    select(
      artist_id,
      artist_name,
      album_id,
      album_name,
      album_release_date,
      album_images,
      track_name,
      available_markets,
      duration_ms,
      key_mode,
      
      # Variables vinculadas a la canción
      all_of(vars_audio)       
    ) %>% 
    
    arrange(desc(album_release_date))
  
  return(tracks_features)
}
  
gen_tabla_artista <- function(
    .df, .albums=NULL, .head=NULL){
  
  df_processed <- .df %>%
    
    group_by(
      album_images, artist_name, album_id, album_name, album_release_date
    ) %>%
    
    summarise(
      duration_mins = sum(duration_ms/(1000*60)),
      across(all_of(vars_audio), ~ list(.x)),
    ) %>% 
    
    ungroup() %>% 
    
    mutate(album_images = map(album_images, ~get_imagen(album_images=.x))) %>% 
    
    distinct() %>% 
    
    mutate(instrumentalness=map(
      album_id, ~gen_outliers_plots(
        .df=.df %>% filter(album_id==.x), 
        .variable='instrumentalness'
      )
    )) %>% 
    
    select(-album_id) 
    
  if(!is.null(.albums)){
    df_processed <- df_processed %>% 
        filter(album_name %in% .albums)
  }
  if(!is.null(.head)){
    df_processed <- df_processed %>% 
        head(.head)
  }
  
  max_duration <- round(max(df_processed$duration_mins))+1
  artista <- df_processed %>% pull(artist_name) %>% unique()

  tabla <- df_processed %>% gt() %>%

      tab_header(
        title = md(glue::glue('**{str_to_title(artista)}** en Spotify')),
        subtitle = 'Álbumes más recientes'
      ) %>%

      text_transform(
        locations = cells_body(columns = c(album_images)),
        fn = function(album_images) {
          lapply(album_images, web_image, height = 50)
        }
      ) %>%

      gt_merge_stack(
        col1 = album_name,
        col2 = artist_name) %>%

      tab_style(
        style = list(cell_text(weight = "bold", color='red')),
        locations = cells_body(
          columns = album_release_date,
          rows = album_release_date >= '2022-01-01'
        )
      ) %>%

      fmt_number(columns=where(is.numeric)) %>% 

      gt_color_box(
        columns = duration_mins,
        palette=c('white', color_spotify),
        domain=c(0, max_duration)
      ) %>%

      gt_plt_dist(
        column = danceability, type = "density", line_color = "black",
        fill_color = color_spotify) %>%

      gt_plt_dist(
        column = energy, type = "density", line_color = "black",
        fill_color = color_spotify) %>%

      gt_plt_dist(
        column = loudness, type = "density", line_color = "black",
        fill_color = color_spotify) %>%

      gt_plt_dist(
        column = acousticness, type = "boxplot", line_color = "black",
        fill_color = color_spotify) %>% 

      text_transform(
        locations = cells_body(columns = instrumentalness),
        fn = function(x) {
          map(
            df_processed$instrumentalness,
            gt::ggplot_image,
            height = px(60),
            aspect_ratio = 2
          )
        }
      ) %>%

      gt::tab_spanner(label='Un tipo de variables',
                      columns=danceability:loudness) %>%

      gt::tab_spanner(label='Otro tipo de variables',
                      columns = c('acousticness','instrumentalness')) %>% 
      gt::tab_footnote(
        locations=cells_column_labels('duration_mins'),
        footnote='Duraciòn en minutos = suma de la duración de cada una de las canciones que componen el álbum.') %>%

      gt::tab_footnote(
        locations=cells_column_labels('instrumentalness'),
        footnote='En el caso de instrumentalness, al existir valores muy atípicos se muestra la canción a la que corresponde el máximo valor en cada álbum.') %>%

      gt::tab_source_note(source_note='Fuente: API de Spotify') %>%

      cols_label(
        album_images = '',
        album_name = '',
        album_release_date = 'Lanzamiento',
        duration_mins = 'Duración',
        danceability = 'Danceability 🕺',
        energy = 'Energy ✨',
        loudness = 'Loudness 🔊',
        acousticness = 'Acousticness 🎹',
        instrumentalness = 'Instrumentalness 🎼'
      ) %>%

      my_theme()

  return(tabla)
  
}


# df = gen_data_artista(.artista='soda stereo')
# 
# tabla <- gen_tabla_artista(
#   .df=df,
#   .head=5)
# 
# 
# tabla


