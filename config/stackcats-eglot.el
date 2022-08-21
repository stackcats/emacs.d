;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '(rust-mode . "rust-analyzer"))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.emacs.d/vendor/elixir-ls-1.13-24.3/language_server.sh")))

(provide 'stackcats-eglot)
;;; stackcats-eglot.el ends here
