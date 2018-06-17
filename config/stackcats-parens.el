;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package smartparens
  :config
  (setq-default sp-escape-quotes-after-insert nil)
  (require 'smartparens-config)  
  (add-hook 'js2-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'c-mode-hook 'smartparens-mode)
  (add-hook 'java-mode-hook 'smartparens-mode)
  (add-hook 'scala-mode-hook 'smartparens-mode)
  (add-hook 'go-mode-hook 'smartparens-mode)
  (add-hook 'haskell-mode-hook 'smartparens-mode)
  (add-hook 'css-mode-hook 'smartparens-mode)
  (add-hook 'rust-mode-hook 'smartparens-mode)
  (add-hook 'protobuf-mode-hook 'smartparens-mode)
  (add-hook 'lua-mode-hook 'smartparens-mode)
  (add-hook 'elm-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
  :config
  (add-hook 'c-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'sly-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'python-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'go-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'rust-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lua-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(provide 'stackcats-parens)
;;; stackcats-parens.el ends here
