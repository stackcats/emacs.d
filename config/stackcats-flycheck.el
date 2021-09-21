
;;; package --- Summary
;;; Commentary:
;;; Code:

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-default flycheck-javascript-eslint-executable eslint))))

(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode)
  :config
  (use-package flycheck-credo)
  (flycheck-credo-setup)
  (setq-default flycheck-temp-prefix ".")
  (setq-default
   flycheck-disabled-checkers
   (append flycheck-disabled-checkers '(javascript-jshint)))
  (if (fboundp 'flycheck-add-mode)
      (flycheck-add-mode 'javascript-eslint 'js2-mode)))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
