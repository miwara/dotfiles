;; init.el

(require 'package)
(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa")))

(unless package-archive-contents
  (package-refresh-contents))

;; �����R�[�h
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; load-path
;; 
;; (add-to-list 'load-path "~/.emacs.d/elisp/")

;; init-loader
(require 'init-loader)
(init-loader-load "~/dotfiles/inits")

;; �p�b�P�[�W���C���X�g�[�������珟��ɒǉ����ꂽ
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode elixir-mode go-mode yasnippet web-mode visual-regexp undohist undo-tree smartrep revive popwin php-mode pallet open-junk-file multiple-cursors magit js2-mode init-loader helm flycheck el-spec auto-complete ac-dabbrev))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000000" :foreground "#ffffff")))))
