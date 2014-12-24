;; key-combo
;; last update : 2014/09/29

(require 'key-combo)
(global-key-combo-mode t)

(key-combo-define-global (kbd ",") ", ")
(key-combo-define-global (kbd "+") '("+" " + " "++"))
(key-combo-define-global (kbd "-") '("-" " - " "--"))
(key-combo-define-global (kbd "*") '("*" " * "))
(key-combo-define-global (kbd "/") '("/" " / " "// "))
