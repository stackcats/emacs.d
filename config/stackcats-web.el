;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.html\\.eex\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-pairing nil))

(provide 'stackcats-web)
;;; stackcats-web.el ends here

