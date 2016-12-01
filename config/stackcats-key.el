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
  :bind (("C-c g" . magit-status)))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-mode)))

(use-package ace-window
  :ensure t
  :bind (("M-p" . ace-window)))

(provide 'stackcats-key)
;;; stackcats-key.el ends here
