############################## List ##################
#SEIL      - Capslock key to ESC
#karabiner - https://github.com/tekezo/Karabiner-Elements/blob/master/usage/README.md
#Skitch    - ScreenSHot
#Slack
#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" #Load default .profile

##### These lines should be in .bash_profile to load the .profile
# source ~/.profile # Get the paths
# source ~/.bashrc  # get aliases


# Go Development
export GOPATH="$HOME/Documents/Projects/golang"
export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


# Visual Studio
#export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"

# Git local runner
export PATH=/usr/local/bin:$PATH


# alias python='python2'
### Emailing
# export SMTP_USER=""
# export SMTP_PASSWORD=""
# export SMTP_ADDRESS=""





############################## Functions ##############################

function w (){
	city=$1
	metrics=$2
	if [[ $city = 'c' ]]; then
		curl http://wttr.in?m
	elif [[ $metrics = 'c' ]]; then
		curl http://wttr.in/$city?m
	elif [[ $city ]]; then
		curl http://wttr.in/$city
	else
		curl http://wttr.in
	fi
}

function git_aware_prompt() {
  echo "Git AWARE PROMT RUNNING !!!"
  mkdir -p /usr/local/bin/ && cd $_
  git clone git@github.com:7urkm3n/git-aware-prompt.git
  # echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
  # echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}


function .profile_push(){
	path=$HOME/Documents/Projects/dotfiles
	cp ~/.profile $path/mac
	git -C $path add .
	git -C $path commit -m ...
	git -C $path push
	echo "Dotfile has been copied to Profile Folder and Updated!"
}

function .profile_pull(){
	path=$HOME/Documents/Projects/dotfiles
	git -C $path pull origin master
	cp $path/mac/.profile ~/.profile
	echo "Profile has been copied to Dofiles Folder! and Git Updated!"
}


## delete file in a current folder
function delete_x(){
	# find "$(pwd)" -name '*.' -type f -delete
	echo "$(pwd)"
    find . -name ".*" -print

	# Use this to delete recursive
	# find . -name ".*" -delete

	# Dnt use it!
	# find . -name "*.crdownload" -print
	# find . -name "*.*" -print
}

############################## RVM ##############################
# rvm get stable --auto-dotfiles
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

################################################ .profile ################################
# export PATH=/usr/local/bin:$PATH

alias dsstore="find . -name '*.DS_Store' -type f -delete"
#alias deletee="find `pwd` -name '*.' -type f -delete"


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

#Webpack Web Server
alias wb="webpack-dev-server --hot --inline"

#new DB commands
alias dblist="brew services list"
alias mongo-start="brew services start mongodb"
alias mongo-stop="brew services stop mongodb"

alias pg-start="brew services start postgres"
alias pg-restart="brew services restart postgres"
alias pg-stop="brew services stop postgres"

alias mq-start="brew services start mysql"
alias mq-stop="brew services stop mysql"

alias rd-start="brew services start redis"
alias rd-restart="brew services stop redis"
alias rd-stop="brew services stop redis"

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



############# Git branch and commitment shower | Current location etc...

# https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT="/usr/local/bin/git-aware-prompt"
source "${GITAWAREPROMPT}/main.sh"
GVM='$(gvm-prompt "(%s)")'
PS1="\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
# export PS1="\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "


# if [ "$(whoami)"='7urkm3n' ]; then
#   RED='\e[0;31m'
#   GREEN='\e[0;32m'
#   NC='\e[0m'
#   GIT_BRANCH='$(__git_ps1 "(%s)")'
#   PS1="[${RED}\u@\h:\W \t.\d${GREEN}${GIT_BRANCH}$NC 123 ${GVM}] \n >"
# else
#   RED='\e[0;31m'
#   GREEN='\e[0;32m'
#   NC='\e[0m'
#   GIT_BRANCH='$(__git_ps1 "(%s)")'
#   GVM='$(gvm-prompt "(%s)")'
#   PS1="[${GREEN}\u@\h:\W ${RED}${GIT_BRANCH}$NC ${GVM}] \n >"
# fi



##################### more exaples
# export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$\E[5m '
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
# export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "



function lvh(){
	port="3000"
	echo "Rails Server Runs at port:" $port
	# rails s -p $port -b lvh.me
	foreman start -f ./Procfile.development
}

function reload! () {
	echo "Reloading bash profile...!"
	source ~/.bash_profile
	echo "Reloaded!!!"
}

alias emails='MailHog'
alias 412='cd $HOME/Documents/Projects/412eats/web-server-rails'
# alias puma_lvh='puma -b tcp://lvh.me:3000'
# alias lvh='rails s -p 3000 -b lvh.me'
alias lvhp='RAILS_ENV=production rails s -p 3000 -b lvh.me'
# alias lvh='rvmsudo rails server -p 80 -b 0.0.0.0'
alias lvh_certificate="rails s -b 'ssl://lvh.me:3000?key=localhost.key&cert=localhost.crt'"
alias compile_prod='rake assets:precompile RAILS_ENV=production'

# Atom
# alias s="/Applications/Atom.app/Contents/Resources/app/atom.sh"

# Sublime
alias s="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Visual Studio
alias vs=code

# Local commands
alias p='cd ~/Documents/Projects/'
alias .profile='s ~/.profile'
alias d1='cd /Volumes/Main\ disk'
alias lla='ls -la -G'
alias la='ls -a -G'
alias l='ls -G'

# Rspec
# alias r='rspec'
alias cr='clear; rspec'

# Github

function gopush(){
	# branch=$git_branch | tr -d \)\(
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	echo "Pushing to:" $txtred $branch
	git push origin $branch
}

function gopull(){
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	echo "Pulling From:" $txtred $branch
	git pull origin $branch
}

# alias gopush="git push origin \$git_branch"
# alias gopull='git pull origin'
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
alias gcr='git checkout rovshen'
