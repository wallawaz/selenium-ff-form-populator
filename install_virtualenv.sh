#!/usr/bin/bash

get_uname() {
  echo $(uname -s)
}
linux_install() {
  apt-get install python-virtualenv
}
mac_install() {
  brew install python-virtualenv
}


U=$(get_uname)
if [ "$U" == "Linux" ]; then
  linux_install

elif [ "$U" == "Darwin" ]; then
  mac_install

else
  echo "System not supported"
  exit 2
fi
