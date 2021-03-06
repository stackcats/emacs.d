;;; package --- Summary
;;; Commentary:
;;; Code:
(setq gc-cons-threshold 100000000)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package :ensure t)

(use-package wakatime-mode
  :config
  (global-wakatime-mode))

(toggle-debug-on-error)

(setq inhibit-compacting-font-caches t)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "hack 16"))

(defun indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(defvar local-dir (file-name-directory load-file-name))

(defvar config-dir (expand-file-name  "config" local-dir))

(add-to-list 'load-path config-dir)

(mapc (lambda (name) (require (intern (file-name-sans-extension name))))
      (directory-files config-dir nil "\\.el$"))

(setq custom-file "~/.custom-file.el")
(load custom-file :no-error :no-message)
;;; init.el ends here
