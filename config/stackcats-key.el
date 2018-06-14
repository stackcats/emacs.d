;;; package --- Summary
;;; Commentary:
;;; Code:

;;mac按键设置
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.1)
  (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL")))

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(global-set-key (kbd "C-c o") 'other-frame)
;;(global-set-key (kbd "C-c s") 'hs-toggle-hiding)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(use-package magit
  :config
  (global-set-key (kbd "C-c g") 'magit-status))

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package ace-jump-mode
  :config
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))

(use-package ace-window
  :config
  (global-set-key (kbd "C-c w") 'ace-window))

(use-package smerge-mode
  :config
  (setq smerge-command-prefix "\C-cs"))

;; neotree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key (kbd "C-c d") 'neotree-projectile-action))

(provide 'stackcats-key)
;;; stackcats-key.el ends here
