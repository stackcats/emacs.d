;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :config
  (defvar company-flx-mode +1)
  (setq company-idle-delay 0)
  (setq company-backends (delete 'company-semantic company-backends))
  (diminish 'company-mode "C")
  ;; key
  (define-key company-active-map "\C-n" 'company-select-next)
  (define-key company-active-map "\C-p" 'company-select-previous))

(use-package company-irony
  ;; C
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode))

(use-package company-c-headers
  ;; C
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-web
  ;; web
  :ensure t
  :config
  (add-to-list 'company-backends 'company-web))

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

(use-package company-ghc
  ;; haskell
  :ensure t
  :config
  (setq company-ghc-show-info t)
  (add-to-list 'company-backends '(company-ghc :with company-dabbrev-code)))

(add-hook 'after-init-hook 'global-company-mode)
(provide 'stackcats-company)
;;; stackcats-company.el ends here
