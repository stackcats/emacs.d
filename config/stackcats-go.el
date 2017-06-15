;;; package --- Summary
;;; Commentary:
;;; Code:
;;; deps
;;; go get gocode
(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'gofmt-before-save)
	      (setq tab-width 4)
	      (setq indent-tabs-mode 1))))

(provide 'stackcats-go)
;;; stackcats-go.el ends here
