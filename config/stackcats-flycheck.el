;;; Code:
(require 'diminish)
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode)
  (diminish 'flycheck-mode "ⓕ")
  )
(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
