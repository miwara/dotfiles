;; --- 20-lsp.el (LSP: eglot) ---

(use-package eglot
  :ensure nil
  :hook
  ((typescript-mode       . eglot-ensure)
   (typescript-ts-mode    . eglot-ensure)
   (js-mode               . eglot-ensure)
   (python-mode           . eglot-ensure)
   (python-ts-mode        . eglot-ensure)
   (rust-mode             . eglot-ensure)
   (rust-ts-mode          . eglot-ensure)
   (go-mode               . eglot-ensure)
   (c-mode                . eglot-ensure)
   (c++-mode              . eglot-ensure))
  :bind
  (:map eglot-mode-map
   ("M-." . xref-find-definitions)
   ("M-," . xref-pop-marker-stack)))
