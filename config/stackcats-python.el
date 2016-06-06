;;;python-mode
;;; Code:
(setq python-indent-offset 2)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(provide 'stackcats-python)

