alias ll="ls -lha"
alias fin="find . -iname "
alias psg="ps aux | grep"
alias dev='cd ~/dev'
alias cdw='cd "$DEV_WORKSPACE"'
alias grin='_grin(){grep -rin --exclude-dir=".idea" "$1" .}; _grin'
alias ltrun='gtruncate --size 0 log/*'
alias tex='open -a TextEdit'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias vpi='_vpi() {cd ~/.vim/bundle;git clone "$1";cd -}; _vpi'
function hst() {
    search=$1 ; shift
    history | grep $search
}

alias ngs='ng server'
