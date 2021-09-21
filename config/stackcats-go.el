;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode "\\.go\\'"
  :hook
  ((before-save . gofmt-before-save)
   (go-mode . (lambda () (setq tab-width 4 indent-tabs-mode 1))))
  :config
  (add-hook 'go-mode-hook 'eglot-ensure)
  (setq gofmt-command "goimports"))

(provide 'stackcats-go)
;;; stackcats-go.el ends here
