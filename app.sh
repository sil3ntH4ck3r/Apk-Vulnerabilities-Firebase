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
  echo -e "${yellowColour}[${endColour}${redColour}+${endColour}${yellowColour}]${endColour} ${redColour}IMPORTANTE${endColour} ${grayColour}\tEs una versión Beta, aún está en desarrollo y puede haber errores, para minimizarlos, rogamos que evite la desconexión de internet \n\t        durante la ejecución del programa${endColour}\n"
  echo -e "\t${turquoiseColour}Versión Beta${endColour}\n"
  echo -e "\t\t${grayColour}Parámetro: ${endColour}${purpleColour}-s \t${endColour}${grayColour}Seleccionar la sección que desea escanear: game o app${endColour}\n"
  echo -e "\t\t${grayColour}Parámetro: ${endColour}${purpleColour}-c \t${endColour}${grayColour}Seleccionar categoría de la sección que desea escanear${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección communication:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}messaging${endColour}\t\t${grayColour}social${endColour}"
  echo -e "\t\t\t\t${grayColour}communication-utilities${endColour}\t\t${grayColour}${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección games:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}action-adventure${endColour}\t${grayColour}arcade${endColour}"
  echo -e "\t\t\t\t${grayColour}card-games${endColour}\t\t${grayColour}casual${endColour}"
  echo -e "\t\t\t\t${grayColour}emulator${endColour}\t\t${grayColour}guides${endColour}"
  echo -e "\t\t\t\t${grayColour}kids${endColour}\t\t\t${grayColour}other-games${endColour}"
  echo -e "\t\t\t\t${grayColour}platformer${endColour}\t\t${grayColour}puzzle${endColour}"
  echo -e "\t\t\t\t${grayColour}racing-sims${endColour}\t\t${grayColour}rpg${endColour}"
  echo -e "\t\t\t\t${grayColour}sports${endColour}\t\t\t${grayColour}strategy${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección lifestyle:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}design-and-fashion${endColour}\t${grayColour}fitness${endColour}"
  echo -e "\t\t\t\t${grayColour}food-and-drink${endColour}\t\t${grayColour}funny${endColour}"
  echo -e "\t\t\t\t${grayColour}gambling${endColour}\t\t${grayColour}general-lifestyle${endColour}"
  echo -e "\t\t\t\t${grayColour}health${endColour}\t\t\t${grayColour}IOT${endColour}"
  echo -e "\t\t\t\t${grayColour}news-magazines${endColour}\t\t${grayColour}religion${endColour}"
  echo -e "\t\t\t\t${grayColour}shopping${endColour}\t\t${grayColour}travel${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección multimedia:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}other-tools${endColour}\t\t${grayColour}other-tools${endColour}"
  echo -e "\t\t\t\t${grayColour}photography${endColour}\t\t${grayColour}tv-radio${endColour}"
  echo -e "\t\t\t\t${grayColour}video${endColour}\t\t\t${grayColour}video-audio-downloaders${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección productivity:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}books-comics-readers${endColour}\t${grayColour}education-languages${endColour}"
  echo -e "\t\t\t\t${grayColour}finance${endColour}\t\t\t${grayColour}personal${endColour}"
  echo -e "\t\t\t\t${grayColour}schedules-calendars${endColour}\t${grayColour}writing-notes${endColour}\n"
  echo -e "\t\t\t${grayColour}Sección tools:${endColour}\n"
  echo -e "\t\t\t\t${grayColour}browsing${endColour}\t\t${grayColour}download-managers${endColour}"
  echo -e "\t\t\t\t${grayColour}file-management${endColour}\t\t${grayColour}general-android${endColour}"
  echo -e "\t\t\t\t${grayColour}keyboards${endColour}\t\t${grayColour}launchers${endColour}"
  echo -e "\t\t\t\t${grayColour}networks${endColour}\t\t${grayColour}personalization${endColour}"
  echo -e "\t\t\t\t${grayColour}root${endColour}\t\t\t${grayColour}security-performance${endColour}"
  echo -e "\t\t\t\t${grayColour}weather${endColour}\n"
  echo -e "\t\t${grayColour}Parámetro (opcional): ${endColour}${purpleColour}-h \t${endColour}${grayColour}Mostrar este mismo panel de ayuda${endColour}\n"
  echo -e "\t${turquoiseColour}Versión Definitiva (Aún se esta desarollando)${endColour}\n"
  echo -e "\t\t${grayColour}Parámetro: ${endColour}${purpleColour}-r \t${endColour}${grayColour}Instalar requerimientos necesarios automaticamente${endColour}\n"
  echo -e "\t\t${grayColour}Parámetro: ${endColour}${purpleColour}-a \t${endColour}${grayColour}Escaneo avanzado (analiza todos los apk)${endColour}\n"
  exit 1
}

validSections=("communication" "games" "lifestyle" "multimedia" "productivity" "tools")
validCategory=("messaging" "social" "communication-utilities" "action-adventure" "arcade" "card-games" "casual" "emulator" "guides" "kids" "other-games" "platformer" "puzzle" "racing-sims" "rpg" "sports" "strategy" "design-and-fashion" "fitness" "food-and-drink" "funny" "gambling" "general-lifestyle" "health" "IOT" "news-magazines" "religion" "shopping" "travel" "other-tools" "other-tools" "photography" "tv-radio" "video" "video-audio-downloaders" "books-comics-readers" "education-languages" "finance" "personal" "schedules-calendars" "writing-notes" "browsing" "download-managers" "file-management" "general-android" "keyboards" "launchers" "networks" "personalization" "root" "security-performance" "weather")
numero=1

categoria() {
  local categoria="$1"
  
  if [[ ! " ${validCategory[@]} " =~ " ${categoria} " ]]; then
    echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Selecciona una sección correcta: ${validCategory[*]}, también puede ser que le falte la conexión a internet${endColour}"
    exit 1
  fi

  obtenerRutasApkCategoria
  #procesarEnlacesArchivo "enlacesDescarga.txt"
  comprobarBasesDeDatos
}

seccion() {
  local seccion="$1"
  
  if [[ ! " ${validSections[@]} " =~ " ${seccion} " ]]; then
    echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Selecciona una sección correcta: ${validCategory[*]}, también puede ser que le falte la conexión a internet${endColour}"
    exit 1
  fi

  obtenerRutasApkSeccion
  #procesarEnlacesArchivo "enlacesDescarga.txt"
  comprobarBasesDeDatos
}

obtenerRutasApkCategoria() {
  echo -e "${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Por favor, indica cuántas páginas deseas escanear. Cada página contiene 33 aplicaciones (APKs). Si no especificas un número, se escaneará solo la primera página por defecto.${endColour}"
  read numero
  if [[ -z "$numero" ]]; then
    numero=1
  fi
  for ((i=1;i<=$numero;i++)); do
    response=$(curl -s "https://en.uptodown.com/android/$categoria/$i")
    if [[ "$response" == *"404 Not Found"* ]]; then
      echo "Página no encontrada, terminando el bucle."
      break
    fi
    echo "$response" | grep "/android" | grep -o '<a href="[^"]*"' | sed 's/<a href="//; s/"$//' | grep -E 'https?://[^/]*\.en\.uptodown\.com/android' | sort | uniq | sed 's/$/\/download/' >> rutas.txt
  done
  comprobarRutas
}

obtenerRutasApkSeccion() {
  curl -s "https://en.uptodown.com/android/$seccion" | grep "/android" | grep -o '<a href="[^"]*"' | sed 's/<a href="//; s/"$//' | grep -E 'https?://[^/]*\.en\.uptodown\.com/android' | sort | uniq | sed 's/$/\/download/' > rutas.txt
  comprobarRutas
}

comprobarRutas() {
  while read -r ruta; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$ruta")
    if [ "$status_code" -eq 200 ]; then
      echo "La ruta $ruta es accesible"
      obtenerEnlacesDescarga "$ruta"
    else
      echo "La ruta $ruta retornó un código de estado $status_code"
    fi
  done < rutas.txt
}

obtenerEnlacesDescarga() {
  ruta="$1"
  archivo_enlaces="enlacesDescarga.txt"
  archivo_errores="errorEnlaceDescarga.txt"

  # Realizar la solicitud con curl y filtrar los enlaces de descarga
  curl_output=$(curl -s "$ruta" | grep "data-url" | grep -oP 'data-url="\K[^"]*')
  
  status_code=$(curl -s -o /dev/null -w "%{http_code}" "$curl_output")
  if [ "$status_code" -eq 302 ]; then
    echo "$curl_output" >> "$archivo_enlaces"
    wget -O "${numero}.apk" "$curl_output"
    apktool d "${numero}.apk"
    cat "${numero}/res/values/strings.xml" | grep '<string name="firebase_database_url"' | grep -oP '\>.*?\<' | tr -d "<>" | sed 's/$/\/.json/' | sort | uniq >> enlacesBaseDeDatos.txt 2>/dev/null
    rm "${numero}.apk"
    rm -rf "${numero}"
    ((numero++))
  else
    echo "$curl_output" >> "$archivo_errores"
  fi
}

procesarEnlacesArchivo() {
  local archivo="$1"
  local numero=1

  while read -r enlace; do
    wget -O "$numero.apk" "$enlace"
    apktool d "$numero.apk"
    cat $numero/res/values/strings.xml | grep '<string name="firebase_database_url"' | grep -oP '\>.*?\<' | tr -d "<>" | sed 's/$/\/.json/' | sort | uniq >> enlacesBaseDeDatos.txt 2>/dev/null
    rm "$numero.apk"
    rm -rf "$numero"
    ((numero++))
  done < "$archivo"
}

comprobarBasesDeDatos() {
  local enlaces_archivo="enlacesBaseDeDatos.txt"
  local accesibles_archivo="basesFinales.txt"
  local contador=0
  local encontradas=false

  while IFS= read -r enlace; do
    if curl -s -I -X GET "$enlace" | grep -m 1 "HTTP" | grep -B1 "200" > /dev/null; then
      echo "$enlace" >> "$accesibles_archivo"
      contador=$((contador+1))
      encontradas=true
    fi
  done < "$enlaces_archivo"

  if $encontradas; then
    echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${greenColour}SUCCESS${endColour} ${grayColour}Han sido encontradas $contador bases de datos vulnerables${endColour}"
    cat "$accesibles_archivo"
    echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}Enlaces de las bases de datos, guardados en: basesFinales.txt ${endColour}"
  else
    echo -e "\n${yellowColour}[${endColour}${blueColour}+${endColour}${yellowColour}]${endColour} ${blueColour}INFO${endColour} ${grayColour}No se han encontrado bases de datos accesibles ${endColour}"
  fi
}


# Ctrl + C 
trap ctrl_c INT

seccion=""
categoria=""
numero=""

flag_s=false
flag_c=false
flag_p=false

while getopts "s:c:h" arg; do
  case $arg in
    c)
      if [[ -z $OPTARG || ${OPTARG:0:1} == "-" ]]; then
        echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Valor inválido para la opción -c (categoría)${endColour}"
        sleep 1;
        helpPanel
        exit 1
      fi
      categoria=$OPTARG
      flag_c=true
      ;;
    s)
      if [[ -z $OPTARG || ${OPTARG:0:1} == "-" ]]; then
        echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}Valor inválido para la opción -s (sección)${endColour}"
        sleep 1;
        helpPanel
        exit 1
      fi
      seccion=$OPTARG
      flag_s=true
      ;;
    h)
      helpPanel
      exit 0
      ;;
  esac
done

if $flag_s && $flag_c ; then
  echo -e "\n${yellowColour}[${endColour}${redColour}!${endColour}${yellowColour}]${endColour} ${redColour}ERROR${endColour} ${grayColour}No puedes especificar simultáneamente las opciones -s (sección) y -c (categoría)${endColour}"
  exit 1;
fi

if $flag_s ; then
  echo -e "\n${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${grayColour}Accediendo a la sección: $seccion${endColour}"
  seccion $seccion
  # Función sección
  exit 1;
fi

if $flag_c ; then
  echo -e "${yellowColour}[${endColour}${greenColour}+${endColour}${yellowColour}]${endColour} ${grayColour}Accediendo a la categoría: $categoria${endColour}"
  categoria $categoria
  exit 1;
fi