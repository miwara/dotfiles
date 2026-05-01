;; --- 10-filetree.el (File Tree: treemacs) ---

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :custom
  (treemacs-width 30)
  (treemacs-show-hidden-files t)
  (treemacs-follow-after-init t)
  (treemacs-is-never-other-window t)
  ;; ワークスペース（perspective）ごとに状態を独立させる
  (treemacs-set-scope-type 'Perspectives)
  :config
  (treemacs-follow-mode 1)
  (treemacs-filewatch-mode 1)
  (treemacs-project-follow-mode 1)
  :bind
  ("C-c e" . treemacs))

(use-package treemacs-perspective
  :ensure t
  :after (treemacs perspective)
  :config
  (treemacs-set-scope-type 'Perspectives))

;; ワークスペース作成・切替時に Treemacs を確実に表示し，フォーカスを戻す
(defun +treemacs/ensure-visible-h (&rest _)
  (when (featurep 'treemacs)
    (run-at-time 0.1 nil
                 (lambda ()
                   (unless (treemacs-get-local-window)
                     (save-selected-window (treemacs)))))))

;; perspective のフックに登録
(with-eval-after-load 'perspective
  (add-hook 'persp-switch-hook #'+treemacs/ensure-visible-h)
  (add-hook 'persp-created-hook #'+treemacs/ensure-visible-h))

;; 起動時と daemon の client frame 作成時にファイルツリーを開く
(defun +treemacs/open-on-startup-h (&rest _)
  (run-at-time
   0.1 nil
   (lambda ()
     (when (require 'treemacs nil t)
       (unless (treemacs-get-local-window)
         (save-selected-window (treemacs)))))))

(add-hook 'emacs-startup-hook #'+treemacs/open-on-startup-h)
(add-hook 'server-after-make-frame-hook #'+treemacs/open-on-startup-h)
