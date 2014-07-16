;; open-junk-file
;; last update : 2014/07/06

(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/programs/junk/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)
