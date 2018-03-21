;; =============================
;;; GDB
;; =============================
(setq gdb-many-windows t) ;;; 有用なバッファを開くモード
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t))) ;;; 変数の上にマウスカーソルを置くと値を表示
(setq gdb-use-separate-io-buffer t) ;;; I/O バッファを表示
(setq gud-tooltip-echo-area nil) ;;; t にすると mini buffer に値が表示される
