;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package protobuf-mode
  :mode "\\.proto$"
  :hook
  (protobuf-mode . flycheck-mode))

(provide 'stackcats-protobuf)
;;; stackcats-protobuf.el ends here
