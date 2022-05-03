;;; package --- Summary
;;; Commentary:
;;; Code:

(defun close-all-parentheses ()
  (interactive "*")
  (let ((closing nil))
    (save-excursion
      (while (condition-case nil
                 (progn
                   (backward-up-list)
                   (let ((syntax (syntax-after (point))))
                     (cl-case (car syntax)
                       ((4) (setq closing (cons (cdr syntax) closing)))
                       ((7 8) (setq closing (cons (char-after (point)) closing)))))
                   t)
               ((scan-error) nil))))
    (apply #'insert (nreverse closing))))

(defun prelude-start-sly ()
  (if (and (fboundp 'sly-connected-p)
           (fboundp 'sly)
           (not (sly-connected-p)))
      (save-excursion (sly))))

;;; Common Lisp
(use-package sly
  :mode ("\\.lisp\\'" . lisp-mode)
  :hook ((lisp-mode . sly-mode)
         (sly-mode . prelude-start-sly))
  :config
  (setq-default inferior-lisp-program "/usr/local/bin/clisp"))

;;; Racket
(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook ((racket-mode . (lambda() (set (make-local-variable 'smartparens-mode) nil)))
         (racket-mode . racket-xp-mode)
         (racket-mode . racket-smart-open-bracket-mode)
         (racket-mode . eglot-ensure))
  :bind
  (:map racket-mode-map
        ("C-]" . close-all-parentheses)))

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
