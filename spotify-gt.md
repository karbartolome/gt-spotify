Untitled
================
Karina Bartolomé
2022-07-30

# Librerías

Se definen los paquetes :package: a utilizar:

``` r
library(tidyverse) # Manipulación de datos
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(gt)        # Tablas gt: grammar of tables
library(gtExtras)  # Extras de tablas gt
```

    ## Warning: package 'gtExtras' was built under R version 4.2.1

``` r
library(spotifyr)  # API de spotify
```

    ## Warning: package 'spotifyr' was built under R version 4.2.1

``` r
library(gtrendsR)  # Google trends API
```

    ## Warning: package 'gtrendsR' was built under R version 4.2.1

``` r
library("rjson")
```

Se configura el token para conexión a la API de Spotify. El siguiente
chunk buscará las variables de entorno:

-   SPOTIFY_CLIENT_ID

-   SPOTIFY_CLIENT_SECRET

``` r
credentials <- fromJSON(file = "credentials.json")

Sys.setenv(SPOTIFY_CLIENT_ID = credentials$SPOTIFY_CLIENT_ID)
Sys.setenv(SPOTIFY_CLIENT_SECRET = credentials$SPOTIFY_CLIENT_SECRET)
```

Estas variables se obtienen con una cuenta en la página de
desarrolladores de Spotify:

``` r
access_token <- get_spotify_access_token()
```

Se puede acceder a los datos personales de artistas más escuchados:

``` r
get_my_top_artists_or_tracks(
    type = 'artists', time_range = 'short_term', limit = 10) %>%
  select(name, genres) %>%
  rowwise() %>%
  mutate(genres = paste(genres, collapse = ', ')) %>%
  ungroup %>%
  gt()
```

<div id="pxxpaocrgp" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pxxpaocrgp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pxxpaocrgp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pxxpaocrgp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pxxpaocrgp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pxxpaocrgp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pxxpaocrgp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pxxpaocrgp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pxxpaocrgp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pxxpaocrgp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pxxpaocrgp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pxxpaocrgp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pxxpaocrgp .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pxxpaocrgp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pxxpaocrgp .gt_from_md > :first-child {
  margin-top: 0;
}

#pxxpaocrgp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pxxpaocrgp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pxxpaocrgp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pxxpaocrgp .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pxxpaocrgp .gt_row_group_first td {
  border-top-width: 2px;
}

#pxxpaocrgp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pxxpaocrgp .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pxxpaocrgp .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pxxpaocrgp .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pxxpaocrgp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pxxpaocrgp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pxxpaocrgp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pxxpaocrgp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pxxpaocrgp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pxxpaocrgp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pxxpaocrgp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pxxpaocrgp .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pxxpaocrgp .gt_left {
  text-align: left;
}

#pxxpaocrgp .gt_center {
  text-align: center;
}

#pxxpaocrgp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pxxpaocrgp .gt_font_normal {
  font-weight: normal;
}

#pxxpaocrgp .gt_font_bold {
  font-weight: bold;
}

#pxxpaocrgp .gt_font_italic {
  font-style: italic;
}

#pxxpaocrgp .gt_super {
  font-size: 65%;
}

#pxxpaocrgp .gt_two_val_uncert {
  display: inline-block;
  line-height: 1em;
  text-align: right;
  font-size: 60%;
  vertical-align: -0.25em;
  margin-left: 0.1em;
}

#pxxpaocrgp .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#pxxpaocrgp .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pxxpaocrgp .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#pxxpaocrgp .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#pxxpaocrgp .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">genres</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">The Smiths</td>
<td class="gt_row gt_left">madchester, new wave, permanent wave, rock, uk post-punk</td></tr>
    <tr><td class="gt_row gt_left">Intoxicados</td>
<td class="gt_row gt_left">argentine rock, latin alternative, latin rock, rock en espanol, rock nacional, ska argentino</td></tr>
    <tr><td class="gt_row gt_left">La Dispute</td>
<td class="gt_row gt_left">alternative emo, emo, grand rapids indie, progressive post-hardcore, screamo</td></tr>
    <tr><td class="gt_row gt_left">Placebo</td>
<td class="gt_row gt_left">alternative rock, britpop, permanent wave, rock</td></tr>
    <tr><td class="gt_row gt_left">Paramore</td>
<td class="gt_row gt_left">candy pop, pixie, pop emo, pop punk</td></tr>
    <tr><td class="gt_row gt_left">Bon Iver</td>
<td class="gt_row gt_left">eau claire indie, indie folk, melancholia</td></tr>
    <tr><td class="gt_row gt_left">Prehistöricos</td>
<td class="gt_row gt_left">chilean indie, chilean rock</td></tr>
    <tr><td class="gt_row gt_left">Joy Division</td>
<td class="gt_row gt_left">alternative rock, art rock, madchester, new wave, post-punk, rock, uk post-punk</td></tr>
    <tr><td class="gt_row gt_left">Interpol</td>
<td class="gt_row gt_left">alternative rock, indie rock, modern rock, rock</td></tr>
    <tr><td class="gt_row gt_left">Slowdive</td>
<td class="gt_row gt_left">alternative rock, art pop, dream pop, nu gaze, reading indie, rock, shoegaze</td></tr>
  </tbody>
  
  
</table>
</div>

# Caso: análisis de un artista particular

Se define el artista a utilizar:

``` r
ARTISTA = 'bad bunny'
```

Para este artista, se genera una búsqueda de variables:

``` r
tracks_features <- get_artist_audio_features(artist = ARTISTA) %>%
  select(
    artist_id,
    artist_name,
    album_name,
    album_release_date,
    album_images,
    track_name,
    danceability,
    energy,
    loudness,
    acousticness,
    instrumentalness,
    liveness
  ) 
```

Se cuenta con un df de variables vinculadas a cada canción de cada álbum
del artista seleccionado:

``` r
tracks_features %>% 
  head() %>% gt()
```

<div id="zmqlxrzqkq" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zmqlxrzqkq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zmqlxrzqkq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zmqlxrzqkq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zmqlxrzqkq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zmqlxrzqkq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmqlxrzqkq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zmqlxrzqkq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zmqlxrzqkq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zmqlxrzqkq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zmqlxrzqkq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zmqlxrzqkq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zmqlxrzqkq .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zmqlxrzqkq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zmqlxrzqkq .gt_from_md > :first-child {
  margin-top: 0;
}

#zmqlxrzqkq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zmqlxrzqkq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zmqlxrzqkq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#zmqlxrzqkq .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#zmqlxrzqkq .gt_row_group_first td {
  border-top-width: 2px;
}

#zmqlxrzqkq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmqlxrzqkq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#zmqlxrzqkq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#zmqlxrzqkq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmqlxrzqkq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmqlxrzqkq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zmqlxrzqkq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zmqlxrzqkq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmqlxrzqkq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zmqlxrzqkq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmqlxrzqkq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zmqlxrzqkq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmqlxrzqkq .gt_left {
  text-align: left;
}

#zmqlxrzqkq .gt_center {
  text-align: center;
}

#zmqlxrzqkq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zmqlxrzqkq .gt_font_normal {
  font-weight: normal;
}

#zmqlxrzqkq .gt_font_bold {
  font-weight: bold;
}

#zmqlxrzqkq .gt_font_italic {
  font-style: italic;
}

#zmqlxrzqkq .gt_super {
  font-size: 65%;
}

#zmqlxrzqkq .gt_two_val_uncert {
  display: inline-block;
  line-height: 1em;
  text-align: right;
  font-size: 60%;
  vertical-align: -0.25em;
  margin-left: 0.1em;
}

#zmqlxrzqkq .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#zmqlxrzqkq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#zmqlxrzqkq .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#zmqlxrzqkq .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#zmqlxrzqkq .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">artist_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">artist_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_release_date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">album_images</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">track_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">danceability</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">energy</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loudness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">acousticness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">instrumentalness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">liveness</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Moscow Mule</td>
<td class="gt_row gt_right">0.804</td>
<td class="gt_row gt_right">0.674</td>
<td class="gt_row gt_right">-5.453</td>
<td class="gt_row gt_right">0.2940</td>
<td class="gt_row gt_right">0.00000118</td>
<td class="gt_row gt_right">0.1150</td></tr>
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Después de la Playa</td>
<td class="gt_row gt_right">0.564</td>
<td class="gt_row gt_right">0.903</td>
<td class="gt_row gt_right">-3.221</td>
<td class="gt_row gt_right">0.3560</td>
<td class="gt_row gt_right">0.00000000</td>
<td class="gt_row gt_right">0.1750</td></tr>
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Me Porto Bonito</td>
<td class="gt_row gt_right">0.911</td>
<td class="gt_row gt_right">0.712</td>
<td class="gt_row gt_right">-5.105</td>
<td class="gt_row gt_right">0.0901</td>
<td class="gt_row gt_right">0.00002680</td>
<td class="gt_row gt_right">0.0933</td></tr>
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Tití Me Preguntó</td>
<td class="gt_row gt_right">0.650</td>
<td class="gt_row gt_right">0.715</td>
<td class="gt_row gt_right">-5.198</td>
<td class="gt_row gt_right">0.0993</td>
<td class="gt_row gt_right">0.00029100</td>
<td class="gt_row gt_right">0.1260</td></tr>
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Un Ratito</td>
<td class="gt_row gt_right">0.787</td>
<td class="gt_row gt_right">0.546</td>
<td class="gt_row gt_right">-7.094</td>
<td class="gt_row gt_right">0.3050</td>
<td class="gt_row gt_right">0.00004550</td>
<td class="gt_row gt_right">0.1220</td></tr>
    <tr><td class="gt_row gt_left">4q3ewBCX7sLwd24euuV69X</td>
<td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_center">c(640, 300, 64), c("https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d00001e0249d694203245f241a1bcaa72", "https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72"), c(640, 300, 64)</td>
<td class="gt_row gt_left">Yo No Soy Celoso</td>
<td class="gt_row gt_right">0.872</td>
<td class="gt_row gt_right">0.588</td>
<td class="gt_row gt_right">-6.276</td>
<td class="gt_row gt_right">0.2750</td>
<td class="gt_row gt_right">0.00000000</td>
<td class="gt_row gt_right">0.1700</td></tr>
  </tbody>
  
  
</table>
</div>

Agregando los datos a nivel de cada álbum:

``` r
tabla <- tracks_features %>%
  group_by(artist_name, album_name, album_images, album_release_date) %>%
  summarise(across(
      where(is.numeric),
      ~ mean(.x))) %>% 
  ungroup()
```

    ## `summarise()` has grouped output by 'artist_name', 'album_name',
    ## 'album_images'. You can override using the `.groups` argument.

``` r
tabla %>% 
  select(-album_images) %>% 
  head() %>% gt() %>% 
  fmt_number(columns=where(is.numeric))
```

<div id="rarhrewqam" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rarhrewqam .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rarhrewqam .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rarhrewqam .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#rarhrewqam .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#rarhrewqam .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rarhrewqam .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rarhrewqam .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rarhrewqam .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rarhrewqam .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rarhrewqam .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rarhrewqam .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rarhrewqam .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#rarhrewqam .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rarhrewqam .gt_from_md > :first-child {
  margin-top: 0;
}

#rarhrewqam .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rarhrewqam .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rarhrewqam .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#rarhrewqam .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#rarhrewqam .gt_row_group_first td {
  border-top-width: 2px;
}

#rarhrewqam .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rarhrewqam .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#rarhrewqam .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#rarhrewqam .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rarhrewqam .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rarhrewqam .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rarhrewqam .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rarhrewqam .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rarhrewqam .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rarhrewqam .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rarhrewqam .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rarhrewqam .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rarhrewqam .gt_left {
  text-align: left;
}

#rarhrewqam .gt_center {
  text-align: center;
}

#rarhrewqam .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rarhrewqam .gt_font_normal {
  font-weight: normal;
}

#rarhrewqam .gt_font_bold {
  font-weight: bold;
}

#rarhrewqam .gt_font_italic {
  font-style: italic;
}

#rarhrewqam .gt_super {
  font-size: 65%;
}

#rarhrewqam .gt_two_val_uncert {
  display: inline-block;
  line-height: 1em;
  text-align: right;
  font-size: 60%;
  vertical-align: -0.25em;
  margin-left: 0.1em;
}

#rarhrewqam .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#rarhrewqam .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#rarhrewqam .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#rarhrewqam .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#rarhrewqam .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">artist_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_release_date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">danceability</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">energy</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loudness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">acousticness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">instrumentalness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">liveness</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">EL ÚLTIMO TOUR DEL MUNDO</td>
<td class="gt_row gt_left">2020-11-27</td>
<td class="gt_row gt_right">0.71</td>
<td class="gt_row gt_right">0.62</td>
<td class="gt_row gt_right">&minus;6.10</td>
<td class="gt_row gt_right">0.27</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">LAS QUE NO IBAN A SALIR</td>
<td class="gt_row gt_left">2020-05-10</td>
<td class="gt_row gt_right">0.78</td>
<td class="gt_row gt_right">0.67</td>
<td class="gt_row gt_right">&minus;7.24</td>
<td class="gt_row gt_right">0.18</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">OASIS</td>
<td class="gt_row gt_left">2019-06-28</td>
<td class="gt_row gt_right">0.71</td>
<td class="gt_row gt_right">0.76</td>
<td class="gt_row gt_right">&minus;4.78</td>
<td class="gt_row gt_right">0.09</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.18</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_right">0.76</td>
<td class="gt_row gt_right">0.66</td>
<td class="gt_row gt_right">&minus;6.06</td>
<td class="gt_row gt_right">0.26</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.22</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">X 100PRE</td>
<td class="gt_row gt_left">2018-12-23</td>
<td class="gt_row gt_right">0.73</td>
<td class="gt_row gt_right">0.57</td>
<td class="gt_row gt_right">&minus;7.25</td>
<td class="gt_row gt_right">0.28</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">YHLQMDLG</td>
<td class="gt_row gt_left">2020-02-29</td>
<td class="gt_row gt_right">0.77</td>
<td class="gt_row gt_right">0.73</td>
<td class="gt_row gt_right">&minus;5.09</td>
<td class="gt_row gt_right">0.17</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.14</td></tr>
  </tbody>
  
  
</table>
</div>

Se quiere añadir la imagen del álbum

``` r
get_imagen = function(album_images){
  album_images %>% 
    data.frame() %>% 
    filter(height==64) %>% 
    pull(url) %>% 
    as.character()
}
```

``` r
tabla_album <- tabla %>% 
  mutate(album_images = map(album_images, ~get_imagen(album_images=.x))) %>% 
  distinct()
```

``` r
tabla_album %>%  

  head() %>% 
  
  gt() %>% 
  
  text_transform(
    locations = cells_body(columns = c(album_images)),
    fn = function(album_images) {
      lapply(album_images, web_image, height = 50)
    }
  ) %>%
  
  cols_label(album_images = '') %>% 
  

  fmt_number(columns=where(is.numeric))
```

<div id="qxjlmpvtlw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qxjlmpvtlw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qxjlmpvtlw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qxjlmpvtlw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qxjlmpvtlw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qxjlmpvtlw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qxjlmpvtlw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qxjlmpvtlw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qxjlmpvtlw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qxjlmpvtlw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qxjlmpvtlw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qxjlmpvtlw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qxjlmpvtlw .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#qxjlmpvtlw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qxjlmpvtlw .gt_from_md > :first-child {
  margin-top: 0;
}

#qxjlmpvtlw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qxjlmpvtlw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qxjlmpvtlw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#qxjlmpvtlw .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#qxjlmpvtlw .gt_row_group_first td {
  border-top-width: 2px;
}

#qxjlmpvtlw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qxjlmpvtlw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#qxjlmpvtlw .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#qxjlmpvtlw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qxjlmpvtlw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qxjlmpvtlw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qxjlmpvtlw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qxjlmpvtlw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qxjlmpvtlw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qxjlmpvtlw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#qxjlmpvtlw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qxjlmpvtlw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#qxjlmpvtlw .gt_left {
  text-align: left;
}

#qxjlmpvtlw .gt_center {
  text-align: center;
}

#qxjlmpvtlw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qxjlmpvtlw .gt_font_normal {
  font-weight: normal;
}

#qxjlmpvtlw .gt_font_bold {
  font-weight: bold;
}

#qxjlmpvtlw .gt_font_italic {
  font-style: italic;
}

#qxjlmpvtlw .gt_super {
  font-size: 65%;
}

#qxjlmpvtlw .gt_two_val_uncert {
  display: inline-block;
  line-height: 1em;
  text-align: right;
  font-size: 60%;
  vertical-align: -0.25em;
  margin-left: 0.1em;
}

#qxjlmpvtlw .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#qxjlmpvtlw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#qxjlmpvtlw .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#qxjlmpvtlw .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#qxjlmpvtlw .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">artist_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">album_release_date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">danceability</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">energy</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loudness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">acousticness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">instrumentalness</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">liveness</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">EL ÚLTIMO TOUR DEL MUNDO</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d00004851005ee342f4eef2cc6e8436ab" style="height:50px;"></td>
<td class="gt_row gt_left">2020-11-27</td>
<td class="gt_row gt_right">0.71</td>
<td class="gt_row gt_right">0.62</td>
<td class="gt_row gt_right">&minus;6.10</td>
<td class="gt_row gt_right">0.27</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">LAS QUE NO IBAN A SALIR</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d00004851ae879683217d488c39600092" style="height:50px;"></td>
<td class="gt_row gt_left">2020-05-10</td>
<td class="gt_row gt_right">0.78</td>
<td class="gt_row gt_right">0.67</td>
<td class="gt_row gt_right">&minus;7.24</td>
<td class="gt_row gt_right">0.18</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">OASIS</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d000048514891d9b25d8919448388f3bb" style="height:50px;"></td>
<td class="gt_row gt_left">2019-06-28</td>
<td class="gt_row gt_right">0.71</td>
<td class="gt_row gt_right">0.76</td>
<td class="gt_row gt_right">&minus;4.78</td>
<td class="gt_row gt_right">0.09</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.18</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">Un Verano Sin Ti</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d0000485149d694203245f241a1bcaa72" style="height:50px;"></td>
<td class="gt_row gt_left">2022-05-06</td>
<td class="gt_row gt_right">0.76</td>
<td class="gt_row gt_right">0.66</td>
<td class="gt_row gt_right">&minus;6.06</td>
<td class="gt_row gt_right">0.26</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.22</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">X 100PRE</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d000048512fbd77033247e889cb7d2ac4" style="height:50px;"></td>
<td class="gt_row gt_left">2018-12-23</td>
<td class="gt_row gt_right">0.73</td>
<td class="gt_row gt_right">0.57</td>
<td class="gt_row gt_right">&minus;7.25</td>
<td class="gt_row gt_right">0.28</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.16</td></tr>
    <tr><td class="gt_row gt_left">Bad Bunny</td>
<td class="gt_row gt_left">YHLQMDLG</td>
<td class="gt_row gt_center"><img src="https://i.scdn.co/image/ab67616d00004851548f7ec52da7313de0c5e4a0" style="height:50px;"></td>
<td class="gt_row gt_left">2020-02-29</td>
<td class="gt_row gt_right">0.77</td>
<td class="gt_row gt_right">0.73</td>
<td class="gt_row gt_right">&minus;5.09</td>
<td class="gt_row gt_right">0.17</td>
<td class="gt_row gt_right">0.00</td>
<td class="gt_row gt_right">0.14</td></tr>
  </tbody>
  
  
</table>
</div>

# Tendencias

Se utiliza la API de Google trends para obtener la evolución de las
búsquedas realizadas para un álbum:

``` r
ALBUM = 'LAS QUE NO IBAN A SALIR'
RELEASE_DATE = '2020-05-10'

trends <- gtrends(
  keyword = paste0(ARTISTA, ' ', tolower(ALBUM)),
  geo = "",
  time = "all"
)
```

Visualmente:

``` r
trends %>%
  .$interest_over_time %>% 
  mutate(hits = ifelse(str_detect(hits, "<"),0,hits)) %>% 
  mutate(hits = as.numeric(hits)) %>% 
  ggplot(aes(x = date, y = hits)) +
  geom_line(colour = "darkblue", size = 0.7) +
  facet_wrap(~keyword) +
  theme_minimal()
```

![](spotify-gt_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

Se genera una función para realizar este gráfico:

``` r
gen_trend_ggplot <- function(.album, .artista, .release_date) {
  if (tolower(.album) == tolower(.artista)) {
    .album = 'self titled'
  }
  
  gtrends(
    keyword = paste0(.artista, ' ', .album),
    geo = "",
    time = "today+5-y"
  ) %>%
    .$interest_over_time %>%
    mutate(hits = ifelse(str_detect(hits, "<"), 0, hits)) %>%
    mutate(hits = as.numeric(hits)) %>%
    ggplot(aes(x = date, y = hits)) +
    geom_line(color = "darkblue", size = 1) +
    geom_vline(xintercept = as.POSIXct(.release_date),
               color = 'red') +
    annotate(
      geom = 'text',
      x = as.POSIXct(.release_date) - lubridate::days(500),
      y = 90,
      size = 6,
      label = paste0('Publicación'),
      color = 'red'
    ) +
    geom_curve(
      aes(
        x = as.POSIXct(.release_date) - lubridate::days(500) ,
        y = 85,
        xend = as.POSIXct(.release_date),
        yend = 75
      ),
      curvature = 0.3,
      angle = 40,
      color = 'red',
      size = 1,
      arrow = arrow(length = unit(0.3, "cm"))
    ) +
    labs(x = '', y = '%') +
    theme_minimal() +
    theme(axis.text = element_text(size = 14),
          title = element_text(size = 16))
}
```

``` r
p <- gen_trend_ggplot(.album = ALBUM,
                 .artista = ARTISTA,
                 .release_date = RELEASE_DATE)

p 
```

![](spotify-gt_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

# Tabla con ggplots

Se aplica esta función sobre los álbumes de la tabla:

``` r
tabla_plots <- tabla_album %>%  
  
  # Seleccionando los 5 álbumes más recientes, para no hacer tantas consultas a la API (podría dar error):
  arrange(desc(album_release_date)) %>% 
  
  head(5) %>% 
  
  mutate(evolucion = map2(
    album_name, album_release_date,
    ~gen_trend_ggplot(.album =.x, 
                      .artista=ARTISTA, 
                      .release_date=.y)))
```

Visualizando la tabla final:

``` r
tabla_final <- tabla_plots %>% 
  
 gt() %>% 
  
  text_transform(
    locations = cells_body(columns = c(album_images)),
    fn = function(album_images) {
      lapply(album_images, web_image, height = 50)
    }
  ) %>%
  
  cols_label(album_images = '') %>% 
    
  # Ggplots en formato gráfico (sino aparecen como texto)
  text_transform(
    locations = cells_body(columns = evolucion),
    fn = function(x) {
      map(
        tabla_plots$evolucion,
        gt::ggplot_image,
        height = px(180),
        aspect_ratio = 2
      )
    }
  ) %>% 
  
  fmt_number(columns=where(is.numeric))
```

``` r
knitr::include_graphics('tabla_final.png')
```

![](tabla_final.png)<!-- -->
