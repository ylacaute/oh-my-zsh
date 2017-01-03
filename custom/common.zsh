
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GENERAL
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export FULLNAME="Yannick Lacaute"
export EMAIL="yannick.lacaute@gmail.com"
export hostname="epi-pc"
export HOSTNAME="$hostname"
export SMTPSERVER="smtp.free.fr"

# Default permission mask for newly created file
# Sample : 022 will set newly created file to 755
umask 022;

# Pager options
export LESSCHARSET="latin1"
export PAGER=most

# Extending PATH locations
export PATH="$PATH:~/scripts"
export PATH="$PATH:~/bin"
export MANPATH="/usr/local/man:$MANPATH"

# Language environment
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='vi'
fi

# Speed cursor (dont work on NAS Synology)
unameSyno=`uname -a | grep -i synology`
if [[ "$unameSyno" == "" ]]; then
  xset r rate 300 50 || true
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SSH
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export SSH_KEY_PATH="~/.ssh/rsa_id"

#alias ssh<letter>='ssh user@machine -p port'
#alias res='ssh user@machine "halt"'

# SSH Agent
#keychain ~/.ssh/id_dsa

#. ~/.keychain/`uname -n`-sh


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Zsh options
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Desactive system beep
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# Background jobs are not set with a lower priority
unsetopt bg_nice          

# Don't send HUP signal to bg jobs if termal is closed
unsetopt hup

# Query the user before executing rm *
unsetopt rm_star_silent  

# Aliases are not internally substituted before completion is attempted
setopt complete_aliases

# If the last char from a completion is a slash and the next character typed
# is a word delimiter, remove the slash
setopt auto_remove_slash

# Do not require a leading . in a filename to be matched explicitly
setopt glob_dots

# Resolve symbolic links to their true values.
setopt chase_links

# If a command is not in the hash table, and there exists an executable
# directory by that name, perform the cd command to that directory.
setopt auto_cd


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Alias (overriding all those provided by oh-my-zsh)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Utils
alias ll='ls -la'
alias la='ls -a'
alias l='ls -l'
alias ls='ls  --color=auto -h'
alias grep='grep --color=always'
alias less='less --quiet'
alias df='df --human-readable'
alias du='du --human-readable'
alias x='exit'
alias rm='rm --interactive'
alias emacs='emacs -nw'
alias e='emacs'

# Clean all temporary files in the current directory
alias clean='( rm -f *~ ; rm -f .*~ ; rm -f \#*; rm -f *.bak) 2> /dev/null | true'

# Deep clean, clea all temporary files also in sub directories
alias rclean='( rm -f **/*~ ; rm -f **/.*~ ; rm -f **/\#* **/*.bak ) 2> /dev/null | true'
alias lclean='clean; (rm -f *.aux; rm -f *.bbl; rm -f *.blg; rm -f *.out; rm -f *.backup; rm -f *.toc; rm -f *.log) 2> /dev/null | true'

# Kill any app
alias xkill='sudo kill -9'

# Automatic extension program association
alias -s pdf='xpdf'
alias -s avi='gmplayer'
alias -s AVI='gmplayer'

alias -s bz2='tar -xvjf'
alias -s tar='tar -xvf'
alias -s gz='tar -xvzf'
alias -s tgz='tar -xvzf'
alias -s rar='unrar x'
alias -s ace='unace x'
alias -s zip='unzip'
alias -s 7z='7za e'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LS COLORS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Load default system colors from standard files
if [ -x /usr/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  fi
fi

# Overide some colors
export LS_COLORS='no=00:fi=00:di=0;33:ln=0;36:pi=40;33:so=0;35:do=0;35:bd=40;33;01:cd=40;33;0:or=40;31;0:*.tar=0;31:*.tgz=0;31:*.arj=0;31:*.taz=0;31:*.lzh=0;31:*.zip=0;31:*.z=0;31:*.Z=0;31:*.gz=0;31:*.7z=0;31:*.bz2=0;31:*.deb=0;31:*.rpm=0;31:*.jar=0;31:*.jpg=0;35:*.jpeg=0;35:*.png=0;35:*.gif=0;35:*.bmp=0;35:*.pbm=0;35:*.pgm=0;35:*.ppm=0;35:*.tga=0;35:*.xbm=0;35:*.xpm=0;35:*.tif=0;35:*.tiff=0;35:*.mpg=0;35:*.mpeg=0;35:*.avi=0;35:*.fli=0;35:*.gl=0;35:*.dl=0;35:*.xcf=0;35:*.xwd=0;35:*.ogg=0;34:*.wav=0;36:*.mp3=0;35:*.wma=0;35:*.pdf=0;35:*.c=0;36:*.h=0;32:*.cc=0;36:*.hxx=0;32:*.hh=0;32:*.o=0;30:*Makefile=0;31:*~=0;30:*#=0;31:*.rar=0;31:'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# KEY BINDING
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Force binding to be sure to get them, anywhere
bindkey '^A'    beginning-of-line         # Home
bindkey '^E'    end-of-line               # End
bindkey '^D'    delete-char               # Del
bindkey '[3~' delete-char               # Del
bindkey '[2~' overwrite-mode            # Insert
bindkey '[5~' history-search-backward   # PgUp
bindkey '[6~' history-search-forward    # PgDn

# Linux console linux, screen or rxvt
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
  then
  bindkey '[1~' beginning-of-line       # Home
  bindkey '[4~' end-of-line             # End
fi
# xterm
if [ "$TERM" = "xterm" ]
  then
  bindkey '[H'  beginning-of-line       # Home
  bindkey '[F'  end-of-line             # End
fi
