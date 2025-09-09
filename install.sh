#!/usr/bin/env bash
# shellcheck disable=2016
set -e

_install_msg_home='Installed efinder in $HOME/.local/bin
if you dont have .local/bin in your path already put this in your shell configuration file
PATH="$PATH":"$HOME"/.local/bin'


[[ -x ./efinder ]] || { chmod +x ./efinder ; printf '%s\n' "making executable"; }

install() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -d $HOME/.local/bin ]]; then 
      cp -v ./efinder "$HOME"/.local/bin/ 
      printf '%s\n' "$_install_msg_home"
    else
      mkdir -vp "$HOME"/.local/bin && cp -v ./efinder "$HOME"/.local/bin/
      printf '%s\n' "$_install_msg_home"
    fi
  else
    cp -v ./efinder /usr/local/bin/
    printf '%s\n' ' Installed efinder system wide'
  fi
  exit
}

uninstall() {
  if [ "$(id -u)" != 0 ]; then 
    if [[ -e $HOME/.local/bin/efinder ]]; then
      rm -v "$HOME"/.local/bin/efinder
      printf '%s\n' "Uninstalled efinder"
      exit
    else
      printf '%s\n' "efinder not found in $HOME/.local/bin"
      exit 1
    fi
  else
    if [[ -e /usr/local/bin/efinder ]]; then
      rm -v /usr/local/bin/efinder
      printf '%s\n' "Uninstalled efinder system wide"
      exit
    else
      printf '%s\n' "efinder not found in /usr/local/bin"
      exit 1
    fi
  fi
}

usage() {
  cat << HERE_EOF
Usage: ./install.sh [option]
To install efinder run:
./install.sh -i

To uninstall efinder run:
./install.sh -u

To install efinder systemd wide run:
sudo ./install.sh -i

To uninstall efinder system wide run:
sudo ./install.sh -u
HERE_EOF
  exit 1
}

while getopts "iu" flag; do
  case "$flag" in
    i) install ;;
    u) uninstall ;;
    \?) usage>&2 ;;
  esac
done

if [ -n "$OPTIND" ]; then
  { usage >&2; }
fi
