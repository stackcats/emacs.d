;;; package --- Summary

;;; Commentary:
;;; npm i -g elm-oracle
;;; npm i -g elm-format
;;; Code:
(use-package elm-mode
  :ensure t
  :config
  (setq elm-format-on-save t)
  (setq elm-sort-imports-on-save t)
  (add-hook 'elm-mode-hook 'elm-oracle-setup-completion)
  (add-hook 'elm-mode-hook 'company-mode)
  (add-hook 'elm-mode-hook 'turn-off-elm-indent))
;;;  (setq elm-format-on-save t))

(provide 'stackcats-elm)
;;; stackcats-elm.el ends here
