;;  /$$$$$$           /$$   /$$                  /$$
;; |_  $$_/          |__/  | $$                 | $$
;;   | $$   /$$$$$$$  /$$ /$$$$$$       /$$$$$$ | $$
;;   | $$  | $$__  $$| $$|_  $$_/      /$$__  $$| $$
;;   | $$  | $$  \ $$| $$  | $$       | $$$$$$$$| $$
;;   | $$  | $$  | $$| $$  | $$ /$$   | $$_____/| $$
;;  /$$$$$$| $$  | $$| $$  |  $$$$//$$|  $$$$$$$| $$
;; |______/|__/  |__/|__/   \___/ |__/ \_______/|__/


(setq gc-cons-threshold (* 50 1000 1000))


;; Init
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
						 ("elpa-devel" . "https://elpa.gnu.org/devel/")))

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
 '(global-display-line-numbers-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(highlight-indent-guides-method 'fill)
 '(menu-bar-mode nil)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(magit icomplete-vertical vertico cmake-mode projectile-mode evil-org-agenda org-roam-ui dyalog-mode glsl-mode srefactor elisp-format flycheck-popup-tip highlight-indent-guides flycheck i3wm-config-mode good-scroll smooth-scroll poly-org arduino-mode org-bullets centaur-tabs lsp fish-mode org-roam vterm esup dashboard lsp-haskell haskell-mode highlight-parentheses evil-org doom-modeline all-the-icons evil-collection nord-theme which-key tron-legacy-theme powerline-evil powerline treemacs-projectile treemacs-evil makefile-executor helm-make ivy ## smartparens rainbow-delimiters taskrunner async-await helm-taskswitch dap-mode helm-lsp lsp-treemacs lsp-ui posframe company-quickhelp company lsp-mode projectile undo-tree evil use-package))
 '(posframe-mouse-banish nil t)
 '(safe-local-variable-values
   '((projectile-project-run-cmd . "cd build && ./LearnOpenGL")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vterm-use-vterm-prompt-detection-method t)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; themes
(load-theme 'nord t)
(set-face-attribute 'default nil
					:font "MesloLGS NF"
                    :height 130)
(when (eq system-type 'gnu/linux)
  (set-fontset-font t
                    'hangul
                    (font-spec :name "NanumGothicCoding")))


;; configs
(setq native-comp-async-report-warnings-errors nil
	  tab-width 4
	  indent-tabs-mode nil
	  inhibit-startup-message t
      backup-by-copying t
      backup-directory-alist '(("." . "~/.local/var/emacs/backup"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
	  compilation-scroll-output t
	  c-default-style "bsd"
	  default-input-method "korean-hangul"
	  prettify-symbols-unprettify-at-point 'right-edge
	  org-agenda-custom-commands '(("c" "Weekly/Daily"
                                    ((agenda ""
                                             ((org-agenda-span 1)
                                              (org-agenda-start-on-weekday 0)))
                                     (agenda "")
                                     (alltodo ""))))
	  vc-follow-symlinks nil
	  frame-resize-pixelwise t
	  confirm-kill-emacs nil
	  completion-styles '(partial-completion)
	  completion-ignore-case t
	  esup-depth 0)

(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

(setenv "PATH"
        (concat (getenv "PATH")
                ":/home/yuchan/.ghcup/ghc/8.10.7/bin:/home/yuchan/.cabal/bin:/home/yuchan/.ghcup/bin"))
(setq exec-path (append exec-path
                        '("/home/yuchan/.cabal/bin" "/home/yuchan/.ghcup/bin"
                          "/home/yuchan/.local/bin"
                          "/home/yuchan/.ghcup/ghc/8.10.7/bin")))

(if (display-graphic-p)
	(good-scroll-mode 1))

(show-paren-mode 0)


;; Hooks
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'emacs-lisp-mode 'highlight-indent-guides-mode)
(add-hook 'org-mode-hook 'prettify-symbols-mode)
(add-hook 'after-init-hook #'doom-modeline-mode)
(add-hook 'prog-mode-hook 'show-smartparens-mode)


;; Use-packages
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist (quote (("" . "~/.local/var/emacs/undo_hist")))))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil evil-want-integration t
		evil-undo-system 'undo-tree)
  :config
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snpippet nil lsp-signature-function
        'lsp-signature-posframe)
  :hook
  ((c++-mode . lsp)
   (c-mode . lsp)
   (python-mode . lsp)
   (haskell-mode . lsp)
   (haskell-literate-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands
  lsp)

(use-package lsp-haskell
  :ensure t
  :defer t)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package company
  :ensure t
  :init
  (setq lsp-enable-snpippet nil
        company-lsp-enable-snippet nil)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-tooltip-idle-delay 1
        company-require-match nil
        company-tooltop-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-quickhelp-delay 0
        company-backends '(company-capf company-keywords company-files company-ispell)
        company-show-quick-access t)
  (company-tng-configure-default)
  :hook
  (emacs-lisp-mode . company-mode)
  (cmake-mode . company-mode)
  :bind
  (:map company-active-map ("TAB" . company-complete-common-and-select-next-if-tooltip-visible-or-complete-selection))
  (:map company-active-map ("<backtab>" . company-select-previous))
  (:map company-active-map ("RET" . nil)))

(use-package smartparens
  :ensure t
  :defer t
  :hook
  ((c++-mode . smartparens-mode)
   (python-mode . smartparens-mode)
   (emacs-lisp-mode . smartparens-mode)
   (haskell-mode . smartparens-mode)
   (c-mode . smartparens-mode)
   (org-mode . smartparens-mode))
  :init
  (require 'smartparens-config)
)

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :custom
  ((centaur-tabs-style "bar")
   (centaur-tabs-height 32)
   (centaur-tabs-set-icons t)
   (centaur-tabs-plain-icons t)
   (centaur-tabs-set-bar 'under)
   (x-underline-at-descent-line t)
   (centaur-tabs-set-modified-marker t)
   (centaur-tabs-modified-marker "~"))
  :hook
  (dired-mode . centaur-tabs-local-mode)
  (dashboard-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  :bind
  (("<C-S-iso-lefttab>" . centaur-tabs-backward)
   ("C-<tab>" . centaur-tabs-forward)))

(use-package helm-make
  :ensure t
  :config
  (setq helm-make-comint t
		helm-make-projectile t
		helm-make-fuzzy-matching t)
  :bind
  (("C-c b" . helm-make-projectile)))

(use-package org-roam
  :ensure t
  :init (setq org-roam-v2-ack t):custom
  (org-roam-directory "~/Roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)):config
  (org-roam-setup))

(use-package org-bullets
  :ensure t
  :hook
  ((org-mode . org-bullets-mode)))

(use-package org
  :ensure t
  :defer t
  :init
  (setq org-src-tab-acts-natively t)
  :config
  (setq org-confirm-babel-evaluate nil
		org-startup-with-inline-images t
		org-log-dont t
		org-agenda-files '("~/notes.org" "~/tasks.org")
		org-startup-indented t
		org-tag-alist '(("@학교" . ?s)
						("@집" . ?f)
						("@취미" . ?h)
						("@컴퓨터" . ?c)
						("@루틴" . ?r))
		org-hide-emphasis-markers t
		org-fontify-done-headline t
		org-hide-emphasis-markers t
		org-pretty-entities t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
	 (C . t)
	 (shell . t)
	 (emacs-lisp . t)
	 (calc . t)
	 (haskell . t))))

(use-package which-key
  :ensure t
  :config
  (setq which-key-show-early-on-C-h t
		which-key-idle-delay 0.1
		which-key-idle-secondary-delay 0.05)
  (which-key-mode))

(use-package evil-org
  :ensure t
  :init
  (fset 'evil-redirect-digit-argument 'evil-org-beginning-of-line)
  (evil-define-key 'motion 'evil-org-mode (kbd "0") 'evil-org-beginning-of-line)
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  :hook
  ((org-mode . evil-org-mode)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-projects-backend 'projectile
		dashboard-startup-banner 'logo
		dashboard-items '((recents . 15) (projects . 10))
		dashboard-set-heading-icons t
		dashboard-set-file-icons t
		dashboard-banner-logo-title "I can't work. I need to keep modding so it's fun once I work."
		dashboard-set-init-info t
		dashboard-set-footer nil
		initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (add-hook 'dashboard-mode-hook 'variable-pitch-mode))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package vterm
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :after evil-collection)


;; My custom functions
(defun run_make (TARGET)
  ""
  (if (symbolp (projectile-project-root))
      (error "Not in project")
    (compile
	 (concat "make -f .makefile -C " (projectile-project-root) " " TARGET)
	 t)))


;; Keybinds
(global-set-key (kbd "C-c C-c")
                'comment-or-uncomment-region)

(global-set-key (kbd "C-c a")
                'org-agenda)

(global-set-key (kbd "<Hangul>")
                'toggle-input-method)

(global-set-key (kbd "M-h")
                'windmove-left)
(global-set-key (kbd "M-l")
                'windmove-right)
(global-set-key (kbd "M-k")
                'windmove-up)
(global-set-key (kbd "M-j")
                'windmove-down)
(global-set-key (kbd "M-p")
                'ace-window)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; (global-set-key (kbd "<f5>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run_make "build_and_run")))
;; (global-set-key (kbd "<f6>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run_make "build")))
;; (global-set-key (kbd "<f7>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run_make "run")))
;; (global-set-key (kbd "<f8>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run_make "build_and_test")))

(global-set-key (kbd "<f5>") 'projectile-compile-project)
(global-set-key (kbd "<f6>") 'projectile-run-project)
(global-set-key (kbd "<f7>") 'projectile-test-project)
(global-set-key (kbd "<f8>") 'projectile-configure-project)

;; (global-set-key (kbd "M-x") 'helm-M-x)


(setq gc-cons-threshold (* 2 1000 1000))
