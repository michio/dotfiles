;; =============================
;;;; ac-ispell
;; =============================
;; Completion words longer than 4 characters
(custom-set-variables
  '(ac-ispell-requires 4))

(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)
