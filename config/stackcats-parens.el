;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'js2-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'c-mode-hook 'smartparens-mode)
  (add-hook 'java-mode-hook 'smartparens-mode)
  (add-hook 'scala-mode-hook 'smartparens-mode)
  (add-hook 'go-mode-hook 'smartparens-mode)
  (add-hook 'haskell-mode-hook 'smartparens-mode)
  (add-hook 'css-mode-hook 'smartparens-mode)
  (add-hook 'elm-mode-hook 'smartparens-mode))

;; (define-globalized-minor-mode global-rainbow-mode rainbow-mode
;;   (lambda () (rainbow-mode 1)))
;; (global-rainbow-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'c-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'slime-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'python-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'go-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(provide 'stackcats-parens)
;;; stackcats-parens.el ends here
