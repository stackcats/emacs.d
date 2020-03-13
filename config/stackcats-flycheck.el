;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-checker-error-threshold 10000)
  (setq-default flycheck-temp-prefix "."))

(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
