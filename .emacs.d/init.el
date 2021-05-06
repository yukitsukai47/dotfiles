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
(global-set-key (kbd "C-q <left>")  'windmove-left)
(global-set-key (kbd "C-q <down>")  'windmove-down)
(global-set-key (kbd "C-q <up>")    'windmove-up)
(global-set-key (kbd "C-q <right>") 'windmove-right)
;;; 新規ウィンドウの作成・操作・削除
(global-set-key (kbd "C-q c")  'make-frame-command)
(global-set-key (kbd "C-q n")  'other-frame)
(global-set-key (kbd "C-q x")  'delete-frame)
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


; monokai-theme ------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("4e839b24f87c529e837535d0a7880f40ac3867b6e3e73a2cf2bb40bab53d4658" default)))
 '(package-selected-packages
   (quote
    (ac-php auto-virtualenv elpy undo-tree leaf-keywords hydra auto-complete))))
(custom-set-faces
 )
(load-theme 'monokai t)
; -------------------------


; -Python- elpyのセットアップ(emacsがelpy-modeになるようにするため)-----
 (when (and (require 'python nil t) (require 'elpy nil t))
   (elpy-enable))
; -----------------------------------------------------------------


; -PHP- ac-phpのセットアップ--------------
(require 'cl)
(add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources '(ac-source-php ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
               (yas-global-mode 1)
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
               ))
; --------------------------------------
