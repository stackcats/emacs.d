;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :mode "\\.exs?$"
  :config
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-hook 'elixir-mode-hook 'eglot-ensure))

(provide 'stackcats-elixir)
;;; stackcats-elixir.el ends here
