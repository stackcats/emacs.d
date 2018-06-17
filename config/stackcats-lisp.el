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
  (if (and (fboundp 'sly-connected-p)
           (not (sly-connected-p)))
    (save-excursion (sly))))

;;; Racket
(use-package racket-mode
  :config
  (setq racket-program (getenv "RACKET")))

;;; Clojure
(use-package cider
  :config
  (setq cider-repl-display-help-banner nil))

(use-package flycheck-clojure
  :after (cider flycheck)
  :hook ((flycheck-mode . flycheck-clojure-setup)
         (cider-mode . flycheck-mode)))

;;; Emacs Lisp
(use-package emacs-lisp-mode
  :ensure nil
  :hook (emacs-lisp-mode . flycheck-mode))

(provide 'stackcats-lisp)
;;; stackcats-lisp.el ends here
