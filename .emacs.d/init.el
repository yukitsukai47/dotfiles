; ---------------
; package
; ---------------
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

; ----------------
; preferences
; ----------------
;; This buffer〜delete!!
(setq initial-scratch-message nil)
;; ()auto-complete
(electric-pair-mode 1)
;; tab4
(setq-default tab-width 4 indent-tabs-mode nil)
;; Do not display a message at startup
(setq inhibit-startup-message t)
;; column-number
(column-number-mode t)
;; line-number
(global-linum-mode t)
;; One line break
(setq scroll-conservatively 1)
;; light of ()
(show-paren-mode 1)
;; Hiding the menu bar
(menu-bar-mode -1)
;; clipboard share
(setq x-select-enable-clipboard t)
;; auto-complete
(require 'auto-complete-config)
(global-auto-complete-mode 0.5)

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

; No warning ---------------------------
(setq python-indent-guess-indent-offset t)  
(setq python-indent-guess-indent-offset-verbose nil)
;---------------------------------------

; No backup files ~
(setq make-backup-files nil)
; No backup files .#*
(setq auto-save-default nil)

; elpy setup---------------------------
 (when (and (require 'python nil t) (require 'elpy nil t))
   (elpy-enable))
; --------------------------------------


;; set-goal-column
(put 'set-goal-column 'disabled nil)

; ac-php--------------------------------
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
