;;; package --- Summary
;;; Commentary:
;;; Command:
;;; rustup component add rust-src
;;; Code:
;(use-package rustic
;  :config
;  (setq rustic-lsp-client 'eglot)
;  (add-hook 'eglot-managed-mode-hook (lambda () (flymake-mode -1)))
;  (push 'rustic-clippy flycheck-checkers)
;  (setq rustic-format-trigger 'on-save))

(provide 'stackcats-rust)
;;; stackcats-rust.el ends here
