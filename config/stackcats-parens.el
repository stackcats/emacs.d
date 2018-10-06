;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (setq-default sp-escape-quotes-after-insert nil)
  (require 'smartparens-config)
  (add-hook 'css-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
  :config
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'stackcats-parens)
;;; stackcats-parens.el ends here
