;;; Code:

(use-package company
  :ensure t
  :config
  (setq company-flx-mode +1)
  (setq company-idle-delay 0)
  (setq company-backends (delete 'company-semantic company-backends))
  (diminish 'company-mode "C")
  ;; C
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-backends 'company-irony)
  ;; web
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  ;; key
  (define-key company-active-map "\C-n" 'company-select-next)
  (define-key company-active-map "\C-p" 'company-select-previous))

(use-package company-tern
  ;; JavaScript
  :ensure t
  :config
  (diminish 'tern-mode "T")
  (add-to-list 'company-backends 'company-tern)
  (setq company-tern-property-marker ""))

(use-package company-jedi
  ;; Python
  :ensure t
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package company-go
  ;; Go
  :ensure t
  :config
  (add-to-list 'company-backends 'company-go))

(add-hook 'after-init-hook 'global-company-mode)
(provide 'stackcats-company)
;;; stackcats-company.el ends here
