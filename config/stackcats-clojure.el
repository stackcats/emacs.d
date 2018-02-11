;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package cider
  :config
  (setq cider-repl-display-help-banner nil))

(use-package flycheck-clojure
  :after (cider flycheck)
  :hook ((flycheck-mode . flycheck-clojure-setup)
         (cider-mode . flycheck-mode)))

(provide 'stackcats-clojure)
;;; stackcats-clojure.el ends here
