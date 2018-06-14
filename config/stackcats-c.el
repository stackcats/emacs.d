;;; package --- Summary
;;; Commentary:
;;; Code:
(defun kill-buffer-when-compile-success (process)
  "Close current PROCESS when `shell-command' exit."
  (set-process-sentinel
   process
   (lambda (proc change)
     (when (string-match "finished" change)
       (delete-windows-on (process-buffer proc))))))

(use-package cc-mode
  :mode ("\\.c\\'" . c-mode)
  :config
  (setq	indent-tabs-mode t)
  (setq tab-width 4)
  (defvar c-basic-offset 4))

(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)

(use-package company-irony
  :commands (irony-mode irony-install-server)
  :after company
  :hook
  ((c++-mode . irony-mode)
   (c-mode . irony-mode))
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-c-headers
  :after company
  :config
  (add-to-list 'company-backends 'company-c-headers))

(defface extra-whitespace-face
   '((t (:background "dark cyan")))
   "Used for tabs and such.")

(defvar my-extra-keywords
   '(("\t" . 'extra-whitespace-face)))

(add-hook 'makefile-bsdmake-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))

(provide 'stackcats-c)
;;; stackcats-c.el ends here
