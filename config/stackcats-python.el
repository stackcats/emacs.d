;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package python-mode)

(use-package anaconda-mode
  :hook
  ((python-mode . anaconda-mode)
   (python-mode . anaconda-eldoc-mode)))

(provide 'stackcats-python)
;;; stackcats-python.el ends here
