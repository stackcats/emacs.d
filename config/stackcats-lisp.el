;;; package --- Summary
;;; Commentary:
;;; Code:

;;; Common Lisp
(add-to-list 'load-path "~/.emacs.d/vendor/slime-2.9/")
(use-package slime
  :mode ("\\.lisp\\'" . slime-mode)
  :ensure-system-package
  (ccl . "brew install clozure-cl")
  :config
  (setq-default inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")
  (require 'slime-autoloads)
  (slime-setup '(slime-fancy))
  (unless (slime-connected-p)
    (save-excursion (slime)))
  (turn-off-smartparens-mode)
  :bind
  (:map slime-mode-map
	("C-<return>" . slime-close-all-parens-in-sexp)
	:map slime-repl-mode-map
	("<up>" . slime-repl-previous-input)
	("<down>" . slime-repl-next-input)))

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
