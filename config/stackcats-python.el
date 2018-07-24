;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)
         (python-mode . smartparens-mode))
  :config
  (setq python-indent-offset 4))

(use-package company-anaconda
  :after company
  :config
  (add-to-list 'company-backends 'company-anaconda))

(provide 'stackcats-python)
;;; stackcats-python.el ends here
