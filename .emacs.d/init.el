(set-language-environment 'Japanese)
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key "\M-n" (kbd "C-u 4 C-n"))
(global-set-key "\M-p" (kbd "C-u 4 C-p"))
(global-set-key (kbd "C-S-i") 'indent-region)
(global-set-key (kbd "C-c a") 'align-regexp)

(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq scroll-conservatively 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(add-hook 'python-mode-hook
	  '(lambda()
	     (setq indent-tabs-mode nil)
	     (setq indent-level 4)
	     (setq python-indent 4)))
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

; Org-mode
(setq org-startup-truncated nil)
(setq org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/")

;(defun all-indent ()
;     (interactive)
;     (mark-whole-buffer)
;     (indent-region (region-beginning)(region-end))

;; C-x n (Open note.org)
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Library/Mobile Documents/com~apple~CloudDocs/" file))))
(global-set-key (kbd "C-x n") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

; mac
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
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

; wsl
;(global-set-key
; (kbd "C-c C-c")
; 'wsl-copy)
;(global-set-key
; (kbd "C-c C-v")
; 'wsl-paste)
;(defun wsl-copy (start end)
;  (interactive "r")
;  (shell-command-on-region start end "clip.exe")
;  (deactivate-mark))
;(defun wsl-paste ()
;  (interactive)
;  (let ((clipboard
;		 (shell-command-to-string "powershell.exe -command 'Get-Clipboard' 2> /dev/null")))
;    (setq clipboard (replace-regexp-in-string "\r" "" clipboard))
;    (setq clipboard (substring clipboard 0 -1))
;    (insert clipboard)))

; linux
;(when (eq system-type 'gnu/linux)
;  (defun copy-from-linux (text &optional push)
;    (interactive)
;    (if (display-graphic-p)
;		(progn
;		  (message "Yanked region to x-clipboard!")
;		  (call-interactively 'clipboard-kill-ring-save)
;		  )
;      (if (region-active-p)
;		  (progn
;			(shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
;			(message "Yanked region to clipboard!")
;			(deactivate-mark))
;		(message "No region active; can't yank to clipboard!")))
;    )
;  (defun paste-to-linux ()
;    (interactive)
;	(if (display-graphic-p)
;		(progn
;		  (clipboard-yank)
;		  (message "graphics active")
;		  )
;      (insert (shell-command-to-string "xsel -o -b"))
;      )
;    )
;  (setq interprogram-cut-function 'copy-from-linux)
;  (global-set-key (kbd "C-S-v") 'paste-to-linux)
;  )

; package
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(php-mode undo-tree markdown-mode flycheck counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)

; ivy
(ivy-mode 1)

; flycheck
(global-flycheck-mode)

; counsel
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

; company
(global-company-mode)
(global-set-key (kbd "M-i") 'company-complete)
(setq company-require-match 'never)
(define-key company-active-map (kbd "M-n") 'nil)
(define-key company-active-map (kbd "M-p") 'nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map (kbd "C-h") nil)
(define-key company-active-map (kbd "C-S-h") 'company-show-doc-buffer)

; undo-tree
(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-redo)
