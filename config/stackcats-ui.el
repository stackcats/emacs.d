;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode))

(use-package column-enforce-mode
  :hook (prog-mode . column-enforce-mode))

(provide 'stackcats-ui)
;;; stackcats-ui.el ends here
