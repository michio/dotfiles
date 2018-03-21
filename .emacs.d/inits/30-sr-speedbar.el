;;;====================================
;;;; speedbar :F9キーで表示、非表示
;;;====================================
(require 'sr-speedbar nil t)

(global-set-key (kbd "<f9>") 'sr-speedbar-toggle)

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-max-width 20)
(setq speedbar-show-unknown-files t)
(setq speedbar-verbosity-level 0)


;; 拡張子
(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension '("js" "as" "html" "css" "php" "rst" "howm" "org" "ml" "scala" "*"))))
(provide 'init_speedbar)
