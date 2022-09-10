# Apk-Vulnerabilities-Firebase (BETA)
Script, que te escanea la sección o categoría que quieras de aplicaciones Android, que ofrece la plataforma apkcombo.com.
## Introducción
### ¿Qué es Firebase?
Firebase, es un servicio de Google, que te otorga la comodidad de crear aplicaciones móviles. Como la plataforma está subida en la nube, cualquier dispositivo puede utilizar sus servicios. En la mayoría de casos donde se emplea este servicio, es para utilizarlo como base de datos.
#### Metodología del ataque

- Descarga la APK
- Descompila la APK descargada
- Ir a esta ruta: `res/values/`
- Buscar en el archivo `strings.xml` un enlace estilo este: https://"nombre".firebaseio.com/
- Para ver si está configurada de manera vulnerable, solo hemos de poner el enlace que hemos encontrado, con un `/.json` al final: https://"nombre".firebaseio.com/.json
- Si no vemos que nos ponga permiso denegado, ya tendríamos acceso a la base de datos.
## Script
### ¿Cómo funciona el script?
Este script, lo que hace es te analiza las APK de la web: `apkcombo.com`. Esta web te ofrece descargar juegos o aplicaciones, y dentro de una de esas dos secciones, puedes seleccionar la categoria que tu quieres.
Este script te automatiza toda la metodologia de ataque, en varias APK, para que puedas encontrar las máximas bases expuestas posibles.
### ¿Cómo utilizarlo?
En este script, tienes varias opciones:

> Version actual

| Opciones           | Que hace                                                |  Como utilizarla  |
|:-------------------|:--------------------------------------------------------|:------------------|
| -s                 | Escaneo de unas pocas aplicaciones de la seccion dada   | -s {game o app}
| -c                 | Escaneo de unas pocas aplicaciones de la categoria dada | -c {categoria}
| -h                 | Te muestra el panel de ayuda                            |

> Version deinitiva

Todas la opciones anteriores más:

| Opciones           | Que hace                                                |  Como utilizarla                 |
|:-------------------|:--------------------------------------------------------|:---------------------------------|
| -a                 | Escaneo avanzado, donde analizas todas las APK          | -a -s {game o app} 
|                    |                                                         | -a -c {categoria}
| -r                 | Para que te instale los requerimientos automaticamente  | -r

#### Panel de ayuda:
```
[+] Uso: ./app.sh -s app

[+] IMPORTANTE  Es una version Beta, aun esta en desarollo y pueden haber errores, para minimizarlos, rogamos que evite la desconexion de internet 
                durante la ejecucion del programa

        Version Beta

                Parametro: -s   Seleccionar la seccion que desea escanear: game o app

                Parametro: -c   Seleccionar categoria de los juegos o las aplicaciones que desea escanear

                        Categorias para aplicaciones:

                                tools                   travel-and-local
                                entertainment           food-and-drink
                                communication           maps-and-navigation
                                social                  beauty
                                music-and-audio         comics
                                photography             dating
                                video-players           events
                                personalization         finance
                                productivity            news-and-magazines
                                sports                  weather
                                education               house-and-home
                                lifestyle               libraries-and-demo
                                books-and-reference     medical
                                shopping                parenting
                                business                art-and-design
                                health-and-fitness      auto-and-vehicles

                        Categorias para juegos:

                                game-adventure          game-racing
                                game-action             game-puzzle
                                game-role-playing       game-card
                                game-arcade             game-casino
                                game-casual             game-music
                                game-strategy           game-board
                                game-sports             game-educational
                                game-simulation         game-trivia
                                game-word

                Parametro (opcional): -h        Mostrar este mismo panel de ayuda

        Version Definitiva (Aun se esta desarollando)

                Parametro: -r   Instalar requerimientos necesarios automaticamente

                Parametro: -a   Escaneo avanzado (analiza todos los apk)
```
