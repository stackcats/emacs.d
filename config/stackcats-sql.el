;;; package --- Summary

;;; Commentary:

;;; Code:
(eval-after-load "sql"
  '(load-library "sql-indent"))

(use-package sqlup-mode
  :ensure t
  :config
  (add-hook 'sql-mode-hook 'sqlup-mode)
  (add-hook 'sql-interactive-mode-hook 'sqlup-mode))
(provide 'stackcats-sql)
;;; stackcats-sql.el ends here
