(add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
(autoload 'dummy-h-mode "dummy-h-mode" "Dummy H mode" t)

(add-hook 'dummy-h-mode-hook
          (lambda ()
            (setq dummy-h-mode-default-major-mode 'c++-mode)))

(add-hook 'dummy-h-mode-hook
          (lambda ()
            (add-to-list 'dummy-h-mode-c-keywords
                         '("\*[ \t]*restrict" . 3))))

(setq max-lisp-eval-depth 1000)
