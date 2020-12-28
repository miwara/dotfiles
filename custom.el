;; package.elのカスタム変数(package-selected-packages)がinit.elに勝手に追加されるので
;; このファイルで管理する

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(w3m company use-package markdown-mode elixir-mode flycheck go-mode helm magit multiple-cursors open-junk-file php-mode popup popwin web-mode js2-mode yasnippet init-loader)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000000" :foreground "#ffffff")))))
