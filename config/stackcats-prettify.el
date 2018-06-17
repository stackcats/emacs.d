;;; package --- Summary
;;; Commentary:
;;; Code:
;;(setq-default mode-line-format nil)

(when (display-graphic-p)
  (progn
    ;; (use-package dracula
    ;;   :defer t
    ;;   :init
    ;;   (load-theme 'dracula t))

    (use-package creamsody-theme
      :defer t
      :init
      (load-theme 'creamsody t))
    
    (use-package spaceline
      :init
      (require 'spaceline-config)
      (spaceline-helm-mode))

    ;; (setq-default ns-use-srgb-colorspace nil)

    (use-package spaceline-all-the-icons
      :after spaceline
      :config
      (if (fboundp 'spaceline-all-the-icons-theme)
        (spaceline-all-the-icons-theme))
      (setq spaceline-all-the-icons-separator-type 'none))))

(provide 'stackcats-prettify)
;;; stackcats-prettify.el ends here
