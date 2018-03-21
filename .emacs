;;;; ==========
;;;; ~/.emacs.d/site-lisp 配下をロード
;;;; WARN: init-loader で管理するので使わない
;;;; ==========
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;;;; ==========
;;;; package.el
;;;; ==========
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;;; ==========
;;;; cl
;;;; ==========
(require 'cl)


;;;; ==========
;;;; 自動インストール
;;;; ==========
(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
    js2-mode
    egg
    python-mode
    web-mode
    recentf
    col-highlight
    handlebars-mode
    json-mode
    saveplace
    whitespace
    color-moccur
    git-dwim
    jade-mode
    linum
    sr-speedbar
    yasnippet
    ;uniquify
    dash-at-point
    google-c-style
    js-doc
    stylus-mode
    auto-complete
    diff-mode
    google-translate
    popwin
    wdired
    auto-highlight-symbol
    color-theme
    yaml-mode
    markdown-mode
    hlinum
    powerline
    cmake-mode
    csharp-mode
    company

    helm
    helm-c-yasnippet
    helm-c-moccur
    helm-descbinds

    flymake-cursor
    flymake-cppcheck
    flymake-json
    flymake-jshint

    ac-ispell
    ac-js2
    ac-helm
    auto-complete-clang-async
    auto-complete-c-headers

    ctags
    ac-etags
    etags-table
    ;ctags-update

    ;evil


    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

;;;; ==========
;;;; init-loader
;;;; ==========
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(defun init-loader-re-load (re dir &optional sort)
  (let ((load-path (cons dir load-path)))
    (dolist (el (init-loader--re-load-files re dir sort))
      (condition-case e
          (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
            (init-loader-log (format "loaded %s. %s" (locate-library el) time)))
        (error
         ;; (init-loader-error-log (error-message-string e)) ；削除
         (init-loader-error-log (format "%s. %s" (locate-library el) (error-message-string e))) ;追加
         )))))

;; after init
;(add-hook 'after-init-hook
;  (lambda ()
;    ;; split window
;    (split-window-horizontally)
;    ;; show init time
;    (message "init time: %.3f sec"
;             (float-time (time-subtract after-init-time before-init-time)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ac-ispell-requires 4)
 '(flymake-cppcheck-enable "warning,performance,information,style")
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(package-selected-packages
   (quote
    (etags-table ac-etags ctags auto-complete-c-headers auto-complete-clang-async ac-helm ac-js2 ac-ispell yaml-mode web-mode stylus-mode sr-speedbar python-mode powerline popwin markdown-mode json-mode js2-mode js-doc jade-mode init-loader hlinum helm-descbinds helm-c-yasnippet helm-c-moccur handlebars-mode google-translate google-c-style git-dwim flymake-json flymake-jshint flymake-cursor flymake-cppcheck egg dash-at-point csharp-mode company color-theme col-highlight cmake-mode auto-highlight-symbol auto-complete)))
 '(yas-trigger-key "TAB" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :foreground "#2d891f"))))
 '(linum-highlight-face ((t (:foreground "#000" :background "#81cc30")))))
