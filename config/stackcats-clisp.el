;;;slime
(setq inferior-lisp-program "/usr/local/bin/ccl")
(add-to-list 'load-path "~/.emacs.d/vendor/slime-2.9/")
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(add-hook 'lisp-mode-hook 'smartparens-mode)
(add-hook 'lisp-mode-hook 'show-smartparens-mode)
;;打开lisp文件时自动启动slime
(add-hook 'slime-mode-hook
          (lambda ()
            (unless (slime-connected-p)
              (save-excursion (slime)))))
(provide 'stackcats-clisp)
