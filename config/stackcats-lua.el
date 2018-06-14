;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package lua-mode
  :mode "\\.lua\\'"
  :interpreter "lua"
  :hook
  (lua-mode . flycheck-mode))

(use-package company-lua
  :after company
  :config
  (add-to-list 'company-backends 'company-racer))

(provide 'stackcats-lua)
;;; stackcats-lua.el ends here
