;; key-combo
;; last update : 2013/12/15

(require 'key-combo)
(global-key-combo-mode t)

(key-combo-define-global (kbd ",") ", ")
(key-combo-define-global (kbd "+") '("+" " + "))
(key-combo-define-global (kbd "-") '("-" " - "))
(key-combo-define-global (kbd "*") '("*" " * "))
(key-combo-define-global (kbd "/") '("/" " / " "// "))
