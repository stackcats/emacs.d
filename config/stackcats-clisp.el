;;;slime
(setq inferior-lisp-program "/usr/local/bin/ccl")
(add-to-list 'load-path "~/.emacs.d/vendor/slime-2.9/")
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
;;打开lisp文件时自动启动slime
(add-hook 'slime-mode-hook
          (lambda ()
            (unless (slime-connected-p)
              (save-excursion (slime)))))
;;repl中历史命令快捷键 
(add-hook 'lisp-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "<up>") 'slime-repl-previous-input)
			 (local-set-key (kbd "<down>") 'slime-repl-next-inpu)))

(provide 'stackcats-clisp)
