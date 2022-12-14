Tablas GT y Spotify
================
RLadies BA
2022-11-23

# 1. Librer铆as

Se definen los **paquetes** 馃摝 a utilizar:

``` r
library(tidyverse) # Manipulaci贸n de datos
library(gt)        # Tablas gt: grammar of tables
library(gtExtras)  # Extras de tablas gt
library(spotifyr)  # Trabajar con la API de spotify
library(rjson)     # Lectura de archivo json
library(ggrepel)   # Para textos en ggplot
```

**鈿狅笍 De no haber podido obtener las credenciales para consultar a la API
de Spotify, pasar al punto 3, en donde se leen los datos de un dataframe
almacenado en el repositorio.** **鈿狅笍**

## 2. API Spotify - Credenciales

Se cuenta con un archivo **(credentials..json)**, que contiene las
siguientes variables obtenidas de la p谩gina de desarrolladores de
Spotify:

- SPOTIFY_CLIENT_ID

- SPOTIFY_CLIENT_SECRET

El formato del archivo **credentials.json** est谩 incluido en el
.gitignore del repositorio. Esto permite mantener las credenciales
an贸nimas (sin publicar en repositorios), dado que son personales y no
deben compartirse. A continuaci贸n se muestra el formato de este archivo:

``` r
{
  "SPOTIFY_CLIENT_ID" : "SPOTIFY_CLIENT_ID",
  "SPOTIFY_CLIENT_SECRET" : "SPOTIFY_CLIENT_SECRET"

}
```

Se realiza la lectura de las credenciales mediante la funci贸n
**fromJSON()**. Luego, se setean como variables de entorno:

``` r
credentials <- fromJSON(file = "credentials.json")

Sys.setenv(SPOTIFY_CLIENT_ID = credentials$SPOTIFY_CLIENT_ID)
Sys.setenv(SPOTIFY_CLIENT_SECRET = credentials$SPOTIFY_CLIENT_SECRET)
```

Se utiliza la funci贸n **get_spotify_access_token**() del paquete
{**spotifyr**} 馃摝para autenticarse a la API:

``` r
access_token <- get_spotify_access_token()
```

Para verificar que la autenticaci贸n haya sido exitosa, se realiza una
consulta de los artistas m谩s escuchados:

``` r
tabla_user <- get_my_top_artists_or_tracks(
    type = 'artists', 
    time_range = 'short_term', #'short_term', # 'medium_term', 'long_term' 
    limit = 5) %>%
  select(name, genres) %>%
  rowwise() %>%
  mutate(genres = paste(genres, collapse = ', ')) %>%
  ungroup %>%
  gt()
```

# Caso: an谩lisis de un artista particular

Se define el artista a utilizar:

``` r
ARTISTA = 'bad bunny'
```

La funci贸n **get_artist_audio_features()** del paquete {**spotifyr**} 馃摝
permite generar una b煤squeda de variables vinculadas al audio de cada
track.

``` r
vars_audio = c(
  'danceability', 'energy', 'loudness', 'acousticness', 'instrumentalness'
)
```

``` r
tracks_features <- get_artist_audio_features(artist = ARTISTA) %>%
  
  select(
    artist_id, artist_name, album_id, album_name,
    album_release_date, album_images, track_name, duration_ms,

    # Variables vinculadas al audio:
    all_of(vars_audio)       
  ) %>% 
  
  arrange(desc(album_release_date))
```

# 3. The grammar of tables (gt)

De no haber podido autenticarte con la API de Spotify, dejamos un
archivo .rds con los datos necesarios para seguir con el resto del
taller:

``` r
# tracks_features %>% saveRDS('tracks_features.rds')
tracks_features <- readRDS('tracks_features.rds')
```

Se cuenta con un df de variables vinculadas a cada canci贸n de cada 谩lbum
del artista seleccionado:

``` r
tracks_features %>% 
  glimpse()
```

    ## Rows: 92
    ## Columns: 13
    ## $ artist_id          <chr> "4q3ewBCX7sLwd24euuV69X", "4q3ewBCX7sLwd24euuV69X",鈥?
    ## $ artist_name        <chr> "Bad Bunny", "Bad Bunny", "Bad Bunny", "Bad Bunny",鈥?
    ## $ album_id           <chr> "3RQQmkQEvNCY4prGKE6oc5", "3RQQmkQEvNCY4prGKE6oc5",鈥?
    ## $ album_name         <chr> "Un Verano Sin Ti", "Un Verano Sin Ti", "Un Verano 鈥?
    ## $ album_release_date <chr> "2022-05-06", "2022-05-06", "2022-05-06", "2022-05-鈥?
    ## $ album_images       <list> [<data.frame[3 x 3]>], [<data.frame[3 x 3]>], [<da鈥?
    ## $ track_name         <chr> "Moscow Mule", "Despu茅s de la Playa", "Me Porto Bon鈥?
    ## $ duration_ms        <int> 245939, 230400, 178567, 243716, 176936, 230704, 237鈥?
    ## $ danceability       <dbl> 0.804, 0.564, 0.911, 0.650, 0.787, 0.872, 0.795, 0.鈥?
    ## $ energy             <dbl> 0.674, 0.903, 0.712, 0.715, 0.546, 0.588, 0.684, 0.鈥?
    ## $ loudness           <dbl> -5.453, -3.221, -5.105, -5.198, -7.094, -6.276, -3.鈥?
    ## $ acousticness       <dbl> 0.2940, 0.3560, 0.0901, 0.0993, 0.3050, 0.2750, 0.0鈥?
    ## $ instrumentalness   <dbl> 0.00000118, 0.00000000, 0.00002680, 0.00029100, 0.0鈥?

## 3.1 Intro a gt

``` r
tabla <- tracks_features %>% 
  head() %>% 
  select(artist_name, album_name, track_name, all_of(vars_audio)) %>% 
  
  # En este paso se transforma el df en un objeto gt:
  gt()
```

``` r
tabla
```

![](tablas/tabla_1.png)<!-- -->

Notar que las variables num茅ricas aparecen con muchos decimales. Una
forma sencilla de arreglar esto en {gt} es la siguiente:

``` r
tabla %>% 
  fmt_number(columns = where(is.numeric), decimals=2)
```

![](tablas/tabla_1b.png)<!-- -->

## 3.2 Tabla a nivel 谩lbumes

Se agregan los datos a nivel de cada 谩lbum. Notar que, en el caso de las
variables de audio, se decidi贸 convertirlas en una lista (N
observaciones num茅ricas que representan cada una de las canciones
incluidas en el 谩lbum). En los pr贸ximos pasos se explicar谩 el por qu茅 de
la decisi贸n:

``` r
df_albums <- tracks_features %>%
  
  group_by(
    album_images, artist_name, album_id, album_name, album_release_date
  ) %>%
  
  summarise(
    # Duraci贸n del 谩lbum: suma de duraci贸n de cada canci贸n
    duration_mins = sum(duration_ms/(1000*60)),
    
    # Lista de cada variable de audio
    across(all_of(vars_audio), ~ list(.x)),
  ) %>% 
  
  ungroup()
```

``` r
tabla_albums <- df_albums %>% 
  select(-album_images) %>% 
  gt() 
```

``` r
tabla_albums
```

![](tablas/tabla_2.png)<!-- -->

## 3.3 Im谩genes en tablas gt

Se quiere a帽adir la imagen del 谩lbum. Para ello, se construye la
siguiente funci贸n. Para cada 谩lbum se cuenta con distintos tama帽os de
im谩genes, donde cada imagen se encuentra representada por un url. Se
decide seleccionar la imagen de tama帽o=64, extrayendo el url:

``` r
get_imagen = function(album_images){
  album_images %>% 
    data.frame() %>% 
    filter(height==64) %>% 
    pull(url) %>% 
    as.character()
}
```

Se aplica la funci贸n al dataframe. Para ello, se utiliza la funci贸n
**map()** del paquete {purrr} 馃摝:

``` r
df_albums <- df_albums %>% 
  mutate(album_images = map(album_images, ~get_imagen(album_images=.x))) %>% 
  distinct()
```

Para visualizar los urls como imagenes, se utiliza la funci贸n
**text_transform()** de {gt}. Adem谩s, la funci贸n **tab_header()**
permite a帽adir t铆tulo y subt铆tulo.

``` r
tabla_albums <- df_albums %>%  select(-album_id) %>% 

  gt() %>% 
  
  tab_header(
    title = md(glue::glue('**{str_to_title(ARTISTA)}** en Spotify')),
    subtitle = '脕lbumes m谩s recientes'
  ) %>% 
  
  text_transform(
    locations = cells_body(columns = c(album_images)),
    fn = function(album_images) {
      lapply(album_images, web_image, height = 50)
    }
  ) 
```

![](tablas/tabla_3.png)<!-- -->

Otra funci贸n 煤til para visualizar este tipo de informaci贸n es
**gt_merge_stack()** que permite concatenar dos variables en una 煤nica:

``` r
tabla_albums <- tabla_albums %>%  

  gt_merge_stack(
    col1 = album_name, 
    col2 = artist_name
  ) 
```

``` r
tabla_albums %>% cols_hide(all_of(vars_audio)) 
```

![](tablas/tabla_4.png)<!-- -->

Para visualizar las variables de audio, se utilizar谩n algunas
funcionalidades del paquete **{gtExtras}** 馃摝:

``` r
tabla_albums <- tabla_albums %>% 
  
  gt_color_box(columns = duration_mins, 
               palette=c('white', color_spotify), 
               domain=c(0,round(max(df_albums$duration_mins))+1)) %>% 
  
  gt_plt_dist(column = danceability, 
              type = "density", line_color = "black", 
              fill_color = color_spotify) %>% 
  
  gt_plt_dist(column = energy, 
              type = "density", line_color = "black", 
              fill_color = color_spotify) %>% 
  
  gt_plt_dist(column = loudness,
              type = "density", line_color = "black", 
              fill_color = color_spotify) %>% 
  
  gt_plt_dist(column = acousticness,
              type = "boxplot", line_color = "black", 
              fill_color = color_spotify)
```

``` r
tabla_albums %>% cols_hide('instrumentalness')
```

![](tablas/tabla_5.png)<!-- -->

## 3.4 Ggplot en gt

Notar que si se agregara el boxplot para el caso de la variable
instrumentalness, se observa, para todos los 谩lbumes, distribuciones con
valores at铆picos:

``` r
tabla_albums %>%
  gt_plt_dist(column = instrumentalness,
              type = "boxplot", line_color = "black", 
              fill_color = color_spotify) 
```

Por esta raz贸n, se utilizar谩 el caso de esta variable para explicar c贸mo
se podr铆a identificar a estos valores at铆picos mediante el uso de
{ggplot2} 馃摝

``` r
gen_outliers_plots<- function(.df, .variable, .font_size=22, .lwd=3){
  
  temp <- .df %>% 
    select(all_of(c('track_name',.variable))) %>% 
    pivot_longer(cols=-track_name) 
  
  track <- temp %>% 
    slice(which.max(value)) %>% 
    pull(track_name)
  
  temp %>% 
    mutate(
      is_outlier=ifelse(track_name==track, track_name, NA)
    ) %>% 
    
    ggplot(aes(y=value, x=name)) + 
    geom_boxplot(
      fill=color_spotify, width=0.2, lwd=.lwd, outlier.size=5
    ) + 
    geom_text_repel(aes(label=is_outlier), 
      na.rm=TRUE, nudge_x=0.4, size=.font_size)+
    coord_flip()+
    theme_void()
}
```

Realizando la prueba de la funci贸n, se observa el gr谩fico que genera:

``` r
gen_outliers_plots(
  .df=tracks_features %>% filter(album_name=='X 100PRE'), 
  .variable='instrumentalness', .font_size=10, .lwd = 0.5)
```

![](spotify_gt_rendered_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Ahora se incluyen estos plots en la tabla. Primero, se mappea la funci贸n
al df:

``` r
df_albums <- df_albums %>% 
  mutate(instrumentalness=map(
    album_id, ~gen_outliers_plots(
      .df=tracks_features %>% filter(album_id==.x), 
      .variable='instrumentalness'
    )
  ))
```

Se visualiza la tabla completa:

``` r
tabla_albums <- tabla_albums %>% 
  
    text_transform(
    locations = cells_body(columns = instrumentalness),
    fn = function(x) {
      map(
        df_albums$instrumentalness,
        gt::ggplot_image,
        height = px(60),
        aspect_ratio = 2
      )
    }
  ) 
```

``` r
tabla_albums
```

![](tablas/tabla_6.png)<!-- -->

## Formato

``` r
tabla_albums <- tabla_albums %>% 
  
  gt::tab_spanner(label='Un tipo de variables', 
                  columns=danceability:loudness) %>% 
  gt::tab_spanner(label='Otro tipo de variables', 
                  columns = c('acousticness','instrumentalness')) %>% 
  
  gt::tab_footnote(
    locations=cells_column_labels('duration_mins'), 
    footnote='Duraci贸n en minutos = suma de la duraci贸n de cada una de las canciones que componen el 谩lbum.') %>% 
  
  gt::tab_footnote(
    locations=cells_column_labels('instrumentalness'), 
    footnote='En el caso de instrumentalness, al existir valores muy at铆picos se muestra la canci贸n a la que corresponde el m谩ximo valor en cada 谩lbum.') %>% 
  
  gt::tab_source_note(source_note='Fuente: API de Spotify') %>% 
  
  cols_label(
    album_images = '',
    album_name = '',
    album_release_date = 'Lanzamiento',
    duration_mins = 'Duraci贸n',
    danceability = 'Danceability 馃暫',
    energy = 'Energy 鉁?',
    loudness = 'Loudness 馃攰',
    acousticness = 'Acousticness 馃幑',
    instrumentalness = 'Instrumentalness 馃幖'
  )  
```

``` r
tabla_albums
```

![](tablas/tabla_7.png)<!-- -->

Adem谩s, se a帽ade un theme espec铆fico para asignarle colores y formatos
adicionales:

``` r
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
```

``` r
tabla_albums <- tabla_albums %>% 
    my_theme()
```

``` r
tabla_albums
```

![](tablas/tabla_8.png)<!-- -->
