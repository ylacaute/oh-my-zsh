
# Override mvn plugin just for customize colors
# Based on https://gist.github.com/1027800

# All possibilites : https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html

BOLD=`tput bold`
NORMAL=`tput dim`
UNDERLINE_ON=`tput smul`
UNDERLINE_OFF=`tput rmul`

TEXT_BLACK=`tput setaf 0`
TEXT_RED=`tput setaf 1`
TEXT_GREEN=`tput setaf 2`
TEXT_YELLOW=`tput setaf 3`
TEXT_BLUE=`tput setaf 4`
TEXT_MAGENTA=`tput setaf 5`
TEXT_CYAN=`tput setaf 6`
TEXT_WHITE=`tput setaf 7`

BACKGROUND_BLACK=`tput setab 0`
BACKGROUND_RED=`tput setab 1`
BACKGROUND_GREEN=`tput setab 2`
BACKGROUND_YELLOW=`tput setab 3`
BACKGROUND_BLUE=`tput setab 4`
BACKGROUND_MAGENTA=`tput setab 5`
BACKGROUND_CYAN=`tput setab 6`
BACKGROUND_WHITE=`tput setab 7`
RESET_FORMATTING=`tput sgr0`
#RESET_FORMATTING=${RESET_FORMATTING}${NORMAL}

MAIN_TEXT_COLOR=${TEXT_WHITE}
INFO_COLOR=${TEXT_CYAN}
ERROR_COLOR=${TEXT_RED}
WARN_COLOR=${TEXT_YELLOW}
SUCCESS_COLOR=${BOLD}${TEXT_GREEN}

mvn-color() {
  (
  # Filter mvn output using sed. Before filtering set the locale to C, so invalid characters won't break some sed implementations
  unset LANG
  LC_CTYPE=C mvn $@ | sed -e "s/\(\[INFO\]\)\(.*\)/${INFO_COLOR}\1${MAIN_TEXT_COLOR}\2${RESET_FORMATTING}/g" \
               -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BOLD}${SUCCESS_COLOR}\1${RESET_FORMATTING}/g" \
               -e "s/\([^,]*\)\(SUCCESS\)\([^,]*\)/\1${SUCCESS_COLOR}\2${MAIN_TEXT_COLOR}\3/g" \
               -e "s/\(\[WARNING\]\)\(.*\)/${BOLD}${WARN_COLOR}\1${RESET_FORMATTING}\2/g" \
               -e "s/\(\[ERROR\]\)\(.*\)/${BOLD}${ERROR_COLOR}\1${RESET_FORMATTING}\2/g" \
               -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${SUCCESS_COLOR}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"
 
  # Make sure formatting is reset
  echo -ne ${RESET_FORMATTING}
  )
}

alias mvn="mvn-color"


mvn-color-help() {
  echo
  echo -e "$(tput bold) reg  bld  und   tput-command-colors$(tput sgr0)"
  for i in $(seq 1 7); do
    echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
  done
  echo ' Bold            $(tput bold)'
  echo ' Underline       $(tput sgr 0 1)'
  echo ' Reset           $(tput sgr0)'
  echo
}
