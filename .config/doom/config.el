;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   - Setting file/directory variables (like `org-directory`)
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq confirm-kill-emacs nil)

;; -----------------------------------------------------------------------------
;; UI & Completion
;; -----------------------------------------------------------------------------
(setq read-file-name-completion-ignore-case t
      completion-ignore-case t)

(after! vertico
  (setq completion-category-overrides
        '((file (styles basic partial-completion)))))

;; 変更の自動反映
(setq auto-revert-verbose nil
      global-auto-revert-non-file-buffers t)
;; バッファの自動再読み込み
(global-auto-revert-mode 1)

(setq help-char nil
      help-event-list '(f1))

;;
;; mode keybind
;;
(map! :nvi "C-l" #'recenter-top-bottom
      :nvi "C-c m ." #'evil-mc-make-and-goto-next-match
      :nvi "C-c m ," #'evil-mc-make-and-goto-prev-match
      :nvi "M-<down>" #'evil-mc-make-cursor-move-next-line
      :nvi "M-<up>" #'evil-mc-make-cursor-move-prev-line
      )

(map! :i "C-k" #'kill-line
      :i "C-h" #'delete-backward-char
      :i "C-d" #'delete-char
      )

;;(map! :vi "C-b" #'backward-char
;;      :vi "C-f" #'forward-char
;;      :vi "C-p" #'previous-line
;;      :vi "C-n" #'next-line
;;      :vi "C-a" #'move-beginning-of-line
;;      :vi "C-e" #'move-end-of-line
;;      :vi "M-f" #'forward-word
;;      :vi "M-b" #'backward-word
;;      )


;;(map! :n "RET" #'+editor/open-line-below-like-ret)

(defun +editor/open-line-below-like-ret ()
  "現在行の下に空行を作る．"
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (forward-line 1)
  (back-to-indentation))

;;
;; mojor mode keybind
;;
(after! evil
  (setq windmove-wrap-around t)
  (map! :map evil-window-map
        "h" #'windmove-left
        "j" #'windmove-down
        "k" #'windmove-up
        "l" #'windmove-right))

(after! corfu
  (setq corfu-auto-delay 0.1
        corfu-auto-prefix 2)
  (map! :map corfu-map
        "M-n" #'corfu-next
        "M-p" #'corfu-previous)
  (map! :map corfu-mode-map
        :i "C-n" #'next-line
        :i "C-p" #'previous-line
        :i "M-n" #'+corfu/dabbrev-or-next
        :i "M-p" #'+corfu/dabbrev-or-last))

(after! evil-markdown
  (map! :map evil-markdown-mode-map
        ;; :n "RET" #'+editor/open-line-below-like-ret
        :n "RET" nil
        :i "C-d" #'delete-char))
(after! markdown-mode
  (map! :map markdown-mode-map
        :n "RET" nil))

(after! centaur-tabs
  (setq centaur-tabs-buffer-groups-function (lambda () (list "All"))
        centaur-tabs-set-bar 'above
        centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-cycle-scope 'tabs)

  (defun +dired/buffer-p (buffer)
    "Return non-nil when BUFFER is a Dired buffer."
    (with-current-buffer buffer
      (derived-mode-p 'dired-mode)))

  ;; ワークスペース（Perspective）に属するバッファのみを表示
  (setq centaur-tabs-buffer-list-function
        (lambda ()
          (condition-case nil
              (let ((bufs (if (fboundp '+workspace-buffer-list)
                              (+workspace-buffer-list)
                            (buffer-list))))
                (seq-filter
                 (lambda (b)
                   (and (buffer-live-p b)
                        (memq b bufs)
                        (not (+dired/buffer-p b))
                        (not (cl-some (lambda (prefix)
                                        (string-prefix-p prefix (buffer-name b)))
                                      centaur-tabs-excluded-prefixes))))
                 (buffer-list)))
            (error (buffer-list)))))

  (add-hook '+workspace-switch-hook #'centaur-tabs-buffer-update-groups))

(defun +magit/commit-message-clean-windows-h ()
  "Git commit message を開いたとき，前回の window 構成を捨てる．"
  (when (and buffer-file-name
             (string-match-p "COMMIT_EDITMSG\\'" buffer-file-name))
    (delete-other-windows)))

(defun +magit/rebase-todo-clean-windows-h ()
  "git rebase todo 編集時に，前回の diff window を捨てる．"
  (delete-other-windows))

(add-hook 'git-commit-setup-hook #'+magit/commit-message-clean-windows-h)
(add-hook 'git-rebase-mode-hook #'+magit/rebase-todo-clean-windows-h)

;; 現在位置が属する関数・定義名をモードラインに表示する
(require 'which-func)
(which-function-mode t)

;;
;; major mode function alias
;;

(defun alias-command-unless-defined (name target)
  (if (fboundp name)
      (message "Alias skipped: %s already exists" name)
    (defalias name target)))

(after! centaur-tabs
  (alias-command-unless-defined
   'move-tab-left
   #'centaur-tabs-move-current-tab-to-left)
  (alias-command-unless-defined
   'move-tab-right
   #'centaur-tabs-move-current-tab-to-right))

(after! treemacs
  (alias-command-unless-defined
   'focus-filetree
   #'treemacs-select-window))

;; -----------------------------------------------------------------------------
;; Terminal & Clipboard Support (macOS)
;; -----------------------------------------------------------------------------
;; マウス操作を有効化
(xterm-mouse-mode 1)

;; macOSのクリップボードとの連携（pbcopy/pbpasteを使用）
(when (and (eq system-type 'darwin) (not (display-graphic-p)))
  (defun copy-from-osx () (shell-command-to-string "pbpaste"))
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" nil "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function 'paste-to-osx
        interprogram-paste-function 'copy-from-osx))

;; ターミナルでのブラケットペーストモードを有効化（インデント崩れ防止）
(unless (display-graphic-p)
  (when (fboundp 'xterm-paste-mode)
    (xterm-paste-mode 1)))

;; -----------------------------------------------------------------------------
;; Treemacs & Workspaces: 真の同期構成
;; -----------------------------------------------------------------------------
(after! treemacs
  (setq treemacs-width 30
        treemacs-show-hidden-files t
        treemacs-follow-after-init t
        treemacs-is-never-other-window t
        ;; ワークスペース（persp-mode）ごとに状態を独立させる
        treemacs-set-scope-type 'Persp)

  (treemacs-follow-mode 1)
  (treemacs-filewatch-mode 1)
  (treemacs-project-follow-mode 1)

  (defun +treemacs/ensure-visible-h (&rest _)
    "ワークスペース切り替え・作成時に確実にTreemacsを表示し，フォーカスを戻す．"
    (when (featurep 'treemacs)
      (run-at-time 0.1 nil
                   (lambda ()
                     (unless (treemacs-get-local-window)
                       (save-selected-window (treemacs)))
                     (when (fboundp 'centaur-tabs-buffer-update-groups)
                       (centaur-tabs-buffer-update-groups))))))

  ;; ワークスペース関連のフック
  (add-hook '+workspace-switch-hook #'+treemacs/ensure-visible-h)
  (add-hook '+workspace-created-hook #'+treemacs/ensure-visible-h)
  
  ;; SPC TAB n 等のコマンド実行後にも確実に介入する
  (unless (advice-member-p #'+treemacs/ensure-visible-h #'+workspace/new)
    (advice-add #'+workspace/new :after #'+treemacs/ensure-visible-h))
  (unless (advice-member-p #'+treemacs/ensure-visible-h #'+workspace/switch-to)
    (advice-add #'+workspace/switch-to :after #'+treemacs/ensure-visible-h)))

;; 起動時と daemon の client frame 作成時に Treemacs を表示し，フォーカスを戻す
(defun +treemacs/open-on-startup-h (&rest _)
  (run-at-time
   0.1 nil
   (lambda ()
     (when (require 'treemacs nil t)
       (unless (treemacs-get-local-window)
         (save-selected-window (treemacs)))))))

(add-hook 'doom-after-init-hook #'+treemacs/open-on-startup-h)
(add-hook 'server-after-make-frame-hook #'+treemacs/open-on-startup-h)

