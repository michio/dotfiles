;;;; ==========
;;;; helm
;;;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;;;; ==========
(require 'helm-config nil t)
(helm-mode 1)

;;;; ==========
;; key settings
;;;; ==========
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-mini)
;(global-set-key (kbd "C-c C-f") 'helm-find-files)
;(define-key global-map          (kbd "C-x b")   'helm-buffers-list)
;(global-set-key                 (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map          (kbd "C-c C-r") 'helm-recentf)
(define-key global-map          (kbd "C-c C-i")   'helm-imenu)
(global-set-key                 (kbd "C-c C-d")   'helm-descbinds)
;(global-set-key                 (kbd "C-c C-o")   'helm-occur)
;(global-set-key                 (kbd "C-c C-s")   'helm-ag)
;(global-set-key                 (kbd "C-c C-k")   'helm-show-kill-ring)

;C-x C-f でタブ補完（選択）できない
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action) ;; For find-file etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action) ;; For helm-find-files etc.

;minibuffer で C-h が効かない
(define-key helm-map            (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

(define-key helm-command-map (kbd "M-/") 'helm-dabbrev)


;;;; ==========
;;;; popwin を使ってbuffer を下部に配置
;;;; ==========
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)


;;;; ==========
;; helm-buffers-list のバッファ領域
;;;; ==========
(setq helm-buffer-max-length 50)

;;;; ==========
;; helm-mode 有効時でも helm-find-files は無効にする
;;;; ==========
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))


;;;; ==========
;;;; buffer 拡張 keymap
;;;; ==========

;(defun helm-mini ()
;  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
;  (interactive)
;  (helm-other-buffer '(helm-c-source-buffers-list
;                       helm-c-source-recentf
;                       helm-c-source-buffer-not-found)
;                     "*helm mini*"))

(defun helm-my ()
  (interactive)
  (helm :sources '(
                   helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-files-in-current-dir
                   helm-c-source-mac-spotlight
                   helm-c-source-buffer-not-found)
        :buffer "*helm my*"))

(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-files-in-current-dir
                       helm-c-source-recentf
                       helm-c-source-mac-spotlight
                       helm-c-source-buffer-not-found)
                     "*helm my buffers*"))

(global-set-key (kbd "C-x b") 'helm-my) ; external
(global-set-key (kbd "C-x C-b") 'helm-my-buffers) ; external


;;;; ==========
;;;; buffer を拡張
;;;; ==========

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(eval-after-load "helm-files"
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'helm-ff-backspace)
     (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)))
(define-key helm-command-map (kbd "y") 'yas/insert-snippet)

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))


(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))


(defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
  "Transform the pattern to reflect my intention"
  (let* ((pattern (ad-get-arg 0))
         (input-pattern (file-name-nondirectory pattern))
         (dirname (file-name-directory pattern)))
    (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
    (setq ad-return-value
          (concat dirname
                  (if (string-match "^\\^" input-pattern)
                      ;; '^' is a pattern for basename
                      ;; and not required because the directory name is prepended
                      (substring input-pattern 1)
                    (concat ".*" input-pattern))))))


(defun helm-buffers-list-pattern-transformer (pattern)
  (if (equal pattern "")
      pattern
    ;; Escape '.' to match '.' instead of an arbitrary character
    (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
    (let ((first-char (substring pattern 0 1)))
      (cond ((equal first-char "*")
             (concat " " pattern))
            ((equal first-char "=")
             (concat "*" (substring pattern 1)))
            (t
             pattern)))))

(add-to-list 'helm-source-buffers-list
             '(pattern-transformer helm-buffers-list-pattern-transformer))
