# NEED TO WORK ON THIS FILE !!!
########### 
# scutil --set ComputerName "7urkm3n"
# scutil --set LocalHostName "7urkm3n"
# scutil --set HostName "7urkm3n"

function git_aware_prompt() {
    echo "Git aware promt installing !!!"
    mkdir -p "/usr/local/bin" && git -C $_ clone git@github.com:7urkm3n/git-aware-prompt.git
    # git clone git@github.com:7urkm3n/git-aware-prompt.git
    # echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
    # echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}


function install_gems() {
	if ! [ -x "$(command -v foreman)" ]; then
	  echo "Foreman wasn't installed, Instaling foreman ..."
	  gem install foreman
	fi
}

function brew_installation() {
  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function brew_install_cmake() {
  echo "Installing `cmake` via brew"
  brew install cmake
}

function brew_install_git_auto_complete() {
  # Git auto complete
  brew install git && brew install bash-completion
}

function install_gvm() {
  echo "Installing `gvm`"
  eval "bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"
}

function install_rvm() {
  echo "Installing `rvm`"
  \curl -sSL https://get.rvm.io | bash
}

function install_nvm() {
  echo "Installing `nvm`"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
}

function install_dbs() {
  echo "Installing Mongodb" && brew install mongodb
  echo "Installing Postgres" && brew install postgres
  echo "Installing Mysql" && brew install mysql
  echo "Installing Redis" && brew install redis
  echo "Installing Rethinkdb" && brew install rethinkdb
  echo "Installing Mailhog" && brew install mailhog
  echo "Installing Elasticsearch" && brew install elasticsearch
}

function creating_work_folders() {
  echo "Creating Work Folders"
  divider="....................."
  path=$HOME/Documents/Projects/
  gopath=$path/golang/

  echo $divider
  echo "Golang: gocode and golib"
  mkdir -p $gopath/gocode/src $gopath/gocode/bin $gopath/gocode/pkg
  mkdir -p $gopath/golib/src $gopath/golib/bin $gopath/golib/pkg

  echo $divider
}

function current_machine_username() {
  echo "Cheching computer, host and localhost names"

  name="7urkm3n"
  if [ `scutil --get ComputerName` != $name ]
  then
    echo "Setting ComputerName to $name"
    scutil --set ComputerName $name;
  fi

  if [ `scutil --get LocalHostName` != $name ]
  then
    echo "Setting LocalHostName to $name"
    scutil --set LocalHostName $name;
  fi

  if [ `scutil --get HostName` != $name ]
  then
    echo "Setting HostName to $name"
    scutil --set HostName $name;
  fi
}


function init() {
  echo "Init Executed"
  # installing_brew
  # current_machine_username
  # install_dbs
  # git_aware_prompt()
  # cp .custom_profile ~/

  # creating_work_folders
  git_aware_prompt
}

init
