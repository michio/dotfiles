;; =============================
;;;; col-highlight
;; =============================
(require 'col-highlight)

;; 常にハイライト
;(column-highlight-mode 1)

;; 何もしないでいるとハイライト
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 10) ;(sec)
