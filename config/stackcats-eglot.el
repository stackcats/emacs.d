;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(provide 'stackcats-eglot)
;;; stackcats-eglot.el ends here
