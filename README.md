# 💜 Charla RLadies 💜 

## **1. 01_slides/** 👉 [Creando tablas en {gt} con Spotify API & Bad Bunny](https://karbartolome.github.io/gt-spotify/01_slides/rladies_gt_spotify.html)

 Las slides fueron generadas con {xaringan} 📦. 

## **2. 02_caso_spotify**

  - spotify_gt.Rmd
      [Archivo .Rmd para utilizar en el taller](https://github.com/karbartolome/gt-spotify/blob/main/02_caso_spotify/spotify_gt.Rmd)
      
  - spotify_gt_rendered.md
      [Archivo .Rmd renderizado en github para visualizar el paso a paso](https://github.com/karbartolome/gt-spotify/blob/main/02_caso_spotify/spotify_gt_rendered.md)
 

```mermaid
flowchart LR
    subgraph r[Estructura de la charla]
        direction LR
        slide[Creando tablas en gt con Spotify API y Bad Bunny]
        spotify[fa:fa-database API Spotify] -->|Llamado a la API| rmd_xaringan[01_slides/rladies_gt_spotify.Rmd]
        slide -->|Slide 28| rmd[02_caso_spotify/spotify_gt.Rmd]
        slide -->|Slide 29| script_tabla[02_caso_spotify/generar_tabla_artista.R]
        spotify --> rmd
        spotify --> script_tabla
        rmd_xaringan --> slide

        style slide fill:#652a75,stroke:#333,color: #ffffff, stroke-width:4px
        style spotify fill:#ffffff, stroke:#000000, stroke-width:2px,color:#000000,stroke-dasharray: 4
        style rmd stroke:#e3b3ff
        style rmd_xaringan stroke:#e3b3ff
        style script_tabla stroke:#e3b3ff
    style r fill: #0000, stroke: #333
    end

```
