;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package aggressive-indent
  :hook ((js2-mode . aggressive-indent-mode)
         (c-mode . aggressive-indent-mode)))
  
(use-package dashboard
  :config
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package column-enforce-mode
  :hook (prog-mode . column-enforce-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(when (display-graphic-p)
  (progn

    (use-package nord-theme
      :config
      (load-theme 'nord t))
    
    (use-package spaceline
      :config
      (spaceline-helm-mode))

    ;; (setq-default ns-use-srgb-colorspace nil)

    (use-package spaceline-all-the-icons
      :after spaceline
      :config
      (if (fboundp 'spaceline-all-the-icons-theme)
          (spaceline-all-the-icons-theme))
      (setq spaceline-all-the-icons-separator-type 'none))))

(provide 'stackcats-ui)
;;; stackcats-ui.el ends here
