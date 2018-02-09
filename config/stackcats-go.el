;;; package --- Summary
;;; Commentary:
;;; Command:
;;; go get -u github.com/nsf/gocode
;;; Code:
(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'gofmt-before-save)
	      (setq tab-width 4)
	      (setq indent-tabs-mode 1)))
  :bind
  (:map go-mode-map
        ("C-c j" . godef-jump)))

(use-package go-guru
  :ensure t
  :config
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))
  
(provide 'stackcats-go)
;;; stackcats-go.el ends here
