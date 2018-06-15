;;; package --- Summary
;;; Commentary:
;;; Code:
(setq-default mode-line-format nil)

(when (display-graphic-p)
  (progn
    ;; (use-package dracula
    ;;   :defer t
    ;;   :init
    ;;   (load-theme 'dracula t))

    (load-theme 'deeper-blue t)
    
    (use-package spaceline
      :init
      (require 'spaceline-config)
      (spaceline-helm-mode))

    (setq-default ns-use-srgb-colorspace nil)

    (use-package spaceline-all-the-icons
      :after spaceline
      :config
      (spaceline-all-the-icons-theme)
      (setq spaceline-all-the-icons-separator-type 'cup))))

(use-package page-break-lines
  :config
  (global-page-break-lines-mode))

(use-package rainbow-mode
  :config
  (add-hook 'css-mode-hook 'rainbow-mode))

(provide 'stackcats-prettify)
;;; stackcats-prettify.el ends here
