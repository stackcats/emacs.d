
;;; package --- Summary
;;; Commentary:
;;; Code:
;; (require 'flycheck-quicklintjs)
;; (defun my-flycheck-quicklintjs-setup ()
;;   "Configure flycheck-quicklintjs for better experience."

;;   ;; Enable Flycheck
;;   (unless (bound-and-true-p flycheck-mode)
;;     (flycheck-mode))

;;   ;; Use quick-lint-js by default when in 'js-mode`
;;   (flycheck-select-checker 'javascript-quicklintjs)

;;   ;; Optional: Remove any delay after a change in buffer to run checkers.
;;   ;; The default is 0.5 (500ms)
;;   (setq-local flycheck-idle-change-delay 0)

;;   ;; Optional: Run quick-lint-js program when the buffer is changed and when
;;   ;; 'js-mode` is loaded
;;   (setq-local flycheck-check-syntax-automatically '(mode-enabled idle-change)))

;; (add-hook 'js2-mode-hook #'my-flycheck-quicklintjs-setup)

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
  ;; (setq-default
  ;;  flycheck-disabled-checkers
  ;;  (append flycheck-disabled-checkers '(javascript-jshint)))
  ;; (if (fboundp 'flycheck-add-mode)
  ;;     (flycheck-add-mode 'javascript-eslint 'js2-mode)))
  
  )

;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
