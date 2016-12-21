
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEVELOPER CONFIGURATION
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# JAVA
export JAVA_HOME="/opt/jdk1.8.0_112"
export IDEA_HOME="/opt/idea-IU-163.9166.29"

export JAVA_COMPILER="$JAVA_HOME/bin/javac"
export PATH="${JAVA_HOME}/bin:$PATH"
export PATH="${IDEA_HOME}/bin:$PATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"


# Add new alias GIT and override some
alias gpull='git pull --rebase'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend --no-edit'
alias gl="git log --graph --date=relative --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"
alias gll="git log --graph --date=relative --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset' --numstat"
unalias gp # git pull from git pluging
alias gpush='git push'

# Automatic extension program association
alias -s c='emacs'
alias -s cc='emacs'
alias -s h='emacs'
alias -s hh='emacs'
alias -s hxx='emacs'
alias -s hcc='emacs'
alias -s tex='emacs'

