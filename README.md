Emacs inits
=====================
Emacsの設定ファイル郡
Caskファイルも管理する


使い方
-------
.emacs.d以下にinit.el，Caskファイルのリンクを作成する

    ln -s inits/init.el ~/.emacs.d/init.el
    ln -s inits/Cask ~/.emacs.d/Cask

あとは，.emacs.dで`cask`を実行してパッケージをインストールする
