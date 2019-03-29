# 155fe29a8cdd98d59e4cdf1c5c8636699f351404
# https://www.alexedwards.net/blog/streamline-your-sublime-text-and-go-workflow

######### Sublime Settings
# {
# 	"auto_complete_triggers":
# 	[
# 		{
# 			"characters": "<",
# 			"selector": "text.html"
# 		},
# 		{
# 			"characters": ".",
# 			"selector": "source.go"
# 		}
# 	],
# 	"color_scheme": "Packages/Color Scheme - Default/Monokai.tmTheme",
# 	"ensure_newline_at_eof_on_save": true,
# 	"font_face": "Menlo",
# 	"font_size": 15,
# 	"ignored_packages":
# 	[
# 		"Vintage"
# 	],
# 	"theme": "Adaptive.sublime-theme",

# 	"show_errors_inline": false // remove inline error on "Comamnd+B"
# }

########### 
# scutil --set ComputerName "7urkm3n"
# scutil --set LocalHostName "7urkm3n"
# scutil --set HostName "7urkm3n"

############################## List ##################
#SEIL      - Capslock key to ESC
#karabiner - https://github.com/tekezo/Karabiner-Elements/blob/master/usage/README.md
#Skitch    - ScreenSHot
#Slack
#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" #Load default .profile

##### These lines should be in .bash_profile to load the .profile
# source ~/.profile # Get the paths
# source ~/.bashrc  # get aliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/Users/7urkm3n/.gvm/scripts/gvm" ]] && source "/Users/7urkm3n/.gvm/scripts/gvm"

# https://github.com/creationix/nvm#install-script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# Go Development
export GOPATH="$HOME/Documents/Projects/golang"
# export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="$GOPATH/bin"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$PATH:${GOPATH}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# GREP Green Coloring by default  
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Visual Studio
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# RVM
export PATH="/usr/local/sbin:$PATH"

# Git local runner
export PATH=/usr/local/bin:$PATH

# alias python='python2'
### Emailing
# export SMTP_USER=""
# export SMTP_PASSWORD=""
# export SMTP_ADDRESS=""

########################### Functions ##############################

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
  mkdir -p "/usr/local/bin" && git -C $_ clone git@github.com:7urkm3n/git-aware-prompt.git
  # git clone git@github.com:7urkm3n/git-aware-prompt.git
  # echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
  # echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}

function .profile_push(){
	path=$HOME/Documents/Projects/dotfiles
	cp ~/.profile $path/mac
	git -C $path add .
	git -C $path commit -m ...
	git -C $path push
	echo "Profile has been copied to Dofiles Folder! and Git Updated!"
}

function .profile_pull(){
	path=$HOME/Documents/Projects/dotfiles
	git -C $path pull origin master
	cp $path/mac/.profile ~/.profile
	echo "Dotfile has been copied to Profile Folder and Updated!"
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

################################################ .profile ################################
# export PATH=/usr/local/bin:$PATH

alias dsstore="sudo find . -name '*.DS_Store' -type f -delete"
#alias deletee="find `pwd` -name '*.' -type f -delete"

export EDITOR=vim
# export NODE_ENV=production
export NODE_ENV=development

# # PostgreDB
# alias pg-help="pg_ctl --help"
# alias pg-status="pg_ctl -D /usr/local/var/postgres status"
# alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# pg_ctl -D /usr/local/var/postgres start

# # MongoDB Commands
# alias mongops='ps -ax | grep mongo'
# alias mongod='sudo mongod'

#Webpack Web Server
alias webpack-start="webpack-dev-server --hot --inline"

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

alias mailhog-start="brew services stop mailhog"
alias mailhog-stop="brew services start mailhog"
alias mailhog='MailHog' #logged


alias brewery='brew update && brew upgrade && brew cleanup'

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
PS1="\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "


# Rails Server
function lvh(){
	if [[ $1 ]]; then
		port=$1
	else
		port="3000"
	fi

	echo "Rails Server Runs at port:" $port
	# rails s -p $port -b lvh.me

	if ! [ -x "$(command -v foreman)" ]; then
	  echo "Foreman wasn't installed, Instaling foreman ..."
	  gem install foreman
	fi
	foreman start -f ./Procfile.development -p $port
}

function reload! () {
	echo "Reloading bash profile...!"
	source ~/.profile
	echo "Reloaded!!!"
}


alias 412='cd $HOME/Documents/Projects/412eats/web-server-rails'
alias yaprak='cd $HOME/Documents/Projects/Yaprak'
alias blueprint='cd $HOME/Documents/Projects/Blueprint'

# alias puma_lvh='puma -b tcp://lvh.me:3000'
# alias lvh='rails s -p 3000 -b lvh.me'
# alias lvh='rvmsudo rails server -p 80 -b 0.0.0.0'
alias lvhp='SECRET_KEY_BASE=xxx RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true rails s -p 3000 -b lvh.me'
alias lvhpp='SECRET_KEY_BASE=xxx RAILS_ENV=production rails s -p 3000'
alias lvh_certificate="rails s -b 'ssl://lvh.me:3000?key=localhost.key&cert=localhost.crt'"
alias compile_assets_production='RAILS_ENV=production SECRET_KEY_BASE=xxx RAILS_SERVE_STATIC_FILES=true rake assets:precompile'

# IDE's
alias atom="/Applications/Atom.app/Contents/Resources/app/atom.sh" # Atom
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" # Sublime
alias vs=code # Visual Studio

# Local commands
alias p='cd ~/Documents/Projects/'
alias .profile='vs ~/.profile'
alias d1='cd /Volumes/Main\ disk'
alias lla='ls -la -G'
alias la='ls -a -G'
alias l='ls -G'

# Rspec
# alias r='rspec'
alias cr='clear; rspec'


# Git Commands
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
