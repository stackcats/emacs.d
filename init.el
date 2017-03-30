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

(defvar local-dir (file-name-directory load-file-name))

(defvar config-dir (expand-file-name  "config" local-dir))

(add-to-list 'load-path config-dir)

(mapc (lambda (name) (require (intern (file-name-sans-extension name))))
      (directory-files config-dir nil "\\.el$"))

(setq custom-file "/dev/null")
;;; init.el ends here
