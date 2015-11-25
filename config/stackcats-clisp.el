;;;slime
(setq inferior-lisp-program "/usr/local/bin/ccl")
(add-to-list 'load-path "~/.emacs.d/vendor/slime-2.9/")
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'slime-mode-hook
          (lambda ()
	    ;;打开lisp文件时自动启动slime
            (unless (slime-connected-p)
              (save-excursion (slime)))

	    (local-set-key (kbd "<up>") 'slime-repl-previous-input)
	    (local-set-key (kbd "<down>") 'slime-repl-next-input)
	    (local-set-key (kbd "C-<return>") 'slime-close-all-parens-in-sexp)))

(provide 'stackcats-clisp)
