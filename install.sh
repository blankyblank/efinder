#!/usr/bin/env bash

set -e

[[ -x ./efinder ]] || { chmod +x ./efinder ; echo "making executable"; }

install() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -d $HOME/.local/bin ]]; then 
      cp -v ./efinder "$HOME"/.local/bin/ 
      echo -e '    Installed efinder in $HOME/.local/bin
      if you dont have .local/bin in your path already put this in your shell configuration file \n
      PATH="$PATH":"$HOME"/.local/bin \n'
    else
      mkdir -vp "$HOME"/.local/bin && cp -v ./efinder "$HOME"/.local/bin/
      echo -e '    Installed efinder in $HOME/.local/bin
      if you dont have .local/bin in your path already put this in your shell configuration file \n
      PATH="$PATH":"$HOME"/.local/bin \n'
    fi
  else 
    cp -v ./efinder /usr/local/bin/
    echo -e ' Installed efinder system wide'
  fi
}

uninstall() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -a $HOME/.local/bin/efinder ]]; then
      rm "$HOME"/.local/bin/efinder
      echo "Uninstalled efinder"
      exit
    else
      echo "efinder not found in $HOME/.local/bin"
      exit 1
    fi
  else
    if [[ -a /usr/local/bin/efinder ]]; then
      rm /usr/local/bin/efinder
      echo "Uninstalled efinder system wide"
      exit
    else
      echo "efinder not found in /usr/local/bin"
      exit 1
    fi
  fi
}

usage() {
  echo -e "
  To install efinder run:
  ./install.sh -i\n
  To uninstall efinder run:
  ./install.sh -u\n
  To install efinder systemd wide run:
  sudo ./install.sh -i\n
  To uninstall efinder system wdie run:
  sudo ./install.sh -u"
}

no_args=0
while getopts "iu" flag; do
  case "$flag" in
    i) install
    ;;
    u) uninstall
    ;;
    ?) usage ; exit
    ;;
  esac
  no_args=1
done
if [ -z "$no_args" ]; then
  { usage >&2; exit 1; }
else
  usage
fi
