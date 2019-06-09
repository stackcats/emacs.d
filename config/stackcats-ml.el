;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package tuareg
  :mode ("\\.ml[4ilpy]?$" . tuareg-mode))

(use-package haskell-mode
  :config
  (setq lsp-haskell-process-path-hie "hie-wrapper"))

(provide 'stackcats-ml)
;;; stackcats-ml.el ends here
