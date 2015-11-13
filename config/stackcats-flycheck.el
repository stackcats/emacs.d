;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
