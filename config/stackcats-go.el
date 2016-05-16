;;; package --- Summary

;;; Commentary:

;;; Code:
(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 2)
                          (setq indent-tabs-mode 1)
                          (push 'company-go company-backends)))
(provide 'stackcats-go)
;;; stackcats-go.el ends here
