;;; package --- Summary
;;; Commentary:
;;; Code:
;;; deps
;;; cabal update
;;; cabal install happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode hindent
(use-package haskell-mode
  :hook (haskell-mode . smartparens-mode)
  :config
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-process-log t)
  (setq haskell-process-type 'cabal-repl)
  (setq haskell-tags-on-save t)
  (defvar ghc-report-errors nil)
  :bind
  (:map haskell-mode-map
        ("C-c c" . haskell-process-load-file)
        ("C-c i" . haskell-interactive-switch)
        ("C-c n t" . haskell-process-do-type)
        ("C-c n i" . haskell-process-do-info)
        ("C-c n c" . haskell-process-cabal-build)
        ("C-c n c" . haskell-process-cabal)
        ("C-c o" . haskell-compile)
        :map haskell-cabal-mode-map
        ("C-c i" . haskell-interactive-switch)
        ("C-c k" . haskell-interactive-mode-clear)
        ("C-c c" . haskell-process-cabal-build)
        ("C-c c" . haskell-process-cabal)
        ("C-c o" . haskell-compile)))

(use-package hindent
  :hook (haskell-mode . hindent-mode))

(use-package ghc
  :config
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

(use-package company-ghc
  :after company
  :config
  (setq company-ghc-show-info t)
  (add-to-list 'company-backends '(company-ghc :with company-dabbrev-code)))

(use-package flycheck-haskell
  :after (haskell-mode flycheck)
  :hook ((flycheck-mode . flycheck-haskell-setup)))


;; (use-package shm
;;   :ensure t
;;   :config
;;   (add-hook 'haskell-mode-hook 'structured-haskell-mode))
(provide 'stackcats-haskell)
;;; stackcats-haskell.el ends here
