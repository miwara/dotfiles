;; company

(use-package company
  :init (global-company-mode)

  :bind (:map company-active-map
	      ([tab] . company-select-next)
	      ([backtab] . company-select-previous)
	      )
  :config
  (setq company-selection-wrap-around t
	company-show-numbers t)
)
