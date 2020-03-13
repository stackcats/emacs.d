;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package python-mode
  :mode "\\.py\\'")

(use-package anaconda-mode
  :hook
  ((python-mode . anaconda-mode)
   (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :after (company)
  :config
  (add-to-list 'company-backends 'company-anaconda))

(provide 'stackcats-python)
;;; stackcats-python.el ends here
