;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package json-mode
  :mode "\\.json\\'")

(use-package rjsx-mode
  :mode "\\.jsx\\'")

(use-package rainbow-mode
  :hook css-mode-hook)

(use-package js2-mode
  :mode "\\.js\\'"
  :hook ((js2-mode . js2-imenu-extras-mode))
  :config
  (setq js2-idle-timer-delay 2)
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  (setq js2-mode-show-parse-errors nil)
  (setq-default js-indent-align-list-continuation nil)
  (setq js2-mode-show-strict-warnings nil))

(provide 'stackcats-js)
;;; stackcats-js.el ends here
