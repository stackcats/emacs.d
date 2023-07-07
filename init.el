;;; -*- lexical-binding: t -*-
;; NOTE: init.el is now generated from Emacs.org.  Please edit that file 
;;       in Emacs and init.el will be generated automatically!

(setq gc-cons-threshold 100000000)

(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package
  :after use-package)
(use-package general :after use-package)

(setq use-package-verbose t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

(setq exec-path (append exec-path '("/usr/local/bin" "~/.cargo/bin" "~/.asdf/shims")))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :defer t
    :init
    (exec-path-from-shell-initialize)))

(tool-bar-mode -1)
(menu-bar-mode  1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq frame-title-format "%b")
(setq inhibit-startup-message t)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                vterm-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq global-hl-line-sticky-flag t)
(global-hl-line-mode 1)

(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq tab-width 2)
(indent-tabs-mode nil)
(column-number-mode)
(show-paren-mode 1)
(toggle-debug-on-error)
(setq stack-trace-on-error nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(prefer-coding-system 'utf-8)
(setq message-log-max t)
(setq select-enable-clipboard t)
(pending-delete-mode t)
(setq ring-bell-function 'ignore)

;; mouse configuration
(setq mouse-wheel-scroll-amount '(1 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

(setq custom-file "~/.custom-file.el")
(load custom-file :no-error :no-message)

;; display lambda as "λ"
(global-font-lock-mode t)

(global-prettify-symbols-mode 1)

(setq inhibit-compacting-font-caches t)

(defvar font "Jetbrains Mono")
;; (defvar font "Pixel Code")

(set-face-attribute 'default nil :font font :height 180)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font font :height 180)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font font :height 180 :weight 'regular)

(use-package dashboard
  :config
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package modus-themes)

(use-package doom-themes)

(load-theme 'doom-feather-dark)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-height 16))

;; change mode-line to the top
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)

(use-package mini-frame
  :custom
  (mini-frame-show-parameters
   '((top . 200)
     (width . 0.7)
     (height . 30)
     (left . 0.5)

     ;; fix empty initial candidate list
     (no-accept-focus . t)))
  (mini-frame-interval-border-color "Color")
  (mini-frame-create-lazy nil)
  :custom-face
  (child-frame-border ((t (:background "systemMintColor"))))
  :config
  (mini-frame-mode 1))

(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  :general
  (:keymaps 'vertico-map
            "C-j" #'vertico-insert
            "C-l" #'vertico-directory-delete-word)
  :init
  (vertico-mode 1))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :after vertico
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-'" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult
  :custom
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-g g" . consult-goto-line)
   ("C-c o" . consult-outline)
   ("C-c h" . consult-org-heading)
   ("C-c p" . consult-projectile)
   ("C-c f" . consult-flycheck)))

(use-package consult-flycheck
  :after (consult flyCheck))

(use-package consult-projectile)

(defun stackcats/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font font :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun stackcats/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . stackcats/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (stackcats/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun stackcats/org-mode-visual-fill-setup ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . stackcats/org-mode-visual-fill-setup))

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :custom
  (org-auto-tangle-default t))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("mk" . "src makefile"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (ein . t)
     (makefile . t)
     (python . t)))
  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(when (file-exists-p "~/.wakatime.cfg")
  (use-package wakatime-mode
    :config
    (global-wakatime-mode)))

(use-package column-enforce-mode
  :hook (prog-mode . column-enforce-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package indent-guide
  :hook (prog-mode . indent-guide-mode))

(use-package smartparens
  :hook ((prog-mode css-mode) . smartparens-mode)
  :config
  (setq-default sp-escape-quotes-after-insert nil)
  (require 'smartparens-config)
  (sp-with-modes '(web-mode)
    (sp-local-pair "%" "%"
                   :unless '(sp-in-string-p)
                   :post-handlers '(((lambda (&rest _ignored)
                                       (just-one-space)
                                       (save-excursion (insert " ")))
                                     "SPC" "=" "#")))
    (sp-local-tag "%" "<% "  " %>")
    (sp-local-tag "=" "<%= " " %>")
    (sp-local-tag "#" "<%# " " %>")))

(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'default))
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/project")
    (setq projectile-project-search-path '("~/project")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :commands magit-status
  :custom
  (auto-revert-check-vc-info t)
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package smerge-mode
  :config
  (setq smerge-command-prefix "C-c s"))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :after git-gutter-mode
  :hook (prog-mode . git-gutter-fringe-mode)
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(defun stackcats/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-default flycheck-javascript-eslint-executable eslint))))

(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-temp-prefix "."))

(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '(rust-mode "rust-analyzer"))
  (add-to-list 'eglot-server-programs '(lua-mode "lua-language-server"))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.emacs.d/vendor/elixir-ls/language_server.sh")))

(use-package company
  :config
  (defvar company-flx-mode +1)
  (setq company-idle-delay 0)
  (defvar company-dabbrev-downcase nil)
  ;; key
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)))

(add-hook 'after-init-hook 'global-company-mode)

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package format-all
  :hook
  ((prog-mode . format-all-mode)
   (format-all-mode . format-all-ensure-formatter))
  :custom
  (format-all-show-errors 'errors)
  :config
  (setcdr (assoc "Python" format-all-default-formatters) '(yapf)))

(defun stackcats/c-mode-setup ()
  (c-toggle-comment-style -1)
  (setq indent-tabs-mode t))

(add-hook 'c-mode-hook 'stackcats/c-mode-setup)
(add-hook 'c-mode-hook 'eglot-ensure)

(defun stackcats/kill-buffer-when-compile-success (process)
  "Close current PROCESS when `shell-command' exit."
  (set-process-sentinel
   process
   (lambda (proc change)
     (when (string-match "finished" change)
       (delete-windows-on (process-buffer proc))))))

(add-hook 'compilation-start-hook 'stackcats/kill-buffer-when-compile-success)

(defface extra-whitespace-face
  '((t (:background "dark cyan")))
  "Used for tabs and such."
  :group 'extra-whitespace-face)

(defvar stackcats-extra-keywords
  '(("\t" . 'extra-whitespace-face)))

(defun stackcats/makefile-setup ()
  (font-lock-add-keywords nil stackcats-extra-keywords))

(add-hook 'makefile-bsdmake-mode-hook 'stackcats/makefile-setup)

(use-package clojure-mode
  :mode "\\.clj\\'")

(use-package cider
  :after clojure-mode
  :config
  (setq cider-repl-display-help-banner nil))

(use-package flycheck-clojure
  :after (cider flycheck)
  :hook ((flycheck-mode . flycheck-clojure-setup)
         (cider-mode . flycheck-mode)))

(defun stackcats/elixir-mode-setup ()
  (add-hook 'before-save-hook 'elixir-format nil t))

(use-package elixir-mode
  :mode "\\.ex[s]?\\'"
  :hook
  ((elixir-mode . stackcats/elixir-mode-setup)
   (elixir-mode . eglot-ensure)))

(use-package flycheck-credo
  :after (elixir-mode flycheck-mode)
  :hook (flycheck-mode . flycheck-credo-setup))

(defun stackcats/go-mode-setup ()
  (setq tab-width 4)
  (indent-tabs-mode 1))

(use-package go-mode
  :mode "\\.go\\'"
  :hook
  ((go-mode . stackcats/go-mode-setup)
   (go-mode . eglot-ensure))
  :config
  (setq gofmt-command "goimports"))

(use-package json-mode
  :mode "\\.json\\'")

(use-package rjsx-mode
  :mode "\\.jsx\\'")

(use-package js2-mode
  :mode "\\.js\\'"
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . eglot-ensure))
  :config
  (setq js2-idle-timer-delay 2)
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  (setq js2-mode-show-parse-errors nil)
  (setq-default js-indent-align-list-continuation nil)
  (setq js2-mode-show-strict-warnings nil))

(use-package lua-mode
  :mode "\\.lua\\'"
  :hook (lua-mode . eglot-ensure)
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-nested-block-content-align nil))

(use-package company-lua
  :after (lua-mode company)
  :config
  (add-to-list 'company-backends 'company-lua))

(use-package cperl-mode
  :mode "\\.\\(p\\([lm]\\)\\)\\'"
  :config
  (defalias 'perl-mode 'cperl-mode))

(use-package python-mode
  :hook
  (python-mode . eglot-ensure)
  :mode "\\.py\\'")

(use-package anaconda-mode
  :after python-mode
  :hook
  ((python-mode . anaconda-mode)
   (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :after company
  :config
  (add-to-list 'company-backends 'company-anaconda))

(use-package pyvenv
  :after python-mode
  :config
  (pyvenv-mode t)
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(use-package ein
  :custom
  (ein:jupyter-server-use-subcommand "server"))

(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook ((racket-mode . (lambda() (set (make-local-variable 'smartparens-mode) nil)))
         (racket-mode . racket-xp-mode)
         (racket-mode . racket-smart-open-bracket-mode)
         (racket-mode . eglot-ensure))
  :bind
  (:map racket-mode-map
        ("C-]" . close-all-parentheses)))

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode)
  :config
  (setq rustic-lsp-client 'eglot)
  (push 'rustic-clippy flycheck-checkers))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.eex\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-pairing nil))

(use-package vterm
  :commands vterm
  :custom
  (vterm-max-scrollback 10000))

(use-package which-key
  :custom
  (which-key-idle-delay 0.1)
  (which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))
  :config
  (which-key-mode)
  (which-key-setup-minibuffer))

(use-package which-key-posframe
  :after which-key)

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(use-package expand-region
  :commands er/expand-region)

(use-package ace-jump-mode
  :commands ace-jump-mode)

(use-package ace-window
  :commands ace-window)

(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c o") 'other-frame)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c i") 'stackcats/indent-whole)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c w") 'ace-window)

(unless (string= "" (getenv "OPENAI_API_KEY"))
  (use-package gptel
    :custom
    (gptel-api-key (getenv "OPENAI_API_KEY"))
    (gptel-mode "gpt-4")
    :config
    (setq gptel-default-mode 'org-mode)))

(defun close-all-parentheses ()
  (interactive "*")
  (let ((closing nil))
    (save-excursion
      (while (condition-case nil
                 (progn
                   (backward-up-list)
                   (let ((syntax (syntax-after (point))))
                     (cl-case (car syntax)
                       ((4) (setq closing (cons (cdr syntax) closing)))
                       ((7 8) (setq closing (cons (char-after (point)) closing)))))
                   t)
               ((scan-error) nil))))
    (apply #'insert (nreverse closing))))

(defun stackcats/indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))
