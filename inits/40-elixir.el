;; Elixir mode

(use-package elixir-mode
  :defer t
  :mode (("\\.exs\\'" . elixir-mode)
	 ("\\.ex\\'" . elixir-mode))
  )
