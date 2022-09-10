#!/bin/bash

#COSAS QUE QUIERO AÑADIR/ARREGLAR

  #AÑADIR COMPROBACION DE ENLACES MEDIANTE CURL Y WC $?, Y QUE TE PONGA LOS QUE SE HAN ELIMINADO PORQUE NO FUNCIONABA O INTENET ARREGLAR EL ENLACE

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Functions

function ctrl_c(){
  echo -e "\n\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${grayColour}Saliendo...${endColour}"

  for base in $(cat enlacesBaseDeDatos.txt);do echo $base >> comprobandoBases.txt | curl -I -X GET $base | grep "HTTP" >> comprobandoBases.txt;done

  cat comprobandoBases.txt | grep -B1 "200" | head -n 1 > basesFinales

  numeroBasesDatos=$(cat comprobandoBases.txt | wc -l)

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $numeroBasesDatos bases de datos vulnerables${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Enlaces de las bases de datos, gurdadas en: basesFinales.txt ${endColour}"

  exit 1
}

function helpPanel(){
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${grayColour}Uso: ./app.sh -s app${endColour}\n"
  echo -e "${yellowColour}[${endColour}${redColour}+${endColour}${yellowColour}]${endColour} ${redColour}IMPORTANTE${endColour} ${grayColour}\tEs una version Beta, aun esta en desarollo y pueden haber errores, para minimizarlos, rogamos que evite la desconexion de internet \n\t        durante la ejecucion del programa${endColour}\n"
  echo -e "\t${turquoiseColour}Version Beta${endColour}\n"
  echo -e "\t\t${grayColour}Parametro: ${endColour}${purpleColour}-s \t${endColour}${grayColour}Seleccionar la seccion que desea escanear: game o app${endColour}\n"
  echo -e "\t\t${grayColour}Parametro: ${endColour}${purpleColour}-c \t${endColour}${grayColour}Seleccionar categoria de los juegos o las aplicaciones que desea escanear${endColour}\n"
  echo -e "\t\t\t${grayColour}Categorias para aplicaciones:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}tools${endColour}\t\t\t${grayColour}travel-and-local${endColour}"
  echo -e "\t\t\t\t${grayColour}entertainment${endColour}\t\t${grayColour}food-and-drink${endColour}"
  echo -e "\t\t\t\t${grayColour}communication${endColour}\t\t${grayColour}maps-and-navigation${endColour}"
  echo -e "\t\t\t\t${grayColour}social${endColour}\t\t\t${grayColour}beauty${endColour}"
  echo -e "\t\t\t\t${grayColour}music-and-audio${endColour}\t\t${grayColour}comics${endColour}"
  echo -e "\t\t\t\t${grayColour}photography${endColour}\t\t${grayColour}dating${endColour}"
  echo -e "\t\t\t\t${grayColour}video-players${endColour}\t\t${grayColour}events${endColour}"
  echo -e "\t\t\t\t${grayColour}personalization${endColour}\t\t${grayColour}finance${endColour}"
  echo -e "\t\t\t\t${grayColour}productivity${endColour}\t\t${grayColour}news-and-magazines${endColour}"
  echo -e "\t\t\t\t${grayColour}sports${endColour}\t\t\t${grayColour}weather${endColour}"
  echo -e "\t\t\t\t${grayColour}education${endColour}\t\t${grayColour}house-and-home${endColour}"
  echo -e "\t\t\t\t${grayColour}lifestyle${endColour}\t\t${grayColour}libraries-and-demo${endColour}"
  echo -e "\t\t\t\t${grayColour}books-and-reference${endColour}\t${grayColour}medical${endColour}"
  echo -e "\t\t\t\t${grayColour}shopping${endColour}\t\t${grayColour}parenting${endColour}"
  echo -e "\t\t\t\t${grayColour}business${endColour}\t\t${grayColour}art-and-design${endColour}"
  echo -e "\t\t\t\t${grayColour}health-and-fitness${endColour}\t${grayColour}auto-and-vehicles${endColour}\n"
  echo -e "\t\t\t${grayColour}Categorias para juegos:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}game-adventure${endColour}\t\t${grayColour}game-racing${endColour}"
  echo -e "\t\t\t\t${grayColour}game-action${endColour}\t\t${grayColour}game-puzzle${endColour}"
  echo -e "\t\t\t\t${grayColour}game-role-playing${endColour}\t${grayColour}game-card${endColour}"
  echo -e "\t\t\t\t${grayColour}game-arcade${endColour}\t\t${grayColour}game-casino${endColour}"
  echo -e "\t\t\t\t${grayColour}game-casual${endColour}\t\t${grayColour}game-music${endColour}"
  echo -e "\t\t\t\t${grayColour}game-strategy${endColour}\t\t${grayColour}game-board${endColour}"
  echo -e "\t\t\t\t${grayColour}game-sports${endColour}\t\t${grayColour}game-educational${endColour}"
  echo -e "\t\t\t\t${grayColour}game-simulation${endColour}\t\t${grayColour}game-trivia${endColour}"
  echo -e "\t\t\t\t${grayColour}game-word${endColour}\n"
  echo -e "\t\t${grayColour}Parametro (opcional): ${endColour}${purpleColour}-h \t${endColour}${grayColour}Mostrar este mismo panel de ayuda${endColour}\n"
  echo -e "\t${turquoiseColour}Version Definitiva (Aun se esta desarollando)${endColour}\n"
  echo -e "\t\t${grayColour}Parametro: ${endColour}${purpleColour}-r \t${endColour}${grayColour}Instalar requerimientos necesarios automaticamente${endColour}\n"
  echo -e "\t\t${grayColour}Parametro: ${endColour}${purpleColour}-a \t${endColour}${grayColour}Escaneo avanzado (analiza todos los apk)${endColour}\n"
  exit 1
}

function escaneoBasico(){

  curl -s -X GET "https://apkcombo.com/category/test" | html2text | grep "Not Found" > notFoundProgram.tmp

  curl -s -X GET "https://apkcombo.com/category/$seccion" | html2text | grep "Not Found" > notFoundUser.tmp

  if [[ $(cat notFoundUser.tmp) = $(cat notFoundProgram.tmp) ]]; then
    echo -e "\n\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Selecciona una seccion correcta: game o app, tambien puede ser que le falte la conexiona internet${endColour}"
    rm notFoundUser.tmp notFoundProgram.tmp
    helpPanel
  fi

  rm notFoundUser.tmp notFoundProgram.tmp

  paginaWeb="https://apkcombo.com"
  enlacesEliminados="0"
  downloadApk="download/apk"
  finalEnlace="&fp=2a20841eb389e1c154fb74cb113c37ee&ip=83.50.152.219"
  mkdir App
  cd App
  mkdir Aplicaciones

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Extrayendo enlaces de descarga${endColour}"  

  for enlace in $(curl -s -X GET "https://apkcombo.com/category/$seccion/" | grep -P '<a href=".*?"' | grep -oP '\".*?\"' | tr -d '"' | grep -A4 "gif" | grep -oP '\/.*' | grep -v "/1.gif" | sed '/rw/d' | sort | uniq); do echo $paginaWeb$enlace$downloadApk >> "$seccion"Download.txt; done
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces de descarga extraidos correctamente${endColour}"

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Extrayendo enlaces de los APK (puede tardar un rato)${endColour}"
  for test in $(cat "$seccion"Download.txt); do curl -s -X GET $test | grep -oP '\".*?\"' | tr -d '"' | grep 'https://download.apkcombo.com' | head -n 1 >> enlaceApk.txt; done
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces de descarga de los APK, extraidos correctamente${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Comprobando enlaces${endColour}"
  cat enlaceApk.txt | grep "https://download.apkcombo.com" | sed 's/$/\&fp=2a20841eb389e1c154fb74cb113c37ee&ip=83.50.152.219/' >> enlacesDefinitivos.txt
  cat enlaceApk.txt | grep -v "https://download.apkcombo.com" >> enlacesDefinitivos.txt

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces funcionando correctamente${endColour}"

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descargando: $seccion ${endColour}"

  totalDeAplicaciones=$(cat enlacesDefinitivos.txt | wc -l)

  cd Aplicaciones

  numeroNombre="0"
  # CEREBRO DEL SCRIPT
  for enlace in $(cat ../enlacesDefinitivos.txt);do let "numeroNombre+=1" && echo -e "\n\t${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descargando: $numeroNombre/$totalDeAplicaciones${endColour}\n" && curl -o "$numeroNombre.apk" -L $enlace && apktool d $numeroNombre.apk && grep -r -i '<string name="firebase_database_url"' >> basesDeDatosExpuestas.txt 2>/dev/null | rm -R "$numeroNombre.apk" | rm -R "$numeroNombre"; done
   
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Descargado correctamente${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Puede ser que algunas aplicaciones no se hayan descargado${endColour}"

  #ls > aplicacionesDescargadas.txt

  #echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descomprimiendo aplicaciones (puede tardar una rato)${endColour}"

  numeroAplicaciones="0" # Para descomprimir numeroAplicaciones/numeroTotalAplicacionesDescargadas
  numeroTotalAplicacionesDescargadas=$(cat aplicacionesDescargadas.txt | wc -l)

  #for aplicaciones in $(cat aplicacionesDescargadas.txt);do let "numeroAplicaciones++" && apktool d $aplicaciones && echo -e "\n\t${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descomprimiendo: $numeroAplicaciones/$numeroTotalAplicacionesDescargadas${endColour}\n";done

  #echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Descomprimido correctamente${endColour}"

  #echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Buscando base de datos expuestas (puede tardar un rato)${endColour}"

  #grep -r -i '<string name="firebase_database_url"' > basesDeDatosExpuestas.txt

  numeroBasesDatos=$(cat basesDeDatosExpuestas.txt | wc -l)

  cat basesDeDatosExpuestas.txt | grep -oP '\>.*?\<' | tr -d "<>" | sed 's/$/\/.json/' >> enlacesBaseDeDatos.txt

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $numeroBasesDatos bases de datos expuestas${endColour}"

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Comprobando si se pueden acceder a las bases de datos${endColour}"

  for base in $(cat enlacesBaseDeDatos.txt);do echo $base >> comprobandoBases.txt | curl -I -X GET $base | grep "HTTP" >> comprobandoBases.txt;done

  cat comprobandoBases.txt | grep -B1 "200" | head -n 1 > basesFinales

  numeroBasesDatos=$(cat basesFinales | wc -l)

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $numeroBasesDatos bases de datos vulnerables${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Enlaces de las bases de datos, gurdadas en: basesFinales.txt ${endColour}"

}

function escanoBasicoEspecifico()
{

  paginaWeb="https://apkcombo.com"
  enlacesEliminados="0"
  downloadApk="download/apk"

  mkdir App
  cd App
  mkdir Aplicaciones

  curl -s -X GET "https://apkcombo.com/category/test" | html2text | grep "Not Found" > notCategoriaFoundProgram.tmp

  curl -s -X GET "https://apkcombo.com/category/$categoria" | html2text | grep "Not Found" > notCategoriaFoundUser.tmp

  if [[ $(cat notCategoriaFoundUser.tmp) = $(cat notCategoriaFoundProgram.tmp) ]]; then
    echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Categoria no encontrada, tambien puede ser que le falte la conexiona internet${endColour}"
    rm notCategoriaFoundUser.tmp notCategoriaFoundProgram.tmp
    helpPanel
  fi

  rm notCategoriaFoundUser.tmp notCategoriaFoundProgram.tmp

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Extrayendo enlaces de descarga${endColour}"  

  for enlace in $(curl -s -X GET "https://apkcombo.com/category/$categoria/" | grep -P '<a href=".*?"' | grep -oP '\".*?\"' | tr -d '"' | grep -A4 "gif" | grep -oP '\/.*' | grep -v "/1.gif" | sed '/rw/d' | sort | uniq); do echo $paginaWeb$enlace$downloadApk >> "$categoria"Download.txt; done
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces de descarga extraidos correctamente${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Extrayendo enlaces de los APK (puede tardar un rato)${endColour}"
  for test in $(cat "$categoria"Download.txt); do curl -s -X GET $test | grep -oP '\".*?\"' | tr -d '"' | grep 'https://download.apkcombo.com' | head -n 1 >> enlaceApk.txt; done
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces de descarga de los APK, extraidos correctamente${endColour}"

  cat enlaceApk.txt | grep "https://download.apkcombo.com" | sed 's/$/\&fp=ba3333193e96e2ef4383b7c58146eeaa&ip=83.50.7.57/' | sort | uniq >> enlacesDefinitivos.txt
  #cat enlaceApk.txt | grep -v "https://download.apkcombo.com" | sort | uniq >> enlacesDefinitivos.txt

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Enlaces funcionando correctamente${endColour}"

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descargando: $seccion ${endColour}"
  
  #cat enlacesDefinitivos.txt | grep -oP '\/.*?\/' | tr -d "//" | sed '/^ *$/d' > nombres.txt

  totalDeAplicaciones=$(cat enlacesDefinitivos.txt | wc -l)

  cd Aplicaciones

  numeroNombre="0"

  # CEREBRO DEL SCRIPT

  for enlace in $(cat ../enlacesDefinitivos.txt);do let "numeroNombre+=1" && echo -e "\n\t${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descargando: $numeroNombre/$totalDeAplicaciones${endColour}\n" && curl -o "$numeroNombre.apk" -L $enlace && apktool d $numeroNombre.apk && grep -r -i '<string name="firebase_database_url"' >> basesDeDatosExpuestas.txt 2>/dev/null | rm -R "$numeroNombre.apk" | rm -R "$numeroNombre"; done
   
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Descargado correctamente${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Puede ser que algunas aplicaciones no se hayan descargado${endColour}"

  #ls > aplicacionesDescargadas.txt

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descomprimiendo aplicaciones (puede tardar una rato)${endColour}"

  numeroAplicaciones="0" # Para descomprimir numeroAplicaciones/numeroTotalAplicacionesDescargadas
  numeroTotalAplicacionesDescargadas=$(cat aplicacionesDescargadas.txt | wc -l)

  #for aplicaciones in $(cat aplicacionesDescargadas.txt);do let "numeroAplicaciones++" && apktool d $aplicaciones && echo -e "\n\t${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Descomprimiendo: $numeroAplicaciones/$numeroTotalAplicacionesDescargadas${endColour}\n";done

  #echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Descomprimido correctamente${endColour}"

  #echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Buscando base de datos expuestas (puede tardar un rato)${endColour}"

  #grep -r -i '<string name="firebase_database_url"' >> basesDeDatosExpuestas.txt 2>/dev/null

  numeroBasesDatos=$(cat basesDeDatosExpuestas.txt | wc -l)

  cat basesDeDatosExpuestas.txt | grep -oP '\>.*?\<' | tr -d "<>" | sed 's/$/\/.json/' >> enlacesBaseDeDatos.txt

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $numeroBasesDatos bases de datos expuestas${endColour}"

  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Comprobando si se pueden acceder a las bases de datos${endColour}"

  for base in $(cat enlacesBaseDeDatos.txt);do echo $base >> comprobandoBases.txt | curl -I -X GET $base | grep "HTTP" >> comprobandoBases.txt;done

  cat comprobandoBases.txt | grep -B1 "200" | head -n 1 > basesFinales

  numeroBasesDatos=$(cat basesFinales | wc -l)

  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $numeroBasesDatos bases de datos vulnerables${endColour}"
  echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Enlaces de las bases de datos, gurdadas en: basesFinales.txt ${endColour}"

}


# Ctrl + C 
trap ctrl_c INT

declare -i contador=0; while getopts "s:c:h a" arg; do
  case $arg in
    c) categoria=$OPTARG && let contador+=2;;
    s) seccion=$OPTARG && let contador+=1;;
    a) avanzado= let contador+=10;;
    h) helpPanel;;
  esac
done

if [ $contador -eq 0 ]; then
  echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Selecciona la categoria${endColour}"
  helpPanel
  exit 1
fi

if [ $contador -eq 3 ]; then
  echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Solo puedes seleccionar la seccion o la categoria, no las dos a la vez${endColour}"
  helpPanel
  exit 1
fi

if [ $contador -eq 13 ];then
  echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Para hacer el escaneo solo has de escoger la seccion o la categoria, no las dos a la vez${endColour}"
  helpPanel
  exit 1

fi

if [ $contador -eq 1 ]; then
  escaneoBasico $seccion #escaneoBasico
fi

if [ $contador -eq 2 ]; then
  escanoBasicoEspecifico $categoria #escanoBasicoEspecifico
fi
