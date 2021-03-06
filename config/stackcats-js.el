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
  :hook ((js2-mode . (lambda () (tern-mode t)))
         (js2-mode . js2-imenu-extras-mode))
  :config
  (setq js2-idle-timer-delay 2)
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  (setq js2-mode-show-parse-errors nil)
  (setq-default js-indent-align-list-continuation nil)
  (setq js2-mode-show-strict-warnings nil))

(use-package xref-js2
  :hook
  (js2-mode
   . (lambda () (add-hook 'xref-backend-functions 'xref-js2-xref-backend nil t))))

(use-package tern
  :bind
  (:map tern-mode-keymap
        ("M-." . xref-find-definitions)
        ("M-," . xref-pop-marker-stack)
        ("M-?" . xref-find-references)))

;;(use-package company-tern
;;  :ensure-system-package
;;  (tern . "npm install -g tern")
;;  :after company
;;  :config
;;  (add-to-list 'company-backends 'company-tern)
;;  (setq company-tern-property-marker ""))

(provide 'stackcats-js)
;;; stackcats-js.el ends here
