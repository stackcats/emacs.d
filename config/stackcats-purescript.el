;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package purescript-mode
  :mode "\\.purs\\'"
  :config
  (use-package psc-ide
    :bind
    (:map psc-ide-mode-map
          ("TAB" . company-complete))
    :config
    (setq psc-ide-use-npm-bin t)
    (add-hook 'purescript-mode-hook
              (lambda ()
                (psc-ide-mode)
                (company-mode)
                (flycheck-mode)
                (turn-on-purescript-indentation)))))

(provide 'stackcats-purescript)
;;; stackcats-purescript.el ends here
