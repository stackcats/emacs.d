;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :config
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'my-flycheck-fringe-indicator
      (vector #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00011100
              #b00111110
              #b00111110
              #b00111110
              #b00011100
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b01111111)))
  
  (flycheck-define-error-level 'error
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'my-flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-error)
  
  (flycheck-define-error-level 'warning
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'my-flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-warning)
  
  (flycheck-define-error-level 'info
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'my-flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-info)
  
  (setq-default flycheck-temp-prefix ".")
  ;;(defvar flycheck-eslintrc "/Users/stackcats/.eslintrc")
  (defvar flycheck-javascript-eslint-executable (getenv "ESLINT"))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package flycheck-pos-tip
  :ensure t
  :config
  (flycheck-pos-tip-mode))

(use-package flycheck-clojure :ensure t)
(eval-after-load 'flycheck #'flycheck-clojure-setup)

(use-package flycheck-haskell :ensure t)
(eval-after-load 'flycheck #'flycheck-haskell-setup)

(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
