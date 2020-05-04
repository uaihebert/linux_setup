alias desk="cd ~/Desktop"
alias ll="ls -lha"
alias fin="find . -iname "
alias psg="ps aux | grep"
alias dev='cd ~/dev'
alias ws='cd "$DEV_WORKSPACE"'
alias grin='_grin(){grep -rin --exclude-dir=".idea" "$1" .}; _grin'
alias ltrun='gtruncate --size 0 log/*'
alias tex='open -a TextEdit'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias vpi='_vpi() {cd ~/.vim/bundle;git clone "$1";cd -}; _vpi'
alias wdid='vim ~/Documents/wdid.txt'
alias k9='kill -9 '

function hst() {
    search=$1 ; shift
    history | grep $search
}

alias ngs='ng server'
alias npi='npm install'
alias npis='npm install --save '
alias npisd='npm install --save-dev '
alias lint='ng lint "src/**/*.ts" --type-check'

alias mvi='mvn clean install -Dmaven.test.failure.ignore=true -Dmaven.test.error.ignore=true'

alias jg='export JAVA_HOME=/Users/hebertcoelhodeoliveira/dev/graalvm-ce-1.0.0-rc13/Contents/Home'

alias r2spi='cd "$DEV_WORKSPACE"/uai/open/r2dbc-spi'
alias r2data='cd "$DEV_WORKSPACE"/uai/open/spring-data-r2dbc'
