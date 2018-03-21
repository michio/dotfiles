(require 'hlinum)
(hlinum-activate)

; 行番号の背景色
(custom-set-faces
; '(linum ((t (:inherit (shadow default) :background "#2d891f" :foreground "#fff")))))
 '(linum ((t (:inherit (shadow default) :foreground "#2d891f")))))


;; 前景色を黒，背景色を赤にする．
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "#000"
                             :background "#81cc30")))))
