;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package dart-mode
  :mode "\\.dart\\'"
  :hook ((dart-mode . flycheck-mode)
         (dart-mode . smartparens-mode))
  :config
  (setq dart-enable-analysis-server t))

(provide 'stackcats-dart)
;;; stackcats-dart.el ends here
