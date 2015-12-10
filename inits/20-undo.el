;; extension undo

(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

(require 'undohist)
(undohist-initialize)
