;;; package --- Summary
;;; Commentary:
;;; Code:
(when (display-graphic-p)
  (progn
    (use-package dracula-theme
      :ensure t
      :defer t
      :init
      (load-theme 'dracula t))
    
    (use-package spaceline
      :ensure t
      :init
      (require 'spaceline-config)
      (spaceline-helm-mode))

    (setq-default ns-use-srgb-colorspace nil)

    (use-package spaceline-all-the-icons
      :ensure t
      :after spaceline
      :config
      (spaceline-all-the-icons-theme)
      (setq spaceline-all-the-icons-separator-type 'cup))))

(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode))

;; all-the-icons
(use-package all-the-icons :ensure t :defer t)

(use-package all-the-icons-dired
  :ensure t
  :defer t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook 'rainbow-mode))

(provide 'stackcats-prettify)
;;; stackcats-prettify.el ends here
