;; open-junk-file

(use-package open-junk-file
  :defer t
  :init
  (setq open-junk-file-format "~/Documents/junk/%Y-%m-%d-%H%M%S.md")
  :bind ("C-x j" . open-junk-file)
  )
