;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package company
  :config
  (defvar company-flx-mode +1)
  (setq company-idle-delay 0)
  (defvar company-dabbrev-downcase nil)
  (setq company-backends (delete 'company-semantic company-backends))
  ;; key
  (define-key company-active-map "\C-n" 'company-select-next)
  (define-key company-active-map "\C-p" 'company-select-previous))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'stackcats-company)
;;; stackcats-company.el ends here
