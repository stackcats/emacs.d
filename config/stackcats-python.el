;;; package --- Summary
;;; Commentary:
;;; Code:
;;; deps
;;; pip install jedi
(use-package anaconda-mode
  :ensure t
  :config
  (setq python-indent-offset 4)
  (setq python-shell-interpreter 'python)
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
(provide 'stackcats-python)
;;; stackcats-python.el ends here
