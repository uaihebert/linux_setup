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
alias gipu='git pull'
alias gicp='git cherry-pick'
alias gidt='git difftool -y HEAD'
alias gisl="git stash list"
alias gisp="git stash pop"
alias giss='_giss(){git stash show stash@{"$1"}}; _giss'
alias gisd='_gisd(){git stash drop stash@{"$1"}}; _gisd'
alias gist='git stash'

alias gir='git rebase'
alias gir-='git rebase -'

clean_git_branches () {
  git branch | grep 'bugfix' | xargs git branch -D
  git branch | grep 'hotfix' | xargs git branch -D
  git branch | grep 'feature' | xargs git branch -D
  git branch | grep 'release' | xargs git branch -D
}


alias gipo=push_origin_current_name
push_origin_current_name() {
  git push -u origin `git rev-parse --abbrev-ref head`
}


