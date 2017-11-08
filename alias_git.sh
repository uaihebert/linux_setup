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
alias gipu='git pull --rebase'
alias gicp='git cherry-pick'
alias gidh='git diff HEAD'
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
alias gil='git log --format="%C(yellow)%h%Creset - %C(red)%ad%Creset [%<(10,trunc)%aN] %<(50,trunc)%s" --date=format:"%y-%m-%d %H:%M:%S"'

alias gir='git rebase'
alias gir-='git rebase -'

YELLOW='\033[1;33m'
NC='\033[0m'

fetch_all_branches () {
  cd $DEV_WORKSPACE
  for d in */ ; do
    cd "$d"
    if [ -d ".git" ]
    then
      echo -e "${YELLOW}fetching `git config --get remote.origin.url` ${NC}";
      git fetch origin
    fi
    cd $DEV_WORKSPACE
  done
}

# delete all branches expcept master
git_branches_clean () {
  git branch | grep -v 'master' | xargs git branch -D
}

# this will remove all branches that are not found on the repo
# it will not remove a local only branch
git_force_branches_sync() {
	git checkout master && git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}

#  will push to origin a new branch with the same name of the local branch
alias gipo=push_origin_current_name
push_origin_current_name() {
	local_name=`git rev-parse --abbrev-ref head`
	new_name=$1 # Custom Branch Name
	if test "x$branch_name" = "x" ; then
  		git push -u origin $local_name
  	else
  		git push -u origin $local_name:$branch_name
  	fi
}


