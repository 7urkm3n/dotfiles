##### These lines should be in .bash_profile to load the .profile
#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" #Load default .profile
source "$HOME/Documents/Projects/dotfiles/mac/.db_commands" 
source "$HOME/Documents/Projects/dotfiles/mac/.git_commands" 

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="/.nvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# [[ -s "$HOME/.nvm/nvm.sh" ]]      && source "$HOME/.nvm/nvm.sh"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
rvm_silence_path_mismatch_check_flag=1

# https://github.com/creationix/nvm#install-script

# Go Development
# export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH="$HOME/Documents/Projects/golang/golib"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:${GOPATH}/bin"
export GOPATH="$HOME/Documents/Projects/golang/gocode"

# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# GREP Green Coloring by default  
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Visual Studio
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# RVM
export PATH="/usr/local/sbin:$PATH"

# Git local runner
export PATH=/usr/local/bin:$PATH

export EDITOR=vim


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

function reload! () {
	echo $txtcyn "Reloading bash profile...!"
	source ~/.profile
	echo $txtcyn "Reloaded!"
}

function .profile_push(){
	path=$HOME/Documents/Projects/dotfiles
	# cp ~/.profile $path/mac
	git -C $path add .
	git -C $path commit -m ...
	git -C $path push

	cp $path/mac/.profile ~/.profile
	reload!

	echo $txtcyn "Profile - Pushed to Github"
}

function .profile_pull(){
	path=$HOME/Documents/Projects/dotfiles
	git -C $path pull origin master
	cp $path/mac/.profile ~/.profile
	reload!
	echo $txtcyn "Profile - Pulled from Github"
}

function .profile_copy(){
	path=$HOME/Documents/Projects/dotfiles
	cp $path/mac/.profile ~/.profile
	reload!
	echo $txtcyn "Profile - Copied and Sourced"
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
	
	if ! [ -x "$(command -v foreman)" ]; then
	  echo "Foreman wasn't installed, Instaling foreman ..."
	  gem install foreman
	fi

	# rails s -p $port -b lvh.me
	foreman start -f ./Procfile.development -p $port
}

alias dsstore="sudo find . -name '*.DS_Store' -type f -delete"
#alias deletee="find `pwd` -name '*.' -type f -delete"

alias brewery='brew update && brew upgrade && brew cleanup'

#Webpack Web Server
alias webpack-start="webpack-dev-server --hot --inline"

alias 412='cd $HOME/Documents/Projects/412eats/web-server-rails'
alias yaprak='cd $HOME/Documents/Projects/Yaprak'
alias blueprint='cd $HOME/Documents/Projects/Blueprint'
alias goblueprint='cd $HOME/Documents/Projects/golang/gocode/src/github.com/BlueprintNYC/ECA-Server-API'

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
alias .profile='vs $HOME/Documents/Projects/dotfiles/mac/.profile'
alias d1='cd /Volumes/Main\ disk'
alias lla='ls -la -G'
alias la='ls -a -G'
alias l='ls -G'

# Rspec
# alias r='rspec'
alias cr='clear; rspec'
