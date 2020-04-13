;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

; ---------------
; language
; ---------------
;; set language as Japanese
(set-language-environment 'Japanese)
;; coding UTF8
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

; ----------------
; key bind
; ----------------
;; backspeace
(global-set-key "\C-h" 'delete-backward-char)
;; help
(global-set-key "\C-c\C-h" 'help-command)
;; comment out
(global-set-key "\C-c;" 'comment-dwim)
;; window operation
(global-set-key "\C-t" 'other-window)

; -----------------
; preferences
; -----------------
;;This buffer〜で始まる文章を表示しない
(setq initial-scratch-message nil)
;括弧を自動で補完する
(electric-pair-mode 1)
;; tabにスペース４つを利用
(setq-default tab-width 4 indent-tabs-mode nil)
;; デフォルトの起動時のメッセージを表示しない
(setq inhibit-startup-message t)
;; 列の番号
(column-number-mode t)
;; 行番号の表示
(global-linum-mode t)
;; 1行ごとの改ページ
(setq scroll-conservatively 1)
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; メニューバーの非表示
(menu-bar-mode -1)

;; auto-complete
(require 'auto-complete-config)
(global-auto-complete-mode 0.5)

; monokai-theme----
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4e839b24f87c529e837535d0a7880f40ac3867b6e3e73a2cf2bb40bab53d4658" default)))
 '(package-selected-packages
   (quote
    (auto-virtualenv elpy undo-tree leaf-keywords hydra auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'monokai t)
; ------------------

;python編集時に警告を出さない-----------
(setq python-indent-guess-indent-offset t)  
(setq python-indent-guess-indent-offset-verbose nil)
;---------------------------------------


;*.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)


 (when (and (require 'python nil t) (require 'elpy nil t))
   (elpy-enable))
