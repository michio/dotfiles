;;;; ==========
;;;; コメント
;;;; ==========
(setq comment-style 'multi-line)

;(define-key global-map (kbd "C-c ;") 'comment-dwim) ; コメントアウト
(define-key global-map (kbd "C-c /") 'comment-region)      ; コメントアウト
(define-key global-map (kbd "C-c /") 'uncomment-region)    ; コメント解除
