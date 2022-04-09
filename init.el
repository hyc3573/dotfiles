;; -*- lexical-binding: t -*-

;;  /$$$$$$           /$$   /$$                  /$$
;; |_  $$_/          |__/  | $$                 | $$
;;   | $$   /$$$$$$$  /$$ /$$$$$$       /$$$$$$ | $$
;;   | $$  | $$__  $$| $$|_  $$_/      /$$__  $$| $$
;;   | $$  | $$  \ $$| $$  | $$       | $$$$$$$$| $$
;;   | $$  | $$  | $$| $$  | $$ /$$   | $$_____/| $$
;;  /$$$$$$| $$  | $$| $$  |  $$$$//$$|  $$$$$$$| $$
;; |______/|__/  |__/|__/   \___/ |__/ \_______/|__/


(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024))

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

;; B
(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default))
 '(flycheck-cppcheck-checks '("all"))
 '(flycheck-cppcheck-inconclusive t)
 '(helm-minibuffer-history-key "M-p")
 '(highlight-indent-guides-method 'fill)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(nord-uniform-mode-lines t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(zoom speed-type xclip monkeytype iflipb frog-jump-buffer bug-hunter evil-args org emmet-mode rainbow-mode flycheck-clang-tidy rustic pyvenv yaml-mode company-posframe doom-themes telephone-line simple-mpc hotfuzz selectrum-prescient selectrum fira-code-mode chess vimish-fold gdscript-mode suggest symon selectric-mode vertico cmake-mode projectile-mode evil-org-agenda org-roam-ui dyalog-mode glsl-mode srefactor elisp-format flycheck-popup-tip flycheck poly-org arduino-mode org-bullets centaur-tabs lsp fish-mode org-roam vterm esup dashboard lsp-haskell haskell-mode highlight-parentheses evil-org all-the-icons evil-collection nord-theme which-key treemacs-projectile treemacs-evil makefile-executor helm-make ivy ## smartparens taskrunner async-await helm-lsp lsp-treemacs lsp-ui posframe company-quickhelp company lsp-mode projectile undo-tree evil use-package))
 '(posframe-mouse-banish nil t)
 '(safe-local-variable-values
   '((projectile-project-name . "PL")
     (projectile-project-run-cmd . "./PL")
     (projectile-project-run-cmd . "runghc ./main.hs")
     (projectile-project-run-cmd . "make run")
     (projectile-project-run-cmd . "alacritty -e ./text_editor")
     (projectile-project-name . "text_editor")
     (projectile-project-run-cmd . "./text_editor")
     (projectile-project-name . "raytracing")
     (projectile-project-run-cmd . "./raytracing")
     (projectile-project-name . "Physics")
     (projectile-project-run-cmd . "./Physics")
     (projectile-project-run-cmd . "./main.hs")
     (projectile-project-name . "GL")
     (projectile-project-name . sfpc)
     (projectile-project-run-cmd . "./main")
     (projectile-project-compilation-cmd . "make")
     (projectile-project-run-cmd . \./GL)
     (projectile-project-compilation-cmd . make)
     (projectile-project-name . GL)
     (projectile-project-run-cmd . "./GL")
     (projectile-project-run-cmd . "cd build && ./a")
     (projectile-project-run-cmd . "cd build && ./path_tracing")
     (projectile-project-run-cmd . "runghc main.hs")
     (projectile-project-run-cmd . "ghc -e main.hs")
     (projectile-project-run-cmd . "ghci main.hs")
     (projectile-project-run-cmd . "cd ~/Project/dongari && ./main.py")
     (projectile-project-run-cmd . "./main.py")
     (projectile-project-run-cmd . "cd build && ./raytracer")
     (projectile-project-run-cmd . "cd build && ./LearnOpenGL")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vterm-use-vterm-prompt-detection-method t)
 '(warning-suppress-log-types
   '(((fira-code-ligatures))
     ((fira-code-ligatures))
     ((fira-code-ligatures))
     ((fira-code-ligatures))))
 '(warning-suppress-types
   '(((fira-code-ligatures))
     ((fira-code-ligatures))
     ((fira-code-ligatures))
     ((fira-code-ligatures))))
 '(zoom-size '(80 . 50)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; theme
(defun my-frame-config (frame)
  (with-selected-frame frame
	(progn
	  (load-theme 'nord t)
	  (set-face-attribute 'default nil
						  :font "FiraCode Nerd Font"
						  :height 130)
	  (set-fontset-font t
						'hangul
						(font-spec :name "NanumGothicCoding")))))

(my-frame-config (selected-frame))
(add-hook 'after-make-frame-functions #'my-frame-config)

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (load-theme 'doom-nord t))



;; configs
(setq native-comp-async-report-warnings-errors nil
	  tab-width 4
      mouse-wheel-scroll-amount '(3 ((shift) . 10))
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
	  completion-styles '(hotfuzz)
	  completion-ignore-case t
	  esup-depth 0
	  compilation-read-command nil
	  use-package-verbose t
	  display-line-numbers-current-absolute t
	  display-line-numbers-type 'relative
	  scroll-step 1
	  scroll-conservatively 0)

(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

(setenv "PATH"
        (concat (getenv "PATH")
                ":/home/yuchan/.ghcup/ghc/8.10.7/bin:/home/yuchan/.cabal/bin:/home/yuchan/.ghcup/bin"))
(setq exec-path (append exec-path
                        '("/home/yuchan/.cabal/bin" "/home/yuchan/.ghcup/bin"
                          "/home/yuchan/.local/bin"
                          "/home/yuchan/.ghcup/ghc/8.10.7/bin")))

(show-paren-mode 0)
(global-hl-line-mode +1)
(xterm-mouse-mode)
(recentf-mode 1)
(global-display-line-numbers-mode)

;; Hooks
(add-hook 'org-mode-hook #'prettify-symbols-mode)
;; (add-hook 'after-init-hook #'doom-modeline-mode)
(add-hook 'prog-mode-hook #'show-smartparens-mode)
(add-hook 'text-mode-hook #'(lambda () (setq indent-tabs-mode nil)))


;; Use-packages
;; (use-package color-theme-approximate
;;   :ensure t
;;   :config
;;   (color-theme-approximate-on))

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
  (add-hook 'evil-local-mode-hook #'turn-on-undo-tree-mode)
  (evil-set-initial-state 'simple-mpc-mode 'emacs)
  (evil-mode 1))
  ;; (add-hook 'evil-insert-state-exit-hook #'(lambda () (interactive) (call-process "ibus" nil nil nil "engine xkb:us::eng")))

(use-package evil-collection
  :ensure t
  :defer t
  :after evil
  :custom 
  (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snpippet nil
		lsp-ui-doc-show-with-mouse nil
		lsp-signature-doc-lines 2
		lsp-lens-enable nil)
  :hook
  ((c++-mode . lsp)
   (c-mode . lsp)
   (python-mode . lsp)
   (haskell-mode . lsp)
   (haskell-literate-mode . lsp)
   (rust-mode . lsp)
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

(use-package flycheck-clang-tidy
  :ensure t
  :after flycheck lsp-mode
  :hook ((flycheck-mode . flycheck-clang-tidy-setup)
         (c-mode-common . (lambda () (flycheck-add-next-checker 'lsp 'c/c++-clang-tidy)))))

(use-package company
  :ensure t
  :init
  (setq lsp-enable-snpippet nil
        company-lsp-enable-snippet nil)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-tooltip-idle-delay 1
        company-require-match nil
        company-tooltop-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-quickhelp-delay 0.1
        company-backends '(company-capf company-files)
		company-frontends '(coimpany-preview-frontend)
        company-show-quick-access t)
  (company-tng-configure-default)
  :hook
  (emacs-lisp-mode . company-mode)
  (cmake-mode . company-mode)
  :bind
  ;; (:map company-active-map ("TAB" . company-complete-common-and-select-next-if-tooltip-visible-or-complete-selection))
  ;; (:map company-active-map ("<backtab>" . company-select-previous))
  (:map company-active-map ("RET" . nil)))

(use-package smartparens
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (setq sp-python-insert-colon-in-function-definitions nil)
  (sp-local-pair 'prog-mode "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "[" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "\"" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "'" nil :post-handlers '(("||\n[i]" "RET")))
  (require 'smartparens-config)
)

;; (use-package centaur-tabs
;;   :ensure t
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)
;;   (setq centaur-tabs-close-button "")
;;   (set-face-background 'centaur-tabs-active-bar-face "#5E81AC")
;;   (set-face-background 'centaur-tabs-default "#3b4252")
;;   (set-face-background 'centaur-tabs-unselected "#3b4252")
;;   (set-face-background 'centaur-tabs-unselected-modified "#3b4252")
;;   (set-face-background 'centaur-tabs-selected "#2e3440")
;;   (centaur-tabs-headline-match)
;;   :custom
;;   ((centaur-tabs-style "wave")
;;    (centaur-tabs-height 25)
;;    (centaur-tabs-set-icons t)
;;    (centaur-tabs-plain-icons t)
;;    (centaur-tabs-set-bar nil)
;;    (x-underline-at-descent-line t)
;;    (centaur-tabs-set-modified-marker t)
;;    (centaur-tabs-label-fixed-length 10)
;;    (centaur-tabs-modified-marker ""))
;;   ;; :hook
;;   ;; (dired-mode . centaur-tabs-local-mode)
;;   ;; (dashboard-mode . centaur-tabs-local-mode)
;;   ;; (helpful-mode . centaur-tabs-local-mode)
;;   :bind
;;   (("<C-S-iso-lefttab>" . centaur-tabs-backward)
;;    ("C-<tab>" . centaur-tabs-forward)))

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
		org-agenda-files '("~/Documents/notes.org" "~/Documents/tasks.org")
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
  :if (< (length command-line-args) 2)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-projects-backend 'projectile
		dashboard-startup-banner 'logo
		dashboard-items '((recents . 15) (projects . 10))
		dashboard-set-heading-icons t
		dashboard-set-file-icons t
		dashboard-banner-logo-title ""
		dashboard-set-init-info t
		dashboard-set-footer nil
		initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (add-hook 'dashboard-mode-hook #'variable-pitch-mode))

(use-package all-the-icons
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-run-use-comint-mode t
		projectile-test-use-comint-mode t))

(use-package vterm
  :ensure t
  :defer t)

(use-package rainbow-mode
  :ensure t
  :defer t
  :config
  (add-hook 'text-mode-hook #'rainbow-mode))

(use-package selectrum
  :ensure t
  :config
  (selectrum-mode +1)
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1)
  (hotfuzz-selectrum-mode +1))

(use-package simple-mpc
  :defer t
  :ensure t)

(use-package telephone-line
  :ensure t
  :config
  (set-face-background 'telephone-line-evil-insert "#A3BE8C")
  (set-face-background 'telephone-line-evil-visual "#D08770")
  (set-face-background 'telephone-line-evil-normal "#BF616A")
  (set-face-background 'telephone-line-evil-replace "#EBCB8B")
  (set-face-foreground 'telephone-line-projectile "#5E81AC")
  (telephone-line-mode))

(use-package evil-args
  :ensure t
  :config
  ;; bind evil-args text objects
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  ;; bind evil-forward/backward-args
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  ;; bind evil-jump-out-args
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(use-package emmet-mode
  :ensure t)

(use-package frog-jump-buffer
  :ensure t
  :config
  (global-set-key (kbd "C-c s") 'frog-jump-buffer)
  (define-key evil-normal-state-map (kbd "SPC j") 'frog-jump-buffer))

(use-package iflipb
  :ensure t
  :config
  (global-set-key (kbd "C-c <tab>") 'iflipb-next-buffer)
  (define-key evil-normal-state-map (kbd "SPC <tab>") 'iflipb-next-buffer))

(use-package xclip
  :config
  (xclip-mode 1))

(use-package zoom
  :config
  (zoom-mode))

;; (require 'fcitx)
;; (fcitx-aggressive-setup)

;; (use-package web-mode
;;   :ensure t
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;   (add-hook 'web-mode-before-auto-complete-hooks 'company-mode-hook)
;;   (add-hook 'web-mode 'emmet-mode)
;;   (setq web-mode-enable-auto-pairing t
;; 		web-mode-enable-css-colorization t))


;; My custom functions
(defun tmux-navigate (direction)
  (interactive)
  (let
    ((cmd (concat "windmove-" direction)))
      (condition-case nil
          (funcall (read cmd))
        (error
          (tmux-command direction)))))

(defun tmux-command (direction)
  (shell-command-to-string
    (concat "tmux select-pane -"
      (tmux-direction direction))))

(defun tmux-direction (direction)
  (upcase
    (substring direction 0 1)))

(defun my-eww-readable-nonce ()
  "Once-off call to `eww-readable' after EWW is done rendering."
  (unwind-protect
      (eww-readable)
    (remove-hook 'eww-after-render-hook #'my-eww-readable-nonce)))

(defun namu ()
  (interactive)
  (add-hook 'eww-after-render-hook #'my-eww-readable-nonce)
  (eww (concat "namu.wiki/Search?q=" (read-string "Enter query: "))))


;; Keybinds
(global-set-key (kbd "C-c C-c")
                'comment-or-uncomment-region)

(global-set-key (kbd "C-c a")
                'org-agenda)

(global-set-key (kbd "<Hangul>")
                'toggle-input-method)
(global-set-key (kbd "<65329>")
                'toggle-input-method)
(global-set-key (kbd "S-SPC")
				nil)

(global-set-key (kbd "M-h")
                (lambda ()
				  (interactive)
				  (tmux-navigate "left")))
(global-set-key (kbd "M-l")
                (lambda ()
				  (interactive)
				  (tmux-navigate "right")))
(global-set-key (kbd "M-k")
                (lambda ()
				  (interactive)
				  (tmux-navigate "up")))
(global-set-key (kbd "M-j")
				(lambda ()
				  (interactive)
				  (tmux-navigate "down")))

(define-key projectile-mode-map (kbd "s-p") #'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)

;; (global-set-key (kbd "<f5>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run-make "build_and_run")))
;; (global-set-key (kbd "<f6>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run-make "build")))
;; (global-set-key (kbd "<f7>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run-make "run")))
;; (global-set-key (kbd "<f8>")
;;                 (lambda ()
;;                   (interactive)
;;                   (run-make "build_and_test")))

;; (global-set-key (kbd "<f5>") (lambda () (interactive)
;; 								(projectile-compile-project nil)
;; 								(projectile-run-project nil)))
(global-set-key (kbd "<f5>") (lambda ()
							   (interactive)
							   (let
								   ((ccmd (projectile-compilation-command
										   (projectile-compilation-dir)))
									(rcmd (projectile-run-command
										   (projectile-compilation-dir))))
								 (if (and ccmd rcmd)
									 (compile
									  (format "%s && %s" ccmd rcmd) t)
								   (compile (concat ccmd rcmd) t)))))

(global-set-key (kbd "<f6>") 'projectile-compile-project)
(global-set-key (kbd "<f7>") 'projectile-run-project)
(global-set-key (kbd "<f8>") 'projectile-test-project)

(global-set-key (kbd "C-j") 'emmet-expand-line)
