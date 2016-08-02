;;; Code:
(defun my-c-mode-hook ()
  "My `c-mode hook."
  (setq c-basic-offset 2
	indent-tabs-mode t
	tab-width 2)
  (local-set-key (kbd "C-c c") 'mode-compile)
  (local-set-key (kbd "<tab>") 'company-complete-common))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun kill-buffer-when-compile-success (process)
  "Close current buffer when `shell-command' exit."
  (set-process-sentinel
   process
   (lambda (proc change)
     (when (string-match "finished" change)
       (delete-windows-on (process-buffer proc))))))

(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)

(add-hook 'c-mode-hook 'smartparens-mode)
(provide 'stackcats-c)
;;; stackcats-c.el ends here
