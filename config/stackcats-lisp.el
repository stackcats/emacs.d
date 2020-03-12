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
  (clisp . "brew install clisp")
  :mode ("\\.lisp\\'" . lisp-mode)
  :hook ((lisp-mode . sly-mode)
        (sly-mode . prelude-start-sly))
  :config
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
(defun stackcats-emacs-lisp-mode-hook ()
  (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t))

(use-package lisp-mode
  :ensure nil
  :commands emacs-lisp-mode
  :mode ("\\.el\\'" . emacs-lisp-mode)
  :hook (emacs-lisp-mode . stackcats-emacs-lisp-mode-hook))

(provide 'stackcats-lisp)
;;; stackcats-lisp.el ends here
