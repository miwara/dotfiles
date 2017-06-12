;; open-junk-file

(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y-%m-%d-%H%M%S.md")
(global-set-key (kbd "C-x j") 'open-junk-file)
