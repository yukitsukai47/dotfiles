;; language
(set-language-environment 'Japanese)
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

;; Settings
(global-linum-mode t)
(column-number-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'linum nil
					:height 0.6)
(show-paren-mode t)
(set-face-background 'show-paren-match nil)
(set-face-attribute 'show-paren-match nil
                    :inherit 'highlight)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq scroll-conservatively 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq default-directory "C:/Users/ey7heath/Desktop")

;; Keybinding
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key (kbd "C-z") 'eshell)

;;; Window management
(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q -")  'split-window-vertically)
(global-set-key (kbd "C-q |")  'split-window-horizontally)
(global-set-key (kbd "C-q x")  'delete-window)
(global-set-key (kbd "C-q c")  'make-frame-command)
(global-set-key (kbd "C-q n")  'other-frame)
(global-set-key (kbd "C-q C-b")  'windmove-left)
(global-set-key (kbd "C-q C-n")  'windmove-down)
(global-set-key (kbd "C-q C-p")  'windmove-up)
(global-set-key (kbd "C-q C-f") 'windmove-right)
(global-set-key (kbd "C-q N")  'enlarge-window)
(global-set-key (kbd "C-q F") 'enlarge-window-horizontally)
(global-set-key (kbd "C-q B") 'shrink-window-horizontally)
(global-set-key (kbd "C-.")  'repeat)

;;; Code formatting
(global-set-key (kbd "C-S-i") 'indent-region)
(global-set-key (kbd "C-c a") 'align-regexp)

;; Text mode
(setq initial-major-mode 'text-mode)
(global-set-key (kbd "C-M-t") 'text-mode)
(global-set-key "\M-[" (kbd "◆◆◆◆ 2023/02/02  岸本 ◆◆◆◆"))
(global-set-key "\M-]" (kbd "◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆"))
(global-set-key "\M-1" (kbd "■"))
(global-set-key "\M-2" (kbd "▼"))
(global-set-key "\M-3" (kbd "★"))
(global-set-key "\M-4" (kbd "◎"))
(global-set-key "\M-5" (kbd "※"))
(add-hook 'text-mode-hook
          '(lambda()
             (highlight-lines-matching-regexp "■" 'hi-pink)
             (highlight-lines-matching-regexp "▼" 'hi-yellow)
             (highlight-lines-matching-regexp "★" 'hi-aquamarine)
             (highlight-lines-matching-regexp "◎" 'hi-red-b)
             (highlight-lines-matching-regexp "※" 'hi-green)
             (highlight-lines-matching-regexp "◆" 'hi-blue)
             (highlight-lines-matching-regexp "〇" 'hi-black-hb)))


;; WSL
;(global-set-key (kbd "C-c C-c") 'wsl-copy)
;(global-set-key (kbd "C-c C-v") 'wsl-paste)
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

;; Linux
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
 '(column-number-mode t)
 '(package-selected-packages
   '(lsp-ui lsp-mode flycheck-rust rust-mode python-mode yasnippet-classic-snippets csharp-mode modus-vivendi-theme modus-themes php-mode undo-tree markdown-mode flycheck counsel company))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family #("IPA Pゴシック" 5 9 (charset cp932-2-byte)) :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
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

; modus-themes
(modus-themes-load-themes)
(modus-themes-load-vivendi)

; Rust-mode
(require 'rust-mode)
(add-hook 'rust-mode-hook (lambda ()
                             (flycheck-rust-setup)
                             (flycheck-mode)
                             (lsp-deferred)))

;; Python-mode
(require 'python-mode)
(add-hook 'python-mode-hook
	      '(lambda()
	         (setq indent-tabs-mode nil)
	         (setq indent-level 4)
	         (setq python-indent 4)))
