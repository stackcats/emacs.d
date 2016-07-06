;;;python-mode
;;; Code:
(defvar python-indent-offset 2)
(defvar python-shell-interpreter 'python)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(provide 'stackcats-python)
