;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (setq-default sp-escape-quotes-after-insert nil)
  (require 'smartparens-config)
  (sp-with-modes '(web-mode)
    (sp-local-pair "%" "%"
                   :unless '(sp-in-string-p)
                   :post-handlers '(((lambda (&rest _ignored)
                                       (just-one-space)
                                       (save-excursion (insert " ")))
                                     "SPC" "=" "#")))
    (sp-local-tag "%" "<% "  " %>")
    (sp-local-tag "=" "<%= " " %>")
    (sp-local-tag "#" "<%# " " %>"))
  (add-hook 'css-mode-hook 'smartparens-mode))

(provide 'stackcats-parens)
;;; stackcats-parens.el ends here
