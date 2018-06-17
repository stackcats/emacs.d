;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :config
  (setq-default flycheck-temp-prefix ".")
  ;;(defvar flycheck-eslintrc "/Users/stackcats/.eslintrc")
  (defvar flycheck-javascript-eslint-executable (getenv "ESLINT"))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

;; (add-hook 'after-init-hook #'global-flycheck-mode)

(use-package flycheck-pos-tip
  :config
  (flycheck-pos-tip-mode))

(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
