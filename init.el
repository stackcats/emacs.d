;;; package --- Summary
;;; Commentary:
;;; Code:
;;(load "~/.emacs.d/elpa/benchmark-init-20150905.238/benchmark-init.el")
;;(benchmark-init/activate)

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

;;英中文字体
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "fira code 16"))

(when (eq system-type 'darwin)
  (set-fontset-font "fontset-default" 'unicode '("hack" . "unicode-ttf")))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's `emacs-lisp-mode' and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)

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

(setq custom-file "/dev/null")

(use-package osx-pseudo-daemon
  :if (memq window-system '(mac ns))
  :ensure t)

(eval-after-load "latex-mode" '(fset 'tex-font-lock-suscript 'ignore))

;;; init.el ends here
