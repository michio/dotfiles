;;;; ==========
;;;; etags: ctags/helm-etags+
;;;; ==========
;;
;; @see: https://github.com/yukihr/dotfiles/blob/master/.emacs.d/inits/25_global.el
;;
;; Install gnu global
;;
;; On Mac:
;;     $ brew install global --with-exuberant-ctags
;;     $ brew link --overwrite ctags #if necessary, remove emacs bundled ctags
;;
;; Set EnVar(bash/zsh):
;;     export GTAGSLABEL=exuberant-ctags

(require 'helm-etags+)
(global-set-key "\M-." 'helm-etags+-select)
(global-set-key (kbd "<f3>") 'helm-etags+-select)

;; list all visited tags
(global-set-key "\M-*" 'helm-etags+-history)

;; go back directly
;(global-set-key "\M-," 'helm-etags+-history-action-go-back)
;(global-set-key (kbd "<f1>") 'helm-etags+-history-action-go-back)

;; go forward directly
;(global-set-key "\M-/" 'helm-etags+-history-action-go-forward)
;(global-set-key (kbd "<f2>") 'helm-etags+-history-action-go-forward)

;;;; ==========
;;;; and how to work with etags-table.el
;;;; ==========
(require 'etags-table)
(setq etags-table-alist
      (list
       ;'("/home/me/Projects/foo/.*\\.[ch]$" "/home/me/Projects/lib1/TAGS" "/home/me/Projects/lib2/TAGS")
       ;'("/home/me/Projects/bar/.*\\.py$" "/home/me/Projects/python/common/TAGS")
       ;'("/tmp/.*\\.c$"  "/java/tags/linux.tag" "/tmp/TAGS" )
       ;'(".*\\.java$"  "/opt/sun-jdk-1.6.0.22/src/TAGS" )
       ;'(".*\\.[ch]$"  "/java/tags/linux.ctags")
       ))
(add-hook 'helm-etags+-select-hook 'etags-table-recompute)

;;;; ==========
;;;; auto-complete etags
;;;; ==========
(require 'ac-etags)

(custom-set-variables
 '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(defun my/c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))

(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)


;;;; ==========
;;;; ctags-update
;;;; ==========
(auto) update TAGS using exuberant-ctags
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
(add-hook 'c-mode-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'js2-mode-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'python-mode-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'c++-mode-hook  'turn-on-ctags-auto-update-mode)
;(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)

;(global-set-key (kbd "C-c E") 'ctags-update)
