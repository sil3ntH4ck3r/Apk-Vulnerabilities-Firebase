# Apk-Vulnerabilities-Firebase (BETA)
Script, que te escanea la sección o categoría que quieras de aplicaciones Android, que ofrece la plataforma `en.uptodown.com`.
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
Este script, lo que hace es te analiza las APK de la web: `https://en.uptodown.com/`. Esta web te ofrece descargar juegos o aplicaciones, y dentro de una de esas dos secciones, puedes seleccionar la categoria que tu quieres.
Este script te automatiza toda la metodologia de ataque, en varias APK, para que puedas encontrar las máximas bases expuestas posibles.
### ¿Cómo utilizarlo?
En este script, tienes varias opciones:

> Version actual

| Opciones           | Que hace                                                |  Como utilizarla  |
|:-------------------|:--------------------------------------------------------|:------------------|
| -s                 | Escaneo de unas pocas aplicaciones de la sección dada   | -s {sección}
| -c                 | Escaneo de unas pocas aplicaciones de la categoria dada | -c {categoria}
| -h                 | Te muestra el panel de ayuda                            |

> Version deinitiva

Todas la opciones anteriores más:

| Opciones           | Que hace                                                |  Como utilizarla                 |
|:-------------------|:--------------------------------------------------------|:---------------------------------|
| -a                 | Poder poner un apk propio, para que te lo escanee       | -a {aplicativo.apk} 
|                    |                                                         | -a -c {categoria}
| -r                 | Para que te instale los requerimientos automaticamente  | -r

#### Panel de ayuda:
```
[+] Uso: ./app.sh -s app

[+] IMPORTANTE 	Es una versión Beta, aún está en desarrollo y puede haber errores, para minimizarlos, rogamos que evite la desconexión de internet 
	       durante la ejecución del programa

	Versión Beta

		Parámetro: -s 	Seleccionar la sección que desea escanear: game o app

		Parámetro: -c 	Seleccionar categoría de la sección que desea escanear

			Sección communication:

				messaging		social
				communication-utilities		

			Sección games:

				action-adventure	arcade
				card-games		casual
				emulator		guides
				kids			other-games
				platformer		puzzle
				racing-sims		rpg
				sports			strategy

			Sección lifestyle:

				design-and-fashion	fitness
				food-and-drink		funny
				gambling		general-lifestyle
				health			IOT
				news-magazines		religion
				shopping		travel

			Sección multimedia:

				other-tools		other-tools
				photography		tv-radio
				video			video-audio-downloaders

			Sección productivity:

				books-comics-readers	education-languages
				finance			personal
				schedules-calendars	writing-notes

			Sección tools:

				browsing		download-managers
				file-management		general-android
				keyboards		launchers
				networks		personalization
				root			security-performance
				weather

		Parámetro (opcional): -h 	Mostrar este mismo panel de ayuda

	Versión Definitiva (Aún se esta desarollando)

		Parámetro: -r 	Instalar requerimientos necesarios automaticamente

		Parámetro: -a 	Escaneo avanzado (analiza todos los apk)
```
