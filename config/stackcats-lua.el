;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package lua-mode
  :mode "\\.lua\\'"
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-nested-block-content-align nil))

(use-package company-lua
  :after (company)
  :config
  (add-to-list 'company-backends 'company-lua))

(provide 'stackcats-lua)
;;; stackcats-lua.el ends here
