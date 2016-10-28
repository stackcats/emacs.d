;;; package --- Summary
;;; Commentary:
;;; Code:
;;; deps
;;; cabal update
;;; cabal install happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode hindent
(use-package haskell-mode
  :ensure t
  :mode ("\\.hs" . haskell-mode)
  :config
  (setq haskell-tags-on-save t)
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-process-log t)
  (setq haskell-process-type 'cabal-repl)
  (setq haskell-tags-on-save t)
  :bind
  (:map haskell-mode-map
        ("C-c c" . haskell-process-load-or-reload)
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
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'hindent-mode))

(use-package ghc
  :ensure t
  :config
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

(use-package shm
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'structured-haskell-mode))
;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")
(provide 'stackcats-haskell)
;;; stackcats-haskell.el ends here
