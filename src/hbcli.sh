#!/bin/bash

unset ACTION

usage() {
  printf %s "\
    hbcli - Holy Bible Command Line

  =>  [l]ist                       - List Languages.
  =>  [r]read [language] <options> - Read Bible.
  "
  exit 0
}

hbcli_list_languages() {
  find . -type f -name \*.tsv | sed 's/..//;s/\.tsv$//'
}

exit_abnormal() {
  usage
  exit 1
}

read_book() {
  printf "read"
}

list_books() {
  fileOfLanguage="$1.tsv"
  if [ ! -e "$fileOfLanguage" ]; then
    exit_abnormal
  fi

  cat "$fileOfLanguage" | awk -v cmd=list "$(cat hbcli.awk)"
  exit
}

# Ensure that debug mode is never enabled to
# prevent the password from leaking.
set +x

# Ensure that globbing is globally disabled
# to avoid insecurities with word-splitting.
set -f


mkdir -p  "${HBCLI_DIR:=${XDG_DATA_HOME:=$HOME/.local/share}/hbcli}"
cd "${HBCLI_DIR:=${XDG_DATA_HOME:=$HOME/.local/share}/hbcli}" || exit

SELECTED_IDIOM=""
SELECTED_BOOK=""
ACTION=""

while getopts ':li:r:' options; do

  case "$options" in
    r)
      ACTION=READ
      BOOK=${OPTARG}
      ;;
    l)
      ACTION=LIST
      ;;
    i)
      SELECTED_IDIOM=${OPTARG}
      ;;
    :)
      printf "%s" "Error: -{$OPTARG} requires an argument."
      exit_abnormal
      ;;
    *) exit_abnormal ;;
  esac
done

if [ "$SELECTED_IDIOM" = "" ]; then
  hbcli_list_languages
  exit 0;
fi


case $ACTION in
  READ) read_book "$BOOK" ;;
  LIST) list_books "$SELECTED_IDIOM" ;;
esac
