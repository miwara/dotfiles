;; Completion: corfu

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package corfu
  :ensure t
  :demand t
  :init
  (setq corfu-auto t
        corfu-auto-delay 0.1
        corfu-auto-prefix 2
        corfu-cycle t
        tab-always-indent 'complete)
  :config
  (global-corfu-mode 1)
  :bind
  (:map corfu-map
   ("TAB" . corfu-next)
   ([tab] . corfu-next)
   ("S-TAB" . corfu-previous)
   ([backtab] . corfu-previous)
   ("RET" . corfu-insert)))

(use-package corfu-terminal
  :ensure t
  :demand t
  :unless (display-graphic-p)
  :after corfu
  :config
  (corfu-terminal-mode 1))

(global-set-key (kbd "C-SPC") #'completion-at-point)
(global-set-key (kbd "M-/") #'completion-at-point)

(use-package cape
  :ensure t
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions #'cape-file -10 t)
              (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t)))
  (add-hook 'text-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions #'cape-dabbrev 20 t))))
