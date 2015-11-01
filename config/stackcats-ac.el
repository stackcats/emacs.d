;;;auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook 
		  (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook 
		  (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(setq ac-auto-start nil)
(setq ac-dwim t)
(ac-set-trigger-key "\t")
(define-key ac-mode-map "\t" 'auto-complete)
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 0.5)
(add-to-list 'ac-modes 'web-mode) ;support web-mode

(provide 'stackcats-ac)
