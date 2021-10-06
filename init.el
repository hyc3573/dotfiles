(setq gc-cons-threshold (* 50 1000 1000))

;;(package-initialize)
(setq inhibit-startup-message t)
(set-face-attribute 'default nil :font "MesloLGS NF" :height 130)
(load-theme 'nord t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq confirm-kill-emacs nil)

(setenv "PATH" (concat (getenv "PATH") ":/home/yuchan/.cabal/bin:/home/yuchan/.ghcup/bin"))
(setq exec-path (append exec-path '("/home/yuchan/.cabal/bin" "/home/yuchan/.ghcup/bin")))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
;; b
(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-roam vterm esup dashboard lsp-haskell haskell-mode highlight-parentheses evil-org doom-modeline all-the-icons evil-collection nord-theme which-key tron-legacy-theme powerline-evil powerline xkcd treemacs-projectile treemacs-evil makefile-executor helm-make ivy ## smartparens rainbow-delimiters taskrunner async-await helm-taskswitch dap-mode helm-lsp lsp-treemacs lsp-ui posframe company-quickhelp company lsp-mode projectile undo-tree evil use-package))
 '(vterm-use-vterm-prompt-detection-method t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'undo-tree)
(global-undo-tree-mode)

(setq evil-undo-system 'undo-tree)
(setq evil-want-keybinding nil)
(setq evil-want-integration t)
(evil-mode 1)
(add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
(require 'evil)
(when (require 'evil-collection nil t)
	(evil-collection-init))

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq lsp-keymap-prefix "C-c l"
      lsp-enable-snippet nil
      lsp-signature-function 'lsp-signature-posframe)

(require 'company)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0
      company-lsp-enable-snippet nil
      company-tooltop-align-annotations t
      company-transformers '(company-sort-by-occurrence)
      company-quickhelp-delay 0)

(company-tng-configure-default)
(add-hook 'emacs-lisp-mode-hook #'company-mode)

(define-key company-active-map (kbd "TAB") 'company-select-next-if-tooltip-visible-or-complete-selection)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
(define-key company-active-map (kbd "RET") nil)

(require 'lsp-mode)
(require 'lsp-haskell)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;;(require 'rainbow-delimiters)
;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'smartparens)
(require 'smartparens-config)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
(add-hook 'haskell-mode-hook #'smartparens-mode)

(setq c-default-style "bsd")

(global-display-line-numbers-mode)

(setq helm-make-comint t
      helm-make-projectile t
	  helm-make-fuzzy-matching t)
(require 'helm-make)
(global-set-key (kbd "C-c m") 'helm-make-projectile)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "M-p") 'ace-window)

(require 'org)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (C . t)
   (shell . t)
   (emacs-lisp . t)
   (calc . t)
   (haskell . t)
   ))
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-startup-with-inline-images t)
(setq org-log-dont t)
(setq org-agenda-files '("~/notes.org"
						 "~/tasks.org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)

(setq which-key-show-early-on-C-h t
	  which-key-idle-delay 0
	  which-key-idle-secondary-delay 0.05)
(require 'which-key)
(which-key-mode)


(setq default-input-method "korean-hangul")
;; (set-language-enviroment "Korean")
(global-set-key (kbd "S-SPC") nil)
(global-set-key (kbd "<Hangul>") 'toggle-input-method)

(require 'all-the-icons)

(require 'doom-modeline)
(add-hook 'after-init-hook #'doom-modeline-mode)

;;(defvar make-lang)
;;(add-hook 'c++-mode-hook '#(lambda () (setq make-lang "c++")))
;;(add-hook 'python-mode-hook '#(lambda () (setq make-lang "python")))

(global-set-key (kbd "C-c b") 'helm-make-projectile)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(when (eq system-type 'gnu/linux)
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding")))

(add-hook 'prog-mode-hook 'show-paren-mode)

(defun run_make (TARGET)
  ""
  (if (symbolp (projectile-project-root))
	  (error "Not in project")
	  (compile (concat "make -f .makefile -C " (projectile-project-root) " " TARGET) t)
	))

(global-set-key (kbd "<f5>") (lambda () (interactive) (run_make "build_and_run")))
(global-set-key (kbd "<f6>") (lambda () (interactive) (run_make "build")))
(global-set-key (kbd "<f7>") (lambda () (interactive) (run_make "run")))

(setq org-agenda-custom-commands
	  '(("c" "Weekly/Daily"
		 ((agenda ""
		 ((org-agenda-span 1)
		  (org-agenda-start-on-weekday 0)))

		  (agenda "")
		  (alltodo ""))
		 ))
	  )

;; (add-hook 'after-init-hook (lambda () (org-agenda nil "c")))
;; (add-hook 'after-init-hook (lambda () (delete-other-windows)) t)

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
	  dashboard-projects-backend 'projectile
	  dashboard-startup-banner 'logo
	  dashboard-items '((recents . 10)
						(projects . 5)
						(agenda . 5))
	  dashboard-set-heading-icons t
	  dashboard-set-file-icons t
	  dashboard-banner-logo-title "Emacs? Eww man!")

(setq vc-follow-symlinks nil)

(setq make-backup-files nil)

(require 'vterm)
(add-hook 'vterm-mode-hook #'redraw-display)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
		 ("C-c n f" . org-roam-node-find)
		 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(setq gc-cons-threshold (* 2 1000 1000))
