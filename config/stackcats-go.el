;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package go-mode
  :ensure-system-package
  (goimports . "go get golang.org/x/tools/cmd/goimports")
  :mode "\\.go\\'"
  :hook
  ((before-save . gofmt-before-save)
   (go-mode . smartparens-mode)
   (go-mode . (lambda () (setq tab-width 4 indent-tabs-mode 1))))
  :config
  (setq gofmt-command "goimports")
  :bind
  (:map go-mode-map
        ("C-c j" . godef-jump)))

(use-package go-guru
  :hook (go-mode-hook . go-guru-hl-identifier-mode))

(use-package company-go
  :ensure-system-package
  (gocode . "go get github.com/nsf/gocode")
  :after company
  :config
  (add-to-list 'company-backends 'company-go))

(provide 'stackcats-go)
;;; stackcats-go.el ends here
