;;; package --- Summary
;;; Commentary:
;;; Code:

(defun prelude-start-sly ()
  (if (and (fboundp 'sly-connected-p)
           (fboundp 'sly)
           (not (sly-connected-p)))
    (save-excursion (sly))))

;;; Common Lisp
(use-package sly
  :ensure-system-package
  (ccl64 . "brew install clozure-cl")
  :mode ("\\.lisp\\'" . lisp-mode)
  :hook ((lisp-mode . flycheck-mode)
         (lisp-mode . sly-mode)
        (sly-mode . prelude-start-sly))
  :config
  (require 'sly-autoloads)
  (setq-default inferior-lisp-program "/usr/local/bin/clisp"))

;;; Racket
(use-package racket-mode
  :mode "\\.rkt\\'"
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
(use-package lisp-mode
  :ensure nil
  :commands emacs-lisp-mode
  :mode ("\\.el\\'" . emacs-lisp-mode)
  :hook (emacs-lisp-mode . flycheck-mode))

(provide 'stackcats-lisp)
;;; stackcats-lisp.el ends here
