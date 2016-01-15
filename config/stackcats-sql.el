;;; package --- Summary

;;; Commentary:

;;; Code:
(add-hook 'sql-mode 'sqlup-mode)

(eval-after-load "sql"
  '(load-library "sql-indent"))

(provide 'stackcats-sql)
;;; stackcats-sql.el ends here
