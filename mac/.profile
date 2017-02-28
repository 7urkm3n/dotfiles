############################## List ##################
#SEIL      - Capslock key to ESC
#karabiner - https://github.com/tekezo/Karabiner-Elements/blob/master/usage/README.md
#Skitch    - ScreenSHot
#ScreenHero
#Slack
#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" #Load default .profile

##### This is should in .bash_profile file
# source ~/.profile # Get the paths
# source ~/.bashrc  # get aliases
export GOPATH="$HOME/Documents/Projects/golang"
# export GOBIN=$GOPATH/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$GOPATH/bin #golang path for bin
export PATH=$PATH:/usr/local/mysql/bin #mysql

# Git local runner
export PATH=/usr/local/bin:$PATH

### Emailing
# export SMTP_USER=""
# export SMTP_PASSWORD=""
# export SMTP_ADDRESS=""


############################## Functions ##############################

function w (){
	city=$1
	curl http://wttr.in/$city
}

function git_aware_prompt() {
  echo "Git AWARE PROMT RUNNING !!!"
  mkdir -p /usr/local/bin/ && cd $_
  git clone git@github.com:7urkm3n/git-aware-prompt.git
  # echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
  # echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}

# function pd_path(){
# 	return $HOME/Documents/Projects/dotfiles
# }

function pd_to_github(){
	path=$1
	git -C $path add .
	git -C $path commit -m ...
	git -C $path push
}

function profile_to_dotfile(){
	path=$HOME/Documents/Projects/dotfiles
	cp ~/.profile $path/mac
	pd_to_github $path
	echo "Profile To Dotfile has successfully copied"
}

function dotfile_to_profile(){
	cp $HOME/Documents/Projects/dotfiles/mac/.profile ~/.profile 
	echo "Dotfile To Profile has successfully copied"
}



############################## RVM ##############################
# rvm get stable --auto-dotfiles
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

################################################ .profile ################################
# export PATH=/usr/local/bin:$PATH
alias dsstore="find . -name '*.DS_Store' -type f -delete"


alias reload!=". ~/.profile"
export EDITOR=vim
# export NODE_ENV=production
export NODE_ENV=development
export secret_key_base='blablabla'

# # PostgreDB
# alias pg-help="pg_ctl --help"
# alias pg-status="pg_ctl -D /usr/local/var/postgres status"
# alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# # MongoDB Commands
# alias mongops='ps -ax | grep mongo'
# alias mongod='sudo mongod'

######### Heroku ############
alias heroku_off="heroku maintenance:off"
alias heroku_on="heroku maintenance:on"
######### Heroku End ############

#Webpack Web Server
alias wb="webpack-dev-server --hot --inline"

#new DB commands
alias dblist="brew services list"
alias mongo-start="brew services start mongodb"
alias mongo-stop="brew services stop mongodb"

alias pg-start="brew services start postgres"
alias pg-restart="brew services restart postgres"
alias pg-stop="brew services stop postgres"

alias my-start="brew services start mysql"
alias my-stop="brew services stop mysql"

alias rethink-start="brew services start rethinkdb"
alias rethink-stop="brew services stop rethinkdb"

########## Auto Complete Terminal ###########
# TAB: menu-complete
set completion-ignore-case on
set show-all-if-ambiguous on

# Git auto complete
# brew install git && brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# git branch and commitment shower
# https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
export PS1="\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

##################### more exaples
# export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$\E[5m '
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
# export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "



#Vagrant LLTV
alias lltv='cd $HOME/Documents/Projects/lltv_rails'
alias puma_lvh='puma -b tcp://lvh.me:3000'
alias lvh='rails s -p 3000 -b lvh.me'
alias lvhp='RAILS_ENV=production rails s -p 3000 -b lvh.me'
# alias lvh='rvmsudo rails server -p 80 -b 0.0.0.0'
alias compile_prod='rake assets:precompile RAILS_ENV=production'

# Sublime
alias s="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Local commands
alias p='cd ~/Documents/Projects/'
alias .profile='s ~/.profile'
alias d1='cd /Volumes/Main\ disk'
alias lla='ls -la -G'
alias la='ls -a -G'
alias l='ls -G'

# Rspec 
# alias r='rspec'
# alias cr='clear; rspec'

# Github
alias gopush='git push origin'
alias gopull='git pull origin'
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
