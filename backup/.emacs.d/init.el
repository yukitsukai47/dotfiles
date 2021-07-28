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
(set-language-environment 'Japanese)
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
; -------------------------


; ----------------
; key bind
; ----------------
(global-unset-key "\C-q")
(global-set-key (kbd "C-x C-S-f") 'find-file)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key (kbd "C-q ;")  'comment-dwim)
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; tmux
(global-set-key (kbd "C-q -")  'split-window-vertically)
(global-set-key (kbd "C-q |")  'split-window-horizontally)
(global-set-key (kbd "C-q x")  'delete-window)
(global-set-key (kbd "C-q c")  'make-frame-command)
(global-set-key (kbd "C-q n")  'other-frame)
;;;; Linux
(global-set-key (kbd "C-q C-b")  'windmove-left)
(global-set-key (kbd "C-q C-n")  'windmove-down)
(global-set-key (kbd "C-q C-p")    'windmove-up)
(global-set-key (kbd "C-q C-f") 'windmove-right)
;;;; Windows
;(global-set-key (kbd "C-q <left>")  'windmove-left)
;(global-set-key (kbd "C-q <down>")  'windmove-down)
;(global-set-key (kbd "C-q <up>")    'windmove-up)
;(global-set-key (kbd "C-q <right>") 'windmove-right)
; -------------------------


; ----------------
; preferences
; ----------------
(setq initial-scratch-message nil)
(electric-pair-mode 1)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq inhibit-startup-message t)
(column-number-mode t)
(global-linum-mode t)
(display-time)
(setq scroll-conservatively 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match nil
      :background 'unspecified)
(set-face-underline-p 'show-paren-match "red")
(menu-bar-mode -1)
(setq x-select-enable-clipboard t)
(require 'auto-complete)
(require 'auto-complete-config)
(setq python-indent-guess-indent-offset t)
(setq python-indent-guess-indent-offset-verbose nil)
(setq make-backup-files nil)
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
