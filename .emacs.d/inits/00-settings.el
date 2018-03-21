;;;; ==========
;;;; バックアップファイルをまとめる
;;;; ==========
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;;;; ==========
;;;; 自動保存のファイル名
;;;; ==========
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;;;; ==========
;;;; インデントをスペースに
;;;; ==========
;(defun my-c-mode-hook ()
;  (c-set-style "linux")
;  (setq c-basic-offset tab-width))
;(add-hook 'c-mode-hook 'my-c-mode-hook)
;(setq-default tab-width 4 indent-tabs-mode nil)


;;;; ==========
;;;; 関数内の強調表示
;;;; 対応する括弧をハイライト
;;;; ==========
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil :background "#0d5e56" :foreground "#ffffff")

;;;; ==========
;;;; 編集時 buffer 再読み込み
;;;; ==========
;(global-auto-revert-mode 1)


;;;; ==========
;;;; ファイルの最後に改行を挿入する
;;;; ==========
(setq require-final-newline t)

;;;; ==========
;;;; Emacs の質問を y/n に
;;;; ==========
(fset 'yes-or-no-p 'y-or-n-p)

;;;; ==========
;;;; 補完時に大文字小文字を区別しない
;;;; ==========
(setq completion-ignore-case t)
;(setq read-file-name-completion-ignore-case t)

;;;; ==========
;;;; シンボリックリンクを開くときの質問省略
;;;; ==========
;(setq vc-follow-symlinks t)

;;;; ==========
;;;; linum-mode をいじって Emacs を高速化
;;;; ==========
;(setq linum-delay t)
;(defadvice linum-schedule (around my-linum-schedule () activate)
;  (run-with-idle-timer 0.2 nil #'linum-update-current))

;;;; ==========
;;;; スクロール時の移動量を1に
;;;; ==========
;(setq scroll-step 1)

;;;; ==========
;;;; カーソルの位置が何文字目かを表示する
;;;; ==========
(column-number-mode t)

;;;; ==========
;;;; カーソルの位置が何行目かを表示する
;;;; ==========
(line-number-mode t)

;;;; ==========
;;;; 透明度を設定(アクティブ 非アクティブの透明度)
;;;; ==========
(add-to-list 'default-frame-alist '(alpha . (0.9 0.5)))

;;;; ==========
;;;; 文字コード
;;;; ==========
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;(prefer-coding-system 'utf-8)

;;;; ==========
;;;; set language Japanese
;;;; ==========
;(set-language-environment 'Japanese)

;;;; ==========
;;;; ヘッダーのメニューバーを消す
;;;; ==========
(menu-bar-mode 0)


;;;; ==========
;;;; beep
;;;; ==========
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;;;; ==========
;;;; 拡張コマンド:インデント
;;;; ==========
(defun my-indent-region (N) ;; インデント(space4)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N) ;; 逆インデント(space4)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(define-key global-map (kbd "C-x >") 'my-indent-region) ;; set indent key-map
(define-key global-map (kbd "C-x <") 'my-unindent-region) ;; set un-indent key-map

;;;; ==========
;;;; lispのメモリサイズ
;;;; ==========
(setq max-lisp-eval-depth 1000)
(setq max-specpdl-size 6000)

;;;; ==========
;;;; タブ設定
;;;; tabの代わりにスペースでインデント
;;;; ==========
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4 indent-tabs-mode nil)

;;;; ==========
;;;; 起動するモードの設定
;;;; ==========
(setq auto-mode-alist (append '(
    ("\\.py$" . python-mode)
    ("\\.md$" . markdown-mode)
    ("\\.js$" . js2-mode)
    ("\\.json$" . json-mode)
    ("\\.markdown$" . markdown-mode)
    ("\\.jade$" . jade-mode)
) auto-mode-alist))

;;;; ==========
;; 起動時のメッセージを非表示
;;;; ==========
(setq inhibit-startup-message t)


;;;; ==========
;;;; C-x bでミニバッファにバッファ候補を表示
;;;; ==========
;(iswitchb-mode t)
;(iswitchb-default-keybindings)

;;;; ==========
;;;; バッファ一覧の情報をさらに表示
;;;; ==========
;(global-set-key "\C-x\C-b" 'bs-show)

;;;; ==========
;;;; 補完可能なものを随時表示
;;;; ==========
(icomplete-mode 1)


;;;; ==========
;;;; バックアップファイルを作らない
;;;; ==========
;(setq backup-inhibited t)

;;;; ==========
;;;; オートセーブファイルを作らない
;;;; ==========
;(setq auto-save-dafault nil)

;;;; ==========
;;;; 終了時にオートセーブファイルを消す
;;;; ==========
;(setq delete-auto-save-files t)

;;;; ==========
;;;; 行末の空白を保存前に削除。
;;;; ==========
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;;; ==========
;;;; カーソルの点滅を止める
;;;; ==========
(blink-cursor-mode 0)



;;;; ==========
;;;; 行の先頭でC-kを一回押すだけで行全体を消去する
;;;; ==========
(setq kill-whole-line t)

;;;; ==========
;;;; 圧縮されたファイルも編集できるようにする
;;;; ==========
(auto-compression-mode t)

;;;; ==========
;;;; *scratch* で最初に書かれる message を消す
;;;; ==========
(setq initial-scratch-message "")

;;;; ==========
;; タイトルバーにファイル名を表示する
;;;; ==========
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))


;;;; ==========
;;;; 範囲選択色付け
;;;; ==========
(setq transient-mark-mode t)

;;;; ==========
;;;; カーソル行のborder-bottom
;;;; ==========
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'underline)
(global-hl-line-mode)

;;;; ==========
;;;; 折り返し表示
;;;; ==========
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;;;; ==========
;;;; gzファイルも編集できるようにする
;;;; ==========
(auto-compression-mode t)

;;;; ==========
;;;; 関数名表示
;;;; ==========
(which-function-mode 1)


;;;; ==========
;;;; 履歴を次回emacs起動時にも保存する
;;;; ==========
(savehist-mode 1)

;;;; ==========
;;;; 履歴をたくさん保存する
;;;; ==========
(setq history-length 1000)

;;;; ==========
;;;; 時間を表示
;;;; ==========
(display-time)

;;;; ==========
;;;; カラー設定
;;;; ==========
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-tangotango)


;;;; ==========
;;;; yankした文字列をハイライト表示する
;;;; ==========
(when (or window-system (eq emacs-major-version '21))
  (defadvice yank (after ys:highlight-string activate)
    (let ((ol (make-overlay (mark t) (point))))
      (overlay-put ol 'face 'highlight)
      (sit-for 0.5)
      (delete-overlay ol)))
  (defadvice yank-pop (after ys:highlight-string activate)
    (when (eq last-command 'yank)
      (let ((ol (make-overlay (mark t) (point))))
        (overlay-put ol 'face 'highlight)
        (sit-for 0.5)
        (delete-overlay ol)))))

;;;; ==========
;;;; ウィンドウ移動とフレーム移動
;;;; ==========

;; 画面分割した時にshift+矢印キーで移動
(windmove-default-keybindings)

;; ついでに、循環させる（一番上のウィンドウで上を押すと、一番下にいく）
(setq windmove-wrap-around t)

;; M-C-移動キーでウィンドウを移動可能に
(define-key global-map [(M C n)] 'windmove-down)
(define-key global-map [(M C p)] 'windmove-up)
(define-key global-map [(M C b)] 'windmove-left)
(define-key global-map [(M C f)] 'windmove-right)

;;フレーム移動を簡略化
(global-set-key "\C-x\C-b" '(lambda () "" (interactive) (other-frame 1)))
