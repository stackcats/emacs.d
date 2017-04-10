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

(use-package c-mode
  :mode ("\\.c\\'" . c-mode)
  :config
  (setq	indent-tabs-mode t)
  (setq tab-width 4)
  (defvar c-basic-offset 4))
(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)
(add-hook 'c-mode-hook 'smartparens-mode)

(provide 'stackcats-c)
;;; stackcats-c.el ends here
