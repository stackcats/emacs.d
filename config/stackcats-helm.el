;;;helm-mode

(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (setq helm-split-window-in-side-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-scroll-amount 8)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-autoresize-mode t)
  (setq helm-mode 1)
  (diminish 'helm-mode "H")
  :bind
  (("C-x b" . helm-mini)
   ("C-x C-f" . helm-find-files)
   ("C-s" . helm-occur)
   ("M-x" . helm-M-x)
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action)
   ("M-y" . helm-show-kill-ring)))

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(use-package helm-gtags
  :ensure t
  :config
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-auto-update t)
  (setq helm-gtags-use-input-at-cursor t)
  (setq helm-gtags-pulse-at-cursor t)
  (setq helm-gtags-prefix-key "\C-cg")
  (setq helm-gtags-suggested-key-mapping t)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (diminish 'helm-gtags-mode "Hg")
  :bind
  (("C-c h t" . helm-gtags-find-tag)
   ("C-c h r" . helm-gtags-find-rtag)
   ("C-c h s" . helm-gtags-find-symbol)
   ("C-c ," . helm-gtags-previous-history)
   ("C-c ." . helm-gtags-next-history)
   ("M-," . helm-gtags-pop-stack)
   ("C-c h j" . helm-gtags-select)
   ("M-." . helm-gtags-dwim)
   ("C-c h a" . helm-gtags-tags-in-this-function)))

					;(eval-after-load "helm-gtags"
					;  '(progn
					;     (define-key helm-gtags-mode-map (kbd "C-c h t")
					;       'helm-gtags-find-tag)
					;     (define-key helm-gtags-mode-map (kbd "C-c h r")
					;       'helm-gtags-find-rtag)
					;     (define-key helm-gtags-mode-map (kbd "C-c h s")
					;       'helm-gtags-find-symbol)
					;     (define-key helm-gtags-mode-map (kbd "C-c ,")
					;       'helm-gtags-previous-history)
					;     (define-key helm-gtags-mode-map (kbd "C-c .")
					;       'helm-gtags-next-history)
					;     (define-key helm-gtags-mode-map (kbd "M-,")
					;       'helm-gtags-pop-stack)
					;     (define-key helm-gtags-mode-map (kbd "C-c h j")
					;       'helm-gtags-select)
					;     (define-key helm-gtags-mode-map (kbd "M-.")
					;       'helm-gtags-dwim)
					;     (define-key helm-gtags-mode-map (kbd "C-c h a")
					;      'helm-gtags-tags-in-this-function)))

(provide 'stackcats-helm)
