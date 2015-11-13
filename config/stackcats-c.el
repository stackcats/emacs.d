(setenv "C_INCLUDE_PATH"
		(concat (getenv "C_INCLUDE_PATH") ":/usr/local/include/SDL2"))
(setenv "LIBRARY_PATH"
		(concat (getenv "LIBRARY_PATH") ":/usr/local/lib/"))
(defun my-c-mode-hook ()
  (setq c-basic-offset 4     
        indent-tabs-mode t   
        default-tab-width 4)
  (local-set-key (kbd "C-c C-c") 'mode-compile)
  (local-set-key (kbd "<tab>") 'company-complete))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun kill-buffer-when-compile-success (process)
  "Close current buffer when `shell-command' exit."
  (set-process-sentinel 
   process
   (lambda (proc change)
	 (when (string-match "finished" change)
	   (delete-windows-on (process-buffer proc))))))

(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success)
(provide 'stackcats-c)