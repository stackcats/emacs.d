;;; package --- Summary
;;; Commentary:
;;; Code:
(setq gc-cons-threshold 100000000)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; (toggle-debug-on-error)

(setq inhibit-compacting-font-caches t)

;;英中文字体
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "fira code 16"))

(use-package use-package-ensure-system-package :ensure t)

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
