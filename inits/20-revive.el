;; revive
;; http://www.gentei.org/~yuuji/software/revive.el

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(global-set-key (kbd "C-c d") 'save-current-configuration)
(global-set-key (kbd "C-c r") 'resume)
(add-hook 'kill-emacs-hook 'save-current-configuration)
