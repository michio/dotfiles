;; =============================
;;;; flymake-cppcheck
;; =============================
(require 'flymake-cppcheck)
(add-hook 'c-mode-hook 'flymake-cppcheck-load)
(add-hook 'c++-mode-hook 'flymake-cppcheck-load)

; By default only error messages are shown.
; Through the command more checks can be enabled.
(custom-set-variables
 '(flymake-cppcheck-enable "all"))

; multi
(custom-set-variables
 '(flymake-cppcheck-enable "warning,performance,information,style"))
