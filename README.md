Proyecto: Entrenamiento Científico · Hipertrofia

Contenido:
- index.html: portada con hero y navegación
- blog.html: artículo principal sobre hipertrofia
- gallery.html: galería de ejercicios
- videos.html: página con videos embebidos
- css/styles.css: estilos compartidos
- js/script.js: JavaScript mínimo
- carpeta images/: coloca aquí las imágenes

Instrucciones rápidas (Windows PowerShell):
1) Copia este proyecto a una carpeta en tu equipo.
2) Crea la carpeta "images" dentro de la carpeta del proyecto y añade las imágenes siguientes (puedes usar tus propias fotos):
   - images/hero.jpg     -> imagen para el hero (portada)
   - images/post1.jpg    -> imagen del artículo del blog
   - images/img1.jpg ... images/img6.jpg -> miniaturas para la galería
 
  Sugerencia de nombres para las imágenes que adjuntaste en la conversación (guárdalas con estos nombres en la carpeta `images/`):

  - `hero.jpg`  -> imagen tipo portada (recomendado: la imagen de Jeff Nippard - portada del programa)
  - `post1.jpg` -> imagen principal del artículo (recomendado: la foto con dominadas/pull-ups)
  - `img1.jpg`  -> banner o foto 1 (recomendado: banner "How Jeff Nippard Dominates...")
  - `img2.jpg`  -> banner o foto 2 (otro banner o imagen promocional)
  - `img3.jpg`  -> (opcional) añade otra foto de ejercicios
  - `img4.jpg`  -> (opcional) añade otra foto de ejercicios
  - `img5.jpg`  -> (opcional)
  - `img6.jpg`  -> (opcional)

  Vídeo proporcionado:
  - YouTube: https://youtu.be/OpRMRhr0Ycc -> se ha insertado automáticamente en `videos.html`
  - YouTube adicional: https://youtu.be/popGXI-qs98 -> insertado en `videos.html`
  - YouTube adicional: https://youtu.be/vD-dEl7R2Bg -> insertado en `videos.html`

Placeholder de imágenes:
- Si una imagen falta, el sitio mostrará `images/placeholder.svg`. Si quieres que use las imágenes reales que adjuntaste, guárdalas con los nombres indicados en la carpeta `images/`.

  Pasos:
  1) Crea la carpeta `images/` dentro del proyecto (si no existe).
  2) Guarda las imágenes con los nombres sugeridos arriba.
  3) Abre `index.html` con un navegador (o usa un servidor local). Si quieres, puedo reemplazar las entradas `img3..img6` por otras imágenes si las subes.
  3) Abre cualquiera de las páginas en tu navegador (por ejemplo, abre index.html) para ver el sitio.

  Servidor PowerShell (si no tienes Python/Node):
  1) Desde PowerShell cámbiate a la carpeta que contiene `fifty-coffees` y ejecuta:

  ```powershell
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\fifty-coffees\scripts\serve.ps1
  ```

  2) Abre en el navegador:

  http://localhost:8000/fifty-coffees/index.html

  Nota: ejecutar scripts puede requerir permisos en tu sistema; el comando anterior cambia la política de ejecución solo para la sesión actual.

Notas:
- Los iconos usan Font Awesome vía CDN; necesitas conexión para cargarlos.
- En videos.html sustituye VIDEO_ID_1 y VIDEO_ID_2 por los IDs reales de YouTube/Vimeo.
- Si quieres desplegarlo localmente con un servidor simple, desde PowerShell ejecuta:

  python -m http.server 8000

y abre http://localhost:8000/fifty-coffees/index.html

Ayuda adicional: si quieres que adapte los textos a un tono más académico o que genere entradas de blog adicionales (plantillas), dímelo y las creo.