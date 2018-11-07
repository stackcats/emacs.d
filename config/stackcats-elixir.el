;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :mode "\\.exs?$")

(use-package alchemist
  :after (elixir-mode company))

(use-package flycheck-elixir
  :after (elixir-mode flycheck))

(provide 'stackcats-elixir)
;;; stackcats-elixir.el ends here
