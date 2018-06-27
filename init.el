;; 文字コード
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; package.elの設定
(require 'package)
(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa")))

(unless package-archive-contents
  (package-refresh-contents))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; use-packageの設定
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

;; init-loader
(use-package init-loader
	     :config
	     (init-loader-load "~/dotfiles/inits"))
