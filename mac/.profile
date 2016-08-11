############################## List ##################
#SEIL - Capslock key to ESC
#Skitch - ScreenSHot
#ScreenHero
#Slack

function git_aware_prompt() {
  echo "Git AWARE PROMT RUNNING !!!"
  mkdir -p /usr/local/bin/ && cd $_
  git clone git@github.com:7urkm3n/git-aware-prompt.git
  echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
  echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}



################################################ RVM ################################
# rvm get stable --auto-dotfiles
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


################################################ .profile ################################

#set_user_name_OSX
#http://apple.stackexchange.com/questions/66611/how-to-change-computer-name-so-terminal-displays-it-in-mac-os-x-mountain-lion

# export PATH=/usr/local/bin:$PATH
# alias delete_dsstore="find . -name '*.DS_Store' -type f -delete"


alias reload!=". ~/.profile"
export EDITOR=vim
# export NODE_ENV=production
export NODE_ENV=development

# # PostgreDB
# alias pg-help="pg_ctl --help"
# alias pg-status="pg_ctl -D /usr/local/var/postgres status"
# alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# # MongoDB Commands
# alias mongops='ps -ax | grep mongo'
# alias mongod='sudo mongod'


#new DB commands
alias db-list="brew services list"
alias mongo-start="brew services start mongodb"
alias mongo-stop="brew services stop mongodb"

alias pg-start="brew services start postgres"
alias pg-stop="brew services stop postgres"

########## Auto Complete Terminal ###########
# TAB: menu-complete
set completion-ignore-case on
set show-all-if-ambiguous on

# Git auto complete
# brew install git && brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# export SMTP_USER=""
# export SMTP_PASSWORD=""
# export SMTP_ADDRESS=""

# This is should in .bash_profile file
# source ~/.profile # Get the paths
# source ~/.bashrc  # get aliases

#alias d2='cd ~/../../../Volumes/Partition / D\'
#alias ='cd ~/Documents/'

# Git local runner
export PATH=/usr/local/bin:$PATH

# git branch and commitment shower
# https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
# export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "


#Vagrant LLTV
alias lltv='cd /Users/rovshengurdov/Documents/Projects/ror/lltv/backend'
alias puma_lvh='puma -b tcp://lvh.me:3000'
alias lvh='rails s -p 3000 -b lvh.me'
alias lvhp='RAILS_ENV=production rails s -p 3000 -b lvh.me'

# alias lvh='rvmsudo rails server -p 80 -b 0.0.0.0'

# Sublime
# alias s="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Local commands
alias p='cd ~/Documents/Projects/'
alias .profile='subl ~/.profile'
alias d1='cd /Volumes/Main\ disk'
alias lla='ls -la'
alias la='ls -a'
alias l='ls'

# Rspec 
# alias r='rspec'
# alias cr='clear; rspec'

# Github
alias go='git push origin'
alias gp='git pull origin'
alias goh='git push heroku master'
alias gs='git status'
alias gaa='git add .'
alias gb='git branch'
alias gm='git merge'
# alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gc='git checkout'
# alias gk='gitk --all&'
# alias gx='gitx --all'
# alias got='git '
# alias get='git '

# Custom Git 
alias gcd='git checkout development'

#################### ADDED Functions
