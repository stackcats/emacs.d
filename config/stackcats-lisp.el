;;; package --- Summary
;;; Commentary:
;;; Code:

;;; Common Lisp
(use-package sly
  :mode ("\\.lisp\\'" . sly-mode)
  :hook (sly-mode . flycheck-mode)
  :config
  (require 'sly-autoloads)
  (setq-default inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")
  (unless (sly-connected-p)
    (save-excursion (sly))))

;;; Racket
(use-package racket-mode
  :config
  (setq racket-racket-program (getenv "RACKET"))
  (setq racket-raco-program (getenv "RACO")))

;;; Clojure
(use-package cider
  :config
  (setq cider-repl-display-help-banner nil))

(use-package flycheck-clojure
  :after (cider flycheck)
  :hook ((flycheck-mode . flycheck-clojure-setup)
         (cider-mode . flycheck-mode)))


(provide 'stackcats-lisp)
;;; stackcats-lisp.el ends here
