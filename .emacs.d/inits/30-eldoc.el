;; =============================
;;;; eldoc-mode
;; =============================
(require 'eldoc-mode)

;; =============================
;;;; eldoc-extension
;; =============================
(require 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
