#!/bin/sh

DOTFILES=$(cd "$(dirname "$0")" && pwd)

# name:placeDir:src (srcが空の場合はnameと同じ)
CONF_FILES="
.emacs.d:$HOME/:
.zshrc:$HOME/:
ignore:$HOME/.config/git/:.config/git/ignore
.vimrc:$HOME/:
.vim:$HOME/:
alacritty.toml:$HOME/.config/alacritty/:.config/alacritty/alacritty.toml
tmux.conf:$HOME/.config/tmux/:.config/tmux/tmux.conf
config:$HOME/.config/ghostty/:.config/ghostty/config
starship.toml:$HOME/.config/:.config/starship/starship.toml
CLAUDE.md:$HOME/.claude/:.claude/CLAUDE.md.tmpl
settings.json:$HOME/.claude/:.claude/settings.json.tmpl
settings.json:$HOME/.config/ccstatusline/:.config/ccstatusline/settings.json
"

make_symlink() {
  name="$1"
  place_dir="$2"
  src="$3"

  [ -z "$src" ] && src="$name"

  target="${place_dir}${name}"
  link_src="${DOTFILES}/${src}"

  mkdir -p "$place_dir"

  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Skipped (not a symlink): $target"
    return
  fi

  ln -s "$link_src" "$target" || echo "Failed to create symlink: $target -> $link_src"
}

echo "$CONF_FILES" | while IFS=: read -r name place_dir src; do
  [ -z "$name" ] && continue
  make_symlink "$name" "$place_dir" "$src"
done

echo "\done!/"
