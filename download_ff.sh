#!/usr/bin/bash

FF_GECKO_LINUX64=https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
FF_GECKO_MAC=https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-macos.tar.gz

get_uname() {
  echo $(uname -s)
}

get_path_last_dir() {
  IFS=':' read -r -a ARRAY <<< "$PATH"
  echo "${ARRAY[$ARRAY_LENGTH]}"
}


run() {
  U=$(get_uname)
  if [ "$U" == "Linux" ]; then
    URL="$FF_GECKO_LINUX64"

  elif [ "$U" == "Darwin" ]; then
    URL="$FF_GECKO_MAC";

  else
    echo "System not supported"
    exit 2
  fi

  echo "Downloading firefox geckodriver...."

  FILENAME=$(echo "$URL" | grep -o "geckodriver-.*gz$")
  wget "$URL" 

  # extract
  tar xof "$FILENAME"

  # copy to final dir in PATH

  COPY_TO=$(get_path_last_dir)
  echo "Copying geckodriver to" "$COPY_TO"
  cp geckodriver "$COPY_TO"
}

run
