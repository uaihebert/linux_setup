#!/bin/bash

alias gis="git status"
alias gia="git add "
alias gia.="git add ."
alias gim="git checkout master"
alias gie="git checkout edge"
alias gic="git commit -m "
alias gico="git checkout"
alias gico-="git checkout -"
alias gip="git push"
# rebasing from origin instead of merging
alias gipu='gist && git pull --rebase && gisp'
alias gicp='git cherry-pick'
alias gidt='git difftool -y HEAD'
alias gisl="git stash list"
alias gisp="git stash pop"
alias giss='_giss(){git stash show stash@{"$1"}}; _giss'
alias gisd='_gisd(){git stash drop stash@{"$1"}}; _gisd'
alias gist='git stash'
# opens a pull request
alias gipr='hub pull-request '
# remove any change and uncomitted file
alias gicl='git reset --hard HEAD~1 && git clean -fdi'
# delete a remote branch
alias gipd='_gipd(){git push -u origin :"$1"}; _gipd'
# update the local reference of the list of branches
alias giru='git remote update origin --prune'
alias girh='git reset HEAD '
alias gife='git fetch origin '

alias gir='git rebase'
alias gir-='git rebase -'

# delete all branches expcept master
clean_git_branches () {
  git branch | grep -v 'master' | xargs git branch -D
}

#  will push to origin a new branch with the same name of the local branch
alias gipo=push_origin_current_name
push_origin_current_name() {
  git push -u origin `git rev-parse --abbrev-ref head`
}


