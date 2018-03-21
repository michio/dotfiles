;;;; ==========
;;;; global key map
;;;; key map を調べる : M-x describe-bindings
;;;; ==========
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help) ; ヘルプ
(define-key global-map (kbd "C-z") 'undo) ; undo
(define-key global-map (kbd "C-c i") 'indent-region) ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand) ; 補完
(define-key global-map (kbd "C-o") 'toggle-input-method) ; 日本語入力切替
(define-key global-map (kbd "C-x C-g") 'goto-line) ; goto
(define-key global-map (kbd "M-C-g") 'grep) ; grep


(global-set-key "\M-g" 'goto-line) ; goto line
;(global-set-key "\C-h" 'backward-delete-char) ;; backspace -> \C-h

;; dabbrev
(global-set-key "\C-o" 'dabbrev-expand)

;; ESC 連打で無効化
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)


;; 単語単位で進む
(global-set-key (kbd "C-c C-f") 'forward-word)
(global-set-key (kbd "C-c C-b") 'backward-word)

;; タグジャンプ設定
(global-set-key (kbd "<f4>") 'find-tag)
(global-set-key (kbd "S-<f4>") 'pop-tag-mark)
