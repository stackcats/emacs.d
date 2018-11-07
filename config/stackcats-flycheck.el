;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode)
  :config
  (setq-default flycheck-temp-prefix ".")
  (defvar flycheck-javascript-eslint-executable (getenv "ESLINT"))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers '(javascript-jshint)))
  (if (fboundp 'flycheck-add-mode)
      (flycheck-add-mode 'javascript-eslint 'js2-mode)))

(use-package flycheck-pos-tip
  :config
  (if (fboundp 'flycheck-pos-tip-mode)
      (flycheck-pos-tip-mode)))

(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
