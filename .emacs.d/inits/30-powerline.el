;;;; ==========
;;;; powerline
;;;; ==========
(require 'powerline)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
;                    :background "#62ce30"
                    :background "#2d891f"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#000"
;                    :background "#4dac26"
                    :background "#34aa27"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#000"
;                    :background "#338c26"
                    :background "#81cc30"
                    :inherit 'mode-line)

(powerline-default-theme)
