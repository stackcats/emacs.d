;;;key-binding
;;格式化
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;mac按键设置
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(defun slime-shell ()
  "启动slime"
  (interactive)
  (if (get-buffer "*slime-repl clisp*")
	  (ecb-goto-window-compilation)
	(slime)))

(defun open-slime ()
  "open slime in other buffer"
  (interactive)
  (slime-shell))

(defun open-shell ()
  "Open eshell in other buffer"
  (interactive)
  (eshell))

(global-set-key [f1] 'indent-whole)
(global-set-key [f2] 'hs-toggle-hiding)
(global-set-key [f3] 'open-shell)
(global-set-key (kbd "C-c C-k") 'kill-this-buffer)
(global-set-key [f8] 'open-slime)
(global-set-key [f9] 'run-js)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-e") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(provide 'stackcats-key)
