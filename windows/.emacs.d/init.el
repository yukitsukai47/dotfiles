(set-language-environment 'Japanese)
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

(global-unset-key "\C-q")
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c C-h") 'help-command)

(global-set-key (kbd "C-q -")  'split-window-vertically)
(global-set-key (kbd "C-q |")  'split-window-horizontally)
(global-set-key (kbd "C-q x")  'delete-window)
(global-set-key (kbd "C-q c")  'make-frame-command)
(global-set-key (kbd "C-q n")  'other-frame)
(global-set-key (kbd "C-q C-b")  'windmove-left)
(global-set-key (kbd "C-q C-n")  'windmove-down)
(global-set-key (kbd "C-q C-p")  'windmove-up)
(global-set-key (kbd "C-q C-f") 'windmove-right)
(global-set-key "\M-n" (kbd "C-u 3 C-n"))
(global-set-key "\M-p" (kbd "C-u 3 C-p"))

(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq scroll-conservatively 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(menu-bar-mode -1)
(column-number-mode t)
(global-linum-mode t)
(set-face-attribute 'linum nil
            :foreground "yellow1"
            :height 0.9)
(show-paren-mode t)
(set-face-background 'show-paren-match nil)
(set-face-attribute 'show-paren-match nil
                    :inherit 'highlight)

(set-face-foreground 'default "white")
(set-face-background 'default "black")
(set-face-foreground 'font-lock-type-face "green1")
(set-face-foreground 'font-lock-variable-name-face "white")
(set-face-foreground 'font-lock-function-name-face "yellow1")
(set-face-foreground 'font-lock-builtin-face "magenta1")
(set-face-foreground 'font-lock-keyword-face "cyan1")
(set-face-foreground 'font-lock-string-face "red1")
(set-face-foreground 'font-lock-comment-face "green1")
(set-face-foreground 'font-lock-constant-face "cyan1")
(set-face-foreground 'font-lock-warning-face "violet")

; mac
(when (eq system-type 'darwin)
	  (defun copy-from-darwin ()
	    (shell-command-to-string "pbpaste"))
	  (defun paste-to-darwin (text &optional push)
	    (let ((process-connection-type nil))
	      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
		(process-send-string proc text)
		(process-send-eof proc))))
	  (setq interprogram-cut-function 'paste-to-darwin)
	  (setq interprogram-paste-function 'copy-from-darwin)
	  )
  
;wsl
(defun wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "clip.exe"))
(global-set-key(kbd "C-c C-c")'wsl-copy)

(defun wsl-paste ()
  (interactive)
  (insert (shell-command-to-string "powershell.exe -command 'Get-Clipboard'")))
(global-set-key (kbd "C-c C-v") 'wsl-paste)

; package
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(markdown-mode counsel flycheck elpy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)

; elpy
; Company,highlight-indentation,pyvenv,yasnippet,s
(elpy-enable)
; company
(add-hook 'after-init-hook 'global-company-mode)
; flycheck
(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
; ivy
(ivy-mode 1)
; counsel
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
