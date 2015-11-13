;;;helm-mode

(require 'helm)
(require 'helm-config)
(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(helm-autoresize-mode t)
(helm-mode 1)

(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(eval-after-load "helm-gtags"
  '(progn
	 (define-key helm-gtags-mode-map (kbd "C-c h t")
	   'helm-gtags-find-tag)
	 (define-key helm-gtags-mode-map (kbd "C-c h r")
	   'helm-gtags-find-rtag)
	 (define-key helm-gtags-mode-map (kbd "C-c h s")
	   'helm-gtags-find-symbol)
	 (define-key helm-gtags-mode-map (kbd "C-c ,")
	   'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "C-c .")
	   'helm-gtags-next-history)
	 (define-key helm-gtags-mode-map (kbd "M-,")
	   'helm-gtags-pop-stack)
	 (define-key helm-gtags-mode-map (kbd "C-c h j")
	   'helm-gtags-select)
	 (define-key helm-gtags-mode-map (kbd "M-.")
	   'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "C-c h a")
	   'helm-gtags-tags-in-this-function)))

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
(provide 'stackcats-helm)
