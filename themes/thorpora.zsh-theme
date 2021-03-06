#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Zshrc generated by Thor.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Bold Colors
bblack="%{[33;30;1m%}"
bred="%{[33;31;1m%}"
bgreen="%{[33;32;1m%}"
byellow="%{[33;33;1m%}"
bblue="%{[33;34;1m%}"
bpurple="%{[33;35;1m%}"
bturq="%{[33;36;1m%}"
bwhite="%{[33;37;1m%}"

# Normal Colors
black="%{[33;30m%}"
red="%{[33;31m%}"
green="%{[33;32m%}"
yellow="%{[37;33m%}"
blue="%{[33;34m%}"
purple="%{[33;35m%}"
turq="%{[33;36m%}"
white="%{[37m%}"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prompt configuration
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function precmd {

  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

  # Truncate the path if it's too long.
  PR_FILLBAR=""
  PR_PWDLEN=""
  local promptsize=${#${(%):----(%n@%m:)--()--}}
  local pwdsize=${#${(%):-%~}}
  if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
	((PR_PWDLEN=$TERMWIDTH - $promptsize))
  else
	PR_FILLBAR="\${(l.(($TERMWIDTH -($promptsize + $pwdsize)))..${PR_HBAR}.)}"
  fi

  # Get APM info.
  if which ibam > /dev/null; then
	PR_APM_RESULT=`ibam --percentbattery`
  elif which apm > /dev/null; then
	PR_APM_RESULT=`apm`
  fi
}

preexec () {
  if [[ "$TERM" == "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
  fi
  # See if $DISPLAY needs to be fixed.
  if [[ "$STY" != "" && "$DISPLAY" != "$(<~/.display)" ]]; then
	DISPLAY=$(<~/.display)
  fi
}

setprompt () {

  # See if we can use colors.
  autoload colors zsh/terminfo
  if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
  fi
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BLACK; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
  done
  PR_NO_COLOUR="%{$terminfo[sgr0]%}"

  # See if we can use extended characters to look nicer.
  if [[ "`locale charmap`" = "UTF-8" ]]; then
    PR_SET_CHARSET=""
	PR_SHIFT_IN=""
	PR_SHIFT_OUT=""
	PR_HBAR="─"
	PR_ULCORNER="┌"
	PR_LLCORNER="└"
	PR_LRCORNER="┘"
	PR_URCORNER="┐"
  else
    if [[ $ZSH_VERSION > 3.0.6 ]]; then
	  typeset -A altchar
	fi
	set -A altchar ${(s..)terminfo[acsc]}
	PR_SET_CHARSET="%{$terminfo[enacs]%}"
	PR_SHIFT_IN="%{$terminfo[smacs]%}"
	PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
	PR_HBAR=${altchar[q]:--}
	PR_ULCORNER=${altchar[l]:--}
	PR_LLCORNER=${altchar[m]:--}
	PR_LRCORNER=${altchar[j]:--}
	PR_URCORNER=${altchar[k]:--}
  fi
	
  # Decide if we need to set titlebar text.
  case $TERM in
	xterm*)
	    PR_TITLEBAR=AAA$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
	    ;;
	screen)
	    PR_TITLEBAR=BBB$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
	    ;;
	*)
	    PR_TITLEBAR=''
	    ;;
  esac
  PR_TITLEBAR=''

  # Decide whether to set a screen title
  if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
  else
	PR_STITLE=''
  fi

  # APM detection
  if which ibam > /dev/null; then
    PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%#(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
  elif which apm > /dev/null; then
    PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
  else
    PR_APM=''
  fi

  # Define prompt element colors
  CL_TEXT=${PR_WHITE}
  CL_BAR=${PR_BLACK}
  CL_SBAR=${PR_CYAN}
  CL_EXTRA=${PR_CYAN}
  CL_TIME=${PR_YELLOW}
  CL_ROOT=${PR_LIGHT_RED}
  CL_DOLLAR=${PR_LIGHT_YELLOW}
  CL_AT=${PR_YELLOW}
  CL_USER=${PR_WHITE}
  CL_HOST=${PR_WHITE}
  
  # git color (from robbyrussel theme)
  ZSH_THEME_GIT_PROMPT_PREFIX="%{${PR_CYAN}%}git(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{${PR_CYAN}%})" #%{$fg[yellow]%}âœ—
  ZSH_THEME_GIT_PROMPT_CLEAN="%{${PR_CYAN}%})"

  #ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
  #ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  #ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})" #%{$fg[yellow]%}âœ—
  #ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
  
# ${PR_NO_COLOR}

  # Define the main prompt
  PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}${CL_BAR}${PR_SHIFT_IN}$PR_ULCORNER$PR_HBAR${CL_SBAR}$PR_HBAR${PR_SHIFT_OUT}(${CL_TEXT}%$PR_PWDLEN<...<%~%<<${CL_SBAR})${PR_SHIFT_IN}$PR_HBAR${CL_BAR}${(e)PR_FILLBAR}${CL_SBAR}$PR_HBAR${PR_SHIFT_OUT}[${CL_USER}%(!.${CL_ROOT}ROOT.%n)${CL_AT}@${CL_HOST}%m${CL_SBAR}]${PR_SHIFT_IN}$PR_HBAR${CL_BAR}$PR_HBAR$PR_URCORNER${PR_SHIFT_OUT} ${CL_BAR}${PR_SHIFT_IN}$PR_LLCORNER$PR_HBAR${PR_SHIFT_OUT}%(?..${CL_TEXT}[${CL_ROOT}%?${CL_TEXT}]${CL_BAR})${(e)PR_APM}$(git_prompt_info)%(!.${CL_ROOT}#.${CL_DOLLAR}\$)${PR_SHIFT_IN}${PR_SHIFT_OUT}$PR_NO_COLOUR '

  # Date on prompt
  RPROMPT='${CL_BAR}${PR_SHIFT_IN}$PR_HBAR${CL_SBAR}$PR_HBAR${PR_SHIFT_OUT}[${CL_TEXT}%D{%a %b %d} ${CL_TIME}%D{%H}${CL_TIME}:${CL_TIME}%D{%M}${CL_SBAR}]${PR_SHIFT_IN}$PR_HBAR${CL_BAR}$PR_HBAR$PR_LRCORNER${PR_SHIFT_OUT}$PR_NO_COLOUR'

  # Alternative
  PS2='${CL_BAR}${PR_SHIFT_IN}$PR_HBAR${PR_SHIFT_OUT}${CL_BAR}${PR_SHIFT_IN}$PR_HBAR${PR_SHIFT_OUT}(${CL_ROOT}%_${CL_BAR})${PR_SHIFT_IN}$PR_HBAR${PR_SHIFT_OUT}${CL_SBAR}${PR_SHIFT_IN}$PR_HBAR${PR_SHIFT_OUT}$PR_NO_COLOUR '

}

setprompt
