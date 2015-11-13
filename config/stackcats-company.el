;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(setq company-backends (delete 'company-semantic company-backends))

(require 'color)


(define-key company-active-map "\C-n" 'company-select-next)
(define-key company-active-map "\C-p" 'company-select-previous)

(provide 'stackcats-company)
;;; stackcats-company.el ends here
