;; =============================
;;;; flymake-jshint
;; =============================
(add-hook 'js2-mode-hook '(lambda ()
          (require 'flymake-jshint)
          (flymake-jshint-load)))
