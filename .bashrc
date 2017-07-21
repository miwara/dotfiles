# bashではgit-prompt.shをDLしないとブランチ名を表示できない
# ただしHomebrewでgitをインストールしたときは不要
source ~/.git-prompt.sh
GIT_PS_SHOWDIRTYSTATE=ture
export PS1='[\u@\h \[\e[42m\]\W\[\e[0m\]] \[\e[34m\e[47m\]$(_git_ps1)\[\e[0m\]\n\$ '

alias e="emacs"

alias gst="git status"
alias gl="git log --graph --color --pretty=format:\"%C(cyan)[ %ad]%Creset %C(green)%h%Creset %C(white reverse)%an%Creset : %C(white bold)%w(80)%s%Creset\""
alias gck="git checkout"
alias gb="git branch -v"
alias gd="git diff --color"
alias gdc="git diff --color --cached"
alias grb="git rebace -i"
alias ga="git add"
alias gap="git add -p"

alias gss="git stash save"
alias gsp="git stash pop"
