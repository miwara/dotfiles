# 文字コードの設定
export LANG=en_US.UTF-8

typeset -U path
path=(
    /usr/local/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/dotfiles/tools # 自前ツールのパス
    $path
)

case ${OSTYPE} in
    darwin*)

    path=(
        "$(brew --prefix coreutils)/libexec/gnubin" # coreutils
        "$(brew --prefix findutils)/libexec/gnubin" # findutils
        "$(brew --prefix llvm)/bin" # llvm
        "$(brew --prefix lld)/bin" # lld
        $path
    )
	;;
esac

# Go tools
(( $+commands[go] )) && path=("$(go env GOPATH)/bin" $path)

export PATH

# starship
(( $+commands[starship] )) && eval "$(starship init zsh)"

# mise
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# direnv
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

## gdircolors for LS_COLORS
(( $+commands[gdircolors] )) && eval "$(gdircolors)"

# 補完の置き場所
fpath=($HOME/.config/zsh/completions $fpath)

autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# 通常の補完（Tab）と違い，タイプしながらリアルタイムで履歴から予測候補を薄いテキストで表示
# 入力途中の履歴補完を有効にしているので不要
#autoload predict-on
#predict-on

# 必要のない機能
disable r

setopt auto_cd			# cd の省略
setopt auto_pushd		# 移動したディレクトリを記録
setopt correct			# 間違えて入力したコマンドの修正
setopt list_packed		# 補完候補を詰めて表示
setopt no_beep			# ビープ音なし
setopt extended_glob	# 拡張グロブ
setopt nonomatch		# ^で「zsh: no matches found:」エラーの対策（\でエスケープできるけど一応指定しておく）
setopt prompt_subst     # プロンプト展開を有効にする

ulimit -n 10240         # ファイルディスクリプタの上限を引き上げる


bindkey -e

# プロンプト設定

# コマンドを間違えたときのプロンプト
# correctオプションを有効にしている
SPROMPT="%F{red}%r is correct? (｡ŏ﹏ŏ) [n,y,a,e]:%f "

# starshipでプロンプトを設定するようにしたのでコメントアウト　ここから
# プロンプトで色変数を使えるようにする
#autoload colors
#colors

#
# ブランチを間違えないために
#
# VCSの情報を取得
#autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名（mergeなど）
#zstyle ':vcs_info:*' formats '[%b]'
#zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}

# プロンプトの設定
# ユーザ毎に使い分け
#case ${USERNAME} in
#    'root')
# 	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
# 	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
# 	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
# 	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
# 	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
# 	;;
#    'vagrant')
#	PROMPT="%U%F{white}%K{green}%B%m:%n%#%b%k%f%u "
# 	PROMPT2="%F{white}%K{green}%B%m:%n%#%b%k%f "
#	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
#	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#	;;
#    *)
#	PROMPT="%U%F{blue}%K{white}%B%m:%n%#%b%k%f%u "
#	PROMPT2="%F{blue}%K{white}%B%m:%n%#%b%k%f "
#	RPROMPT="%1(vl%F{cyan}%1v%fl) %F{white}[%~]%f"
#	SPROMPT="%{${fg[red]}%}%r is correct?(｡ŏ﹏ŏ) [n,y,a,e]:% {${reset_color}%} "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
# 	;;
#esac
# starshipでプロンプトを設定するようにしたのでコメントアウト　ここまで

# コマンド履歴関連
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups # ignore duplioation command history list
setopt share_history        # share command history data
setopt hist_expand

# 入力途中の履歴補完
# 複数行入力中はカーソル移動，単一行ではヒストリ検索
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

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

# alias
# 設定ファイルの編集
alias m="emacs $HOME/.zshrc"
alias x="source $HOME/.zshrc"

# emacs関連
alias e="emacs"

# vim関連
alias v="vim"

# git関連
#alias push="git push"
#alias pull="git pull"
alias gst="git status"
alias gl="git log --graph --color --pretty=format:\"%C(cyan)[ %ad]%Creset %C(green)%h%Creset %C(white reverse)%an%Creset : %C(white bold)%s%Creset %C(blue)%D%Creset\" --decorate-refs=tags"
#alias gl="git log --oneline --graph --color"
#alias gls="git log --graph --color"
alias gb="git branch -v"
alias gbd="git branch -D"
alias gd="git diff --color"
alias gdc="git diff --color --cached"
#alias grb="git rebase -i"
#alias ga="git add"
#alias gap="git add -p"

#alias grs="git reset --soft"
#alias gth="git reset --hard"

#alias gsl="git stash list"
#alias gss="git stash save"
#alias gsp="git stash pop"
#alias gds="git diff HEAD..stash@{}" aliasではなくて関数でやるべきかも

#alias gclf="git clean -f"

alias gck="git switch"
alias gsw="git switch"

# ls関連
alias ls="ls --color"
alias la="ls -al --color"

# grep関連
alias grep="grep -n --color=auto "

alias diff="diff -u"
# colordiff関連
(( $+commands[colordiff] )) && alias diff="colordiff -u"

# ローカルでの設定
[ -f $HOME/.zshlocal ] && source $HOME/.zshlocal
