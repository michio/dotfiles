;;;; ==========
;;;; ファイル名が重複していたらディレクトリ名を追加する。
;;;; ==========
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

