;;; package --- Summary
;;; Commentary:
;;; Code:

;;mac按键设置
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(global-set-key (kbd "C-c o") 'other-frame)
(global-set-key (kbd "C-c s") 'hs-toggle-hiding)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c m") 'comment-or-uncomment-region)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c g") 'magit-status))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package ace-jump-mode
  :ensure t
  :config
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-c w") 'ace-window))

(use-package smerge-mode
  :config
  (setq smerge-command-prefix "\C-cs"))

(provide 'stackcats-key)
;;; stackcats-key.el ends here
