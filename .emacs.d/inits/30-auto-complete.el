;; =============================
;;;; auto-complete
;; =============================
(require 'auto-complete)

;; 辞書追加
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'auto-complete-config)

(ac-config-default)
(setq ac-use-menu-map t)


;; n文字以上の単語の時に補完を開始
;(setq ac-auto-start 2)
(setq ac-auto-start nil)

;; n秒後に補完開始
(setq ac-delay 0.05)
;(setq ac-delay 0.1)

;; 曖昧マッチ有効
(setq ac-use-fuzzy t)

;; 補完推測機能有効
(setq ac-use-comphist t)

;; n秒後に補完メニューを表示
;(setq ac-auto-show-menu 0.05)
(setq ac-auto-show-menu nil)

;; n秒後にクイックヘルプを表示
;(setq ac-quick-help-delay 0.5)
(setq ac-quick-help-delay 0.1)

;; TABで実行
(ac-set-trigger-key "TAB")

(add-hook 'auto-complete-mode-hook 'ac-common-setup)


;(defvar my-ac-sources
;              '(ac-source-abbrev
;                ac-source-dabbrev
;                ac-source-dictionary
;                ac-source-filename
;                ac-source-words-in-same-mode-buffers
;                ac-source-yasnippet))


;; 候補の最大件数 デフォルトは 10件
(setq ac-candidate-limit nil)

(global-auto-complete-mode t)

(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes 'js2-mode)

;;; yasnippetのbindingを指定するとエラーが出るので回避する方法。
(setf (symbol-function 'yas-active-keys)
      (lambda ()
        (remove-duplicates (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))
