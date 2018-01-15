# Created by newuser for 5.0.2

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/bin/:$PATH"

# 文字コードの設定
export LANG=en_US.UTF-8

# nodeのバージョン管理
# nodebrew
nodebrewpath=$HOME/.nodebrew/current/bin
if [[ -e $nodebrewpath ]]; then
    export PATH="$nodebrewpath:$PATH"
fi

# nodist
NODIST_BIN_DIR__=$(echo "$NODIST_PREFIX" | sed -e 's,\\,/,g')/bin; if [ -f "$NODIST_BIN_DIR__/nodist.sh" ]; then . "$NODIST_BIN_DIR__/nodist.sh"; fi; unset NODIST_BIN_DIR__;

# rbenv
# cygwinでchefを使うときに必要
rbenvpath=$HOME/.rbenv/bin
if [[ -e $rbenvpath ]]; then
    export PATH="$rbenvpath:$PATH"
    eval "$(rbenv init -)"
fi

# pyenv
pyenvpath=$HOME/.pyenv
if [[ -e $pyenvpath ]]; then
    export PYENV_ROOT="$pyenvpath"
    export PATH="$pyenvpath/bin:$PATH"
    eval "$(pyenv init -)"
fi

# cask
export PATH="$HOME/.cask/bin:$PATH"

# coreutils
case ${OSTYPE} in
    darwin*)
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
	# findutiles
	alias find=gfind
	alias xargs=gxargs
	;;
esac

autoload -Uz compinit
compinit -u
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload colors
colors
#autoload predict-on
#predict-on

# 必要のない機能
disable r

setopt auto_cd			# cd の省略
setopt auto_pushd		# 移動したディレクトリを記録
setopt correct			# 間違えて入力したコマンドの修正
setopt list_packed		# 補完候補を詰めて表示
setopt extended_glob		# 拡張グロブ
setopt no_beep			# ビープ音なし

bindkey -e

#
# ブランチを間違えないために
#
# VCSの情報を取得
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名（mergeなど）
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# プロンプト設定
# ユーザ毎に使い分け
case ${USERNAME} in
    'root')
 	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
 	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
 	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
 	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
 	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
 	;;
    'vagrant')
	PROMPT="%U%F{white}%K{green}%B%m:%n%#%b%k%f%u "
 	PROMPT2="%F{white}%K{green}%B%m:%n%#%b%k%f "
	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	;;
    *)
	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
 	;;
esac

# alias
# 設定ファイルの編集
alias m="emacs ~/.zshrc"
alias x="source ~/.zshrc"

# emacs関連
alias e="emacs"

# git関連
alias push="git push"
alias pull="git pull"
alias gst="git status"
alias gl="git log --graph --color --pretty=format:\"%C(cyan)[ %ad]%Creset %C(green)%h%Creset %C(white reverse)%an%Creset : %C(white bold)%w(80)%s%Creset\""
#alias gl="git log --oneline --graph --color"
alias gls="git log --graph --color"
alias gck="git checkout"
alias gckb="git checkout -b"
alias gb="git branch -v"
alias gbd="git branch -D"
alias gd="git diff --color"
alias gdc="git diff --color --cached"
alias grb="git rebace -i"
alias ga="git add"
alias gap="git add -p"

alias grs="git reset --soft"
alias gth="git reset --hard"

alias gss="git stash save"
alias gsp="git stash pop"
#alias gds="git diff HEAD..stash@{}" aliasではなくて関数でやるべきかも

alias gclf="git clean -f"

# ls関連
alias ls="ls --color"
alias la="ls -al --color"

# grep関連
alias grep="grep -n --color=auto "

# diff関連
if [[ -x $(which colordiff) ]]; then
    alias diff="colordiff -u"
else
    alias diff="diff -u"
fi

# java関連
alias javac="javac -J-Dfile.encoding=UTF-8" # 文字化け対策

# tmux関連 /tmp以下の関連ファイルを削除しないと起動できないので
case ${OSTYPE} in
    darwin*)
        alias tmux="tmux -2"
        ;;
    *)
        alias tmux="rm -r /tmp/tmux* && tmux -2"
        ;;
esac

# composer関連
alias composer="php /usr/local/bin/composer"

# コマンド履歴関連
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups		# ignore duplioation command history list
setopt share_history		# share command history data

setopt hist_expand

# 入力途中の履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# インクリメントサーチの設定
# bindkey "^R" history-incremental-search-backward
# bindkey "^S" history-incremental-search-forward

# 履歴のインクリメントサーチでワイルドカード利用可能
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# Enterで ls と git status
function do_enter() {
    if [  -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
   # ls_abbrev
   if [  "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
       echo
       echo -e "\e[ 0;33m--- git status ---\e[ 0m"
       git status -sb
   fi
   zle reset-prompt
   return 0
}
zle -N do_enter
bindkey '^m' do_enter

# iTem2 でタブ名を引数の名前に固定する
function setTabNameforiTem2() {
    echo -ne "\e]1;$1\a"
    return 0
}

# ローカルでの設定
[ -f ~/.local ] && source ~/.local
