(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
  (message "==================== refresh-contents")
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
(global-display-line-numbers-mode t)
(column-number-mode)
(show-paren-mode 1)
(toggle-debug-on-error)

(setq inhibit-compacting-font-caches t)

(set-face-attribute 'default nil :font "Hack" :height 180)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Hack" :height 180)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Hack" :height 180 :weight 'regular)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(defvar local-dir (file-name-directory load-file-name))

(defvar config-dir (expand-file-name  "config" local-dir))

(add-to-list 'load-path config-dir)

(mapc (lambda (name) (require (intern (file-name-sans-extension name))))
      (directory-files config-dir nil "\\.el$"))

(setq custom-file "~/.custom-file.el")
(load custom-file :no-error :no-message)

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

(defun stackcats/indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
