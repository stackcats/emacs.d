;;;helm-mode
;(add-to-list 'load-path "~/.emacs.d/vendor/helm/")
(require 'helm)
(require 'helm-config)
(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(when (executable-find "ack-grep")
  (setq helm-grep-default-command
		"ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command
		"ack-grep -H --no-group --no-color %e %p %f"))
(helm-autoresize-mode t)
(helm-mode 1)


(provide 'stackcats-helm)
