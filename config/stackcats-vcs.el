;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package git-gutter-fringe+
  :config
  (setq git-gutter-fr+-side 'right-fringe))

(add-hook 'after-init-hook 'global-git-gutter+-mode)

(provide 'stackcats-vcs)
;;; stackscats-vcs.el ends here
