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

(tool-bar-mode -1)
(menu-bar-mode  1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq frame-title-format "%b")
(setq inhibit-startup-message t)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq hl-line-range-function
      #'(lambda () (cons (line-end-position) (line-beginning-position 2))))
(setq global-hl-line-sticky-flag t)
(global-hl-line-mode 1)

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

(set-face-attribute 'default nil :font "Hack" :height 180)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Hack" :height 180)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Hack" :height 180 :weight 'regular)

(use-package vertico
  :init
  (vertico-mode 1)
  (setq vertico-cycle t))

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

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
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
  :bind
  (("C-s" . consult-line)))

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
    (set-face-attribute (car face) nil :font "Hack" :weight 'regular :height (cdr face)))

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

;; Automatically tangle our Emacs.org config file when we save it
(defun stackcats/org-babel-tangle-config ()
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'stackcats/org-babel-tangle-config)))

(when (file-exists-p "~/.wakatime.cfg")
  (use-package wakatime-mode
    :config
    (global-wakatime-mode)))

(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '(rust-mode . "rust-analyzer"))
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

(defun stackcats/c-mode-setup ()
  (c-toggle-comment-style -1)
  (setq	indent-tabs-mode t))

(add-hook 'c-mode-hook 'stackcats-c-mode-setup)
(add-hook 'c-mode-hook 'eglot-ensure)

(use-package clang-format+
  :hook (c-mode-common . clang-format+-mode))

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

(defun stackcats/elixir-mode-setup ()
  (add-hook 'before-save-hook 'elixir-format nil t))

(use-package elixir-mode
  :mode "\\.exs?$"
  :hook
  ((elixir-mode . stackcats/elixir-mode-setup)
   (elixir-mode . eglot-ensure)))

(defun stackcats/go-mode-setup ()
  (setq tab-width 4)
  (indent-tabs-mode 1))

(use-package go-mode
  :mode "\\.go\\'"
  :hook
  ((before-save . gofmt-before-save)
   (go-mode . stackcats/go-mode-setup)
   (go-mode . eglot-ensure))
  :config
  (setq gofmt-command "goimports"))

(use-package lua-mode
  :mode "\\.lua\\'"
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-nested-block-content-align nil))

(use-package company-lua
  :after (lua-mode company)
  :config
  (add-to-list 'company-backends 'company-lua))

(defun stackcats/indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
