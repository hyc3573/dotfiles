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
(add-to-list 'load-path "~/.emacs.d/custom/")

;; Init
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
						 ("elpa-devel" . "https://elpa.gnu.org/devel/")))

(package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; B
(require 'use-package)
(setq use-package-always-ensure t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default))
 '(evil-cleverparens-use-additional-bindings nil)
 '(evil-cleverparens-use-additional-movement-keys nil)
 '(flycheck-cppcheck-checks '("all"))
 '(flycheck-cppcheck-inconclusive t)
 '(helm-minibuffer-history-key "M-p")
 '(highlight-indent-guides-method 'fill)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(nord-uniform-mode-lines t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(cask package-build evil-tree-edit tree-edit puni command-log-mode helpful tree-sitter-langs evil-textobj-tree-sitter evil-text-object-python evil-cleverparens general evil-smartparens buffer-flip company-coq proof-general zoom speed-type xclip monkeytype iflipb frog-jump-buffer bug-hunter evil-args org emmet-mode rainbow-mode flycheck-clang-tidy rustic pyvenv yaml-mode company-posframe doom-themes telephone-line simple-mpc hotfuzz selectrum-prescient selectrum fira-code-mode chess vimish-fold gdscript-mode suggest symon selectric-mode vertico cmake-mode projectile-mode evil-org-agenda org-roam-ui dyalog-mode glsl-mode srefactor elisp-format flycheck-popup-tip flycheck poly-org arduino-mode org-bullets centaur-tabs lsp fish-mode org-roam vterm esup dashboard lsp-haskell haskell-mode highlight-parentheses evil-org all-the-icons evil-collection nord-theme which-key treemacs-projectile treemacs-evil makefile-executor helm-make ivy ## smartparens taskrunner async-await helm-lsp lsp-treemacs lsp-ui posframe company-quickhelp company lsp-mode projectile undo-tree evil use-package))
 '(posframe-mouse-banish nil t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vterm-use-vterm-prompt-detection-method t))
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
						  :font "Fira Code"
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
	  scroll-conservatively 0
      comp-deffered-compilation t)

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

(put 'projectile-project-compilation-cmd 'safe-local-variable #'stringp)
(put 'projectile-project-run-cmd 'safe-local-variable #'stringp)

;; Hooks
(add-hook 'org-mode-hook #'prettify-symbols-mode)
;; (add-hook 'after-init-hook #'doom-modeline-mode)
(add-hook 'prog-mode-hook #'show-smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'semantic-mode)
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
        undo-tree-history-directory-alist '(("" . "~/.local/var/emacs/undo_hist"))))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil evil-want-integration t
		evil-undo-system 'undo-tree)
  :config
  (add-hook 'evil-local-mode-hook #'turn-on-undo-tree-mode)
  (evil-set-initial-state 'simple-mpc-mode 'emacs)
  (evil-set-initial-state 'comint-mode 'normal)
  (evil-set-initial-state 'speed-type 'normal)
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
        company-idle-delay 0.001
        company-tooltip-idle-delay 1
        company-require-match nil
        company-tooltop-align-annotations t
        company-transformers '(company-sort-by-occurrence)
        company-quickhelp-delay 0.1
        company-backends '(company-capf company-files company-keywords company-yasnippet)
		company-frontends '(coimpany-preview-frontend)
        company-show-quick-access t)
  (company-tng-configure-default)
  :hook
  (emacs-lisp-mode . company-mode)
  (cmake-mode . company-mode)
  (coq-mode . company-coq-mode)
  :bind
  ;; (:map company-active-map ("TAB" . company-complete-common-and-select-next-if-tooltip-visible-or-complete-selection))
  ;; (:map company-active-map ("<backtab>" . company-select-previous))
  (:map company-active-map ("RET" . nil)))

(use-package smartparens
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'smartparens-strict-mode)
  (setq sp-python-insert-colon-in-function-definitions nil)
  (sp-local-pair 'prog-mode "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "[" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "\"" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'prog-mode "'" nil :post-handlers '(("||\n[i]" "RET")))
  (add-hook 'smartparens-enabled-hook #'evil-cleverparens-mode)
  (require 'smartparens-config)
)

(use-package proof-general
  :config
  (add-hook 'coq-mode-hook (lambda () (undo-tree-mode 1))))

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
        org-startup-truncated nil
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
  (which-key-setup-side-window-bottom)
  (global-set-key (kbd "C-h g") 'which-key-show-major-mode)
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
  (global-set-key (kbd "H-S-L") 'iflipb-next-buffer)
  (define-key evil-normal-state-map (kbd "SPC <tab>") 'iflipb-next-buffer))

(use-package xclip
  :config
  (xclip-mode 1))

;; (use-package zoom
;;   :config
;;   (zoom-mode))

(use-package buffer-flip
  :ensure t
  :bind  (("C-<tab>" . buffer-flip)
          :map buffer-flip-map
          ( "C-<tab>" .   buffer-flip-forward) 
          ( "H-L" .   buffer-flip-forward) 
          ( "<C-S-iso-lefttab>" . buffer-flip-backward) 
          ( "H-H" . buffer-flip-backward) 
          ( "M-ESC" .     buffer-flip-abort))
  :config
  (setq buffer-flip-skip-patterns
        '("^\\*helm\\b"
          "^\\*swiper\\*$")))

(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (general-nvmap :prefix "C-c"
         :keymaps 'smartparens-mode-map
         ">" '(sp-backward-barf-sexp :wk "Barf backward" :properties '(:repeat))
         "<" '(sp-forward-barf-sexp :wk "Barf forward" :properties '(:repeat))
         "(" '(sp-backward-slurp-sexp :wk "Slurp backward" :properties '(:repeat))
         ")" '(sp-forward-slurp-sexp :wk "Slurp forward" :properties '(:repeat))
         "}" '(sp-slurp-hybrid-sexp :wk "Slurp (hybrid)" :properties '(:repeat))
         "+" '(sp-join-sexp :wk "Join")
         "-" '(sp-split-sexp :wk "Split")
         "a" '(sp-absorb-sexp :wk "Absorb")
         "c" '(sp-clone-sexp :wk "Clone")
         "C" '(sp-convolute-sexp :wk "Convolute")
         "m" '(sp-mark-sexp :wk "Mark")
         "r" '(sp-raise-sexp :wk "Raise")
         "s" '(sp-splice-sexp-killing-around :wk "Splice")
         "t" '(sp-transpose-sexp :wk "Transpose")
         "T" '(sp-transpose-hybrid-sexp :wk "Transpose (hybrid)")
         ;; Narrow and Widen, use default emacs for widening
         "n" '(sp-narrow-to-sexp :wk "Narrow")))

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package evil-textobj-tree-sitter
  :ensure t
  :config
  (define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj "parameter.outer"))
  (define-key evil-inner-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj "parameter.inner"))
  (define-key evil-outer-text-objects-map "c" (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-outer-text-objects-map "c" (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-outer-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.outer"))
  (define-key evil-inner-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.inner"))

  ;; Goto start of next function
  (define-key evil-normal-state-map (kbd "]f") (lambda ()
                                                 (interactive)
                                                 (evil-textobj-tree-sitter-goto-textobj "function.outer")))
  ;; Goto start of previous function
  (define-key evil-normal-state-map (kbd "[f") (lambda ()
                                                 (interactive)
                                                 (evil-textobj-tree-sitter-goto-textobj "function.outer" t)))
  ;; Goto end of next function
  (define-key evil-normal-state-map (kbd "]F") (lambda ()
                                                 (interactive)
                                                 (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t)))
  ;; Goto end of previous function
  (define-key evil-normal-state-map (kbd "[F") (lambda ()
                                                 (interactive)
                                                 (evil-textobj-tree-sitter-goto-textobj "function.outer" t t)))
  
  (global-tree-sitter-mode))

(use-package helpful
  :ensure t
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command))

(use-package tree-edit
  :ensure t
  :config
  (add-to-list 'tree-edit-language-alist '(c++-mode . tree-edit-c++))
  
  (add-hook 'python-mode-hook #'evil-tree-edit-mode)
  (add-hook 'c-mode-hook #'evil-tree-edit-mode)
  (add-hook 'c++-mode-hook #'evil-tree-edit-mode)
  (add-hook 'java-mode-hook #'evil-tree-edit-mode)

  ;; (add-hook 'evil-tree-edit-after-change-hook #'lsp-format-buffer)
  (add-hook 'evil-tree-edit-mode #'evil-tree-edit-view-mode))

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

(defun comp-and-run ()
  (interactive)
  (let
      ((ccmd (projectile-compilation-command
              (projectile-compilation-dir)))
       (rcmd (projectile-run-command
              (projectile-compilation-dir))))
    (if (and ccmd rcmd)
        (compile
         (format "%s && %s" ccmd rcmd) t)
      (compile (concat ccmd rcmd) t))))


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

(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))

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

(global-set-key (kbd "H-h")
                (lambda ()
				  (interactive)
				  (tmux-navigate "left")))
(global-set-key (kbd "H-l")
                (lambda ()
				  (interactive)
				  (tmux-navigate "right")))
(global-set-key (kbd "H-k")
                (lambda ()
				  (interactive)
				  (tmux-navigate "up")))
(global-set-key (kbd "H-j")
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
(global-set-key (kbd "<f5>") #'comp-and-run)
(global-set-key (kbd "H-r") #'comp-and-run)

(global-set-key (kbd "<f6>") 'projectile-compile-project)
(global-set-key (kbd "<f7>") 'projectile-run-project)
(global-set-key (kbd "<f8>") 'projectile-test-project)

(global-set-key (kbd "C-j") 'emmet-expand-line)
