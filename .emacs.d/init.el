; ---------------
; package
; ---------------
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
; -------------------------


; ---------------
; language
; ---------------
;; 日本語設定
(set-language-environment 'Japanese)
;; 文字コード指定
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
; -------------------------


; ----------------
; key bind
; ----------------
;; C-qの解放
(global-unset-key "\C-q")
;; WindowsとLinuxで互換性を持たせるためのfine-file
(global-set-key (kbd "C-x C-S-f") 'find-file)
;; backspeace
(global-set-key (kbd "C-h") 'delete-backward-char)
;; help
(global-set-key (kbd "C-c C-h") 'help-command)
;; 自動的にコメントアウト
(global-set-key (kbd "C-q ;")  'comment-dwim)
;; undo-treeを読み込む(M-/をredoに設定)
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; tmuxのウィンドウ操作
;;; ウィンドウ操作
(global-set-key (kbd "C-q -")  'split-window-vertically)
(global-set-key (kbd "C-q |")  'split-window-horizontally)
(global-set-key (kbd "C-q x")  'delete-window)
;;;; Linux用
(global-set-key (kbd "C-q C-b")  'windmove-left)
(global-set-key (kbd "C-q C-n")  'windmove-down)
(global-set-key (kbd "C-q C-p")    'windmove-up)
(global-set-key (kbd "C-q C-f") 'windmove-right)
;;;; Windows用
;(global-set-key (kbd "C-q <left>")  'windmove-left)
;(global-set-key (kbd "C-q <down>")  'windmove-down)
;(global-set-key (kbd "C-q <up>")    'windmove-up)
;(global-set-key (kbd "C-q <right>") 'windmove-right)
;;; 新規ウィンドウの作成・操作・削除
(global-set-key (kbd "C-q c")  'make-frame-command)
(global-set-key (kbd "C-q n")  'other-frame)
; -------------------------


; ----------------
; preferences
; ----------------
;; This bufferで始まる文章を表示しない
(setq initial-scratch-message nil)
;; ()のauto-complete
(electric-pair-mode 1)
;; tabをスペース4文字
(setq-default tab-width 4 indent-tabs-mode nil)
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)
;; カラム,ライン,時間情報の表示
(column-number-mode t)
(global-linum-mode t)
(display-time)
;; カーソル移動によるスクロールを1行に設定(自然な挙動に変更)
(setq scroll-conservatively 1)
;; カッコの中身をハイライトする
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match nil
      :background 'unspecified)
(set-face-underline-p 'show-paren-match "red")
;; メニューバーを非表示
(menu-bar-mode -1)
;; クリップボードの共有
(setq x-select-enable-clipboard t)
;; auto-completeパッケージの設定
(require 'auto-complete)
(require 'auto-complete-config)
; Pythonファイル編集時に警告を出さない
(setq python-indent-guess-indent-offset t)
(setq python-indent-guess-indent-offset-verbose nil)
; 「*.~」などのバックアップファイルを作らない
(setq make-backup-files nil)
; 「.#*」などのバックアップファイルを作らない
(setq auto-save-default nil)
; -------------------------

; ----------------
; monokai-pro-theme
; ----------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(nhexl-mode monokai-pro-theme auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'monokai-pro t)
; -------------------------
