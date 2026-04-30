;; 文字コード
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; package.elの設定
(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file nil t))

;; -----------------------------------------------------------------------------
;; conf-loader: 自律的・堅牢な設定ロード機能
;; 仕様: docs/conf-loader.md
;; -----------------------------------------------------------------------------

(defvar conf-loader-dry-run nil "非 nil の場合，実際のロードを行わず順序を表示するのみとする．")
(defvar conf-loader-known-os-names '("darwin" "gnu-linux" "windows-nt")
  "conf-loader が認識する OS 名のリスト．ファイル名がこのリストに含まれ，かつ現在の OS と一致しない場合はスキップする．")

(defun conf-loader-run (dir)
  "指定されたディレクトリ DIR 内の .el ファイルを安全にロードする．"
  (let* ((inits-dir (expand-file-name dir user-emacs-directory))
         (files (when (file-directory-p inits-dir)
                  (directory-files inits-dir t "\\.el$")))
         (os-name (replace-regexp-in-string "/" "-" (symbol-name system-type)))
         (os-file (expand-file-name (format "%s.el" os-name) inits-dir)))
    
    (when conf-loader-dry-run
      (message "--- Starting conf-loader: %s ---" inits-dir))
    (unless files
      (message "[Warning] No files found in %s" inits-dir))
    
    ;; 1. 通常の設定ファイルをソートしてロード
    (dolist (file (sort files 'string<))
      (let ((fname (file-name-nondirectory file)))
        ;; 除外ルール: _ で始まる，または OS 名と一致する，または隠し/一時ファイル
        (let ((name (file-name-sans-extension fname)))
          (unless (or (string-prefix-p "_" fname)
                      (string-prefix-p "." fname)
                      (string-prefix-p "#" fname)
                      (string-suffix-p "~" fname)
                      (string-equal file os-file)
                      (and (member name conf-loader-known-os-names)
                           (not (string-equal name os-name))))
            (conf-loader-load-file file)))))

    ;; 2. OS 固有の設定ファイルがあれば最後にロード（上書き用）
    (when (file-exists-p os-file)
      (when conf-loader-dry-run
        (message "Loading OS-specific config: %s" os-file))
      (conf-loader-load-file os-file))

    (when conf-loader-dry-run
      (message "--- Finished conf-loader: %s ---" inits-dir))))

(defun conf-loader-load-file (file)
  "エラー保護付きで単一ファイルをロードする．"
  (if conf-loader-dry-run
      (message "Loading: %s" (file-name-nondirectory file))
    (condition-case err
        (load file nil t)
      (error (message "[Error] Failed to load %s: %s"
                      (file-name-nondirectory file)
                      (error-message-string err))))))

;; 設定ディレクトリのロード実行
(conf-loader-run "inits/")

;; -----------------------------------------------------------------------------
