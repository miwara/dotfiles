;; --- 20-dap.el (Debugger: dap-mode) ---

(use-package dap-mode
  :ensure t
  :config
  (dap-auto-configure-mode t)

  ;; 各言語のアダプタを読み込む
  (require 'dap-python)
  (require 'dap-go)
  (require 'dap-lldb)    ; Rust / C / C++

  ;; Python: debugpy を使用
  (setq dap-python-debugger 'debugpy)

  :bind
  (:map dap-mode-map
   ("<f5>"  . dap-debug)
   ("<f9>"  . dap-breakpoint-toggle)
   ("<f10>" . dap-next)
   ("<f11>" . dap-step-in)
   ("<f12>" . dap-step-out)))
