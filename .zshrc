# Created by newuser for 5.0.2
# last update : 2014/07/22

# 文字コードの設定
export LANG=ja_JP.UTF-8

autoload -Uz compinit -u
compinit
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload colors
colors
#autoload predict-on
#predict-on

setopt auto_cd			# cd の省略
setopt auto_pushd		# 移動したディレクトリを記録
setopt correct			# 間違えて入力したコマンドの修正
setopt list_packed		# 補完候補を詰めて表示
setopt extended_glob		# 拡張グロブ

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
# cygwinはrootがないためUIDでプロンプト変更は削除
# case $(UID) in
# 0)
# 	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
# 	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
# 	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
# 	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:% {${reset_color}%} "
# 	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
# 	PROMPT="%{${fg[white]%}${HOST%%.*} ${PROMPT}"
# 	;;
# *)
	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:% {${reset_color}%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	PROMPT="%{${fg[white]%}${HOST%%.*} ${PROMPT}"
# 	;;
# esac

# alias
# 設定ファイルの編集
alias m="emacs ~/.zshrc"
alias x="source ~/.zshrc"

# emacs関連
alias em="emacs"
alias e="emacs"

# git関連
alias push="git push"
alias pull="git pull"
alias gst="git status"
alias gl="git log --graph"
alias gck="git checkout"
alias gb="git branch"
alias gd="git diff --color"

# ls関連
alias ls="ls --color"
alias la="ls -al --color"

# java関連
alias javac="javac -J-Dfile.encoding=UTF-8" # 文字化け対策

# /tmp以下を全削除してから終了
alias exit="rm -rf /tmp/tmux-1000/* && exit"

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
