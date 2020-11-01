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

(defun stackcats-c-mode-hook ()
  (c-toggle-comment-style -1)
  (setq	indent-tabs-mode t))

(add-hook 'c-mode-hook 'stackcats-c-mode-hook)
(add-hook 'c-mode-hook 'eglot-ensure)

(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)

(defface extra-whitespace-face
   '((t (:background "dark cyan")))
   "Used for tabs and such."
   :group 'extra-whitespace-face)

(defvar stackcats-extra-keywords
   '(("\t" . 'extra-whitespace-face)))

(add-hook 'makefile-bsdmake-mode-hook
          (lambda () (font-lock-add-keywords nil stackcats-extra-keywords)))

(provide 'stackcats-c)
;;; stackcats-c.el ends here
