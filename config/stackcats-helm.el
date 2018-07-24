;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package helm
  :config
  (require 'helm-config)
  (setq helm-split-window-inside-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (defvar helm-ff-search-library-in-sexp t)
  (setq helm-scroll-amount 8)
  (defvar helm-ff-file-name-history-use-recentf t)
  (defvar helm-buffers-fuzzy-matching t)
  (defvar helm-recentf-fuzzy-match t)
  (setq helm-autoresize-mode t)
  (setq helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-s") 'helm-occur)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-z") 'helm-select-action)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))

(use-package helm-projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'helm)
  (if (fboundp 'helm-projectile-on)
      (helm-projectile-on)))
  ;; :bind
  ;; (:map projectile-mode-map
  ;;       ("C-c p" . projectile-command-map)))

(use-package helm-gtags
  :config
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-auto-update t)
  (setq helm-gtags-use-input-at-cursor t)
  (setq helm-gtags-pulse-at-cursor t)
  (setq helm-gtags-prefix-key "\C-cg")
  (setq helm-gtags-suggested-key-mapping t)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  :bind
  (:map helm-gtags-mode-map
        ("C-c h t" . helm-gtags-find-tag)
        ("C-c h r" . helm-gtags-find-rtag)
        ("C-c h s" . helm-gtags-find-symbol)
        ("C-c ," . helm-gtags-previous-history)
        ("C-c ." . helm-gtags-next-history)
        ("M-," . helm-gtags-pop-stack)
        ("C-c h j" . helm-gtags-select)
        ("M-." . helm-gtags-dwim)
        ("C-c h a" . helm-gtags-tags-in-this-function)))

(use-package helm-flycheck
  :config
  (global-set-key (kbd "C-c f") 'helm-flycheck))

(setq helm-truncate-lines t)

(provide 'stackcats-helm)
;;; stackcats-helm.el ends here
