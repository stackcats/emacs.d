;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))

(add-to-list 'company-backends 'company-c-headers)
(with-eval-after-load 'company
  (company-flx-mode +1))

(add-to-list 'company-backends 'company-irony)
(setq company-idle-delay 0)

(require 'color)

(define-key company-active-map "\C-n" 'company-select-next)
(define-key company-active-map "\C-p" 'company-select-previous)

(provide 'stackcats-company)
;;; stackcats-company.el ends here
