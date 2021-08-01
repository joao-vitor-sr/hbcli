#!/bin/sh

usage() {
  printf %s "\
    hbcli - Holy Bible Command Line

  =>  [l]ist    - List Languages.
  =>  [s]select - Select a Language.
  "
  exit 0
}


hbcli_list_languages() {
  find . -type f -name \*.tsv | sed 's/..//;s/\.tsv$//'
}

# === MAIN ===
main() {
  cd "../languages/" || exit

  case $1 in
    s*) hbcli_select_language "$2" ;;
    l*) hbcli_list_languages "$2" ;;
    *) usage
  esac
}

# Ensure that debug mode is never enabled to
# prevent the password from leaking.
set +x

# Ensure that globbing is globally disabled
# to avoid insecurities with word-splitting.
set -f

[ "$1" ] || usage && main "$@"
