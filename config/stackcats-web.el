;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package web-mode
  :ensure t
  :mode ("\\.html" . web-mode)
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-style-padding 1))

(provide 'stackcats-web)
;;; stackcats-web ends here
