;;;slime
(add-to-list 'load-path "~/.emacs.d/vendor/slime-2.9/")
(use-package slime
  :mode ("\\.lisp" . slime-mode)
  :config
  (setq inferior-lisp-program (getenv "LISP"))
  (require 'slime-autoloads)
  (slime-setup '(slime-fancy))
  (unless (slime-connected-p)
    (save-excursion (slime)))
  (turn-off-smartparens-mode)
  (diminish 'slime-mode "λ")
  :bind
  (:map slime-mode-map
	("C-<return>" . slime-close-all-parens-in-sexp)
	:map slime-repl-mode-map
	("<up>" . slime-repl-previous-input)
	("<down>" . slime-repl-next-input)))

(provide 'stackcats-clisp)
