;;;python-mode
;;; Code:
(use-package anaconda-mode
  :ensure t
  :config
  (setq python-indent-offset 2)
  (setq python-shell-interpreter 'python)
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
(provide 'stackcats-python)
