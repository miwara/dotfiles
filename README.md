dotfiles
=====================
各種ツールの設定ファイルを管理する  
Emacsの設定ファイル郡  
.zshrc，.tmux.confも管理する  
その他のdotfileも追加する

使い方
-------
    git clone git@github.com:/miwara/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ./placefiles.sh

後はEmacsを起動して，M-x package-install-selected-packagesを実行すれば良い
パッケージ管理はpackage.elを使っているので追加削除はpackage.elのマニュアル参照のこと
