;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package purescript-mode
  :ensure-system-package
  ((purs . "npm install -g purescript")
   (pulp . "npm install -g pulp bower"))
  :mode "\\.purs$")


(use-package psc-ide
  :hook
  ((purescript-mode . psc-ide-mode)
   (purescript-mode . turn-on-purescript-indentation))
  :config
  (setq psc-ide-host "127.0.0.1"))

(provide 'stackcats-purescript)
;;; stackcats-purescript.el ends here
