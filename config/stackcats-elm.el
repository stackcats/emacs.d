;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package elm-mode
  :ensure-system-package
  ((elm-oracle . "npm i -g elm-oracle")
   (elm-format . "npm i -g elm-format"))
  :hook
  ((elm-mode . elm-oracle-setup-completion)
   (elm-mode . smartparens-mode)
   (elm-mode . turn-off-elm-indent))
  :config
  (setq elm-format-on-save t)
  (setq elm-sort-imports-on-save t))

(provide 'stackcats-elm)
;;; stackcats-elm.el ends here
