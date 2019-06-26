# NEED TO WORK ON THIS FILE !!!

########### 
# scutil --set ComputerName "7urkm3n"
# scutil --set LocalHostName "7urkm3n"
# scutil --set HostName "7urkm3n"

function git_aware_prompt() {
    echo "Git AWARE PROMT RUNNING !!!"
    mkdir -p "/usr/local/bin" && git -C $_ clone git@github.com:7urkm3n/git-aware-prompt.git
    # git clone git@github.com:7urkm3n/git-aware-prompt.git
    # echo "export GITAWAREPROMPT=/usr/local/bin/git-aware-prompt" >> ~/.profile
    # echo "source '${GITAWAREPROMPT}/main.sh'" >> ~/.profile
}


function install_gems(){
	if ! [ -x "$(command -v foreman)" ]; then
	  echo "Foreman wasn't installed, Instaling foreman ..."
	  gem install foreman
	fi
}
