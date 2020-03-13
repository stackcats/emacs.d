
;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  :ensure-system-package
  ((rls . "rustup component add rls rust-analysis rust-src")
   (ocaml-language-server . "npm install -g ocaml-language-server")
   ;; (cquery . "brew install cquery")
   (gopls . "go get golang.org/x/tools/cmd/gopls"))
  :hook ((rust-mode . lsp)
         (c-mode . lsp)
         (js2-mode . lsp)
         (tuareg-mode . lsp)
         (dart-mode . lsp)
;;         (python-mode . lsp)
         (go-mode . lsp))
  :config
  (setq-default lsp-diagnostic-package :flycheck)
  (setq-default lsp-eldoc-hook nil)
  (setq-default lsp-document-sync-method 'full)
  
  (use-package lsp-ui
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-sideline-show-code-actions nil)
    (setq lsp-ui-doc-enable nil))

  (use-package company-lsp
    :commands company-lsp
    :after company
    :config
    ;;(setq company-lsp-filter-candidates nil)
    (add-to-list 'company-backends 'company-lsp))
  
  (use-package helm-lsp
    :commands helm-lsp-workspace-symbol)


  (use-package dap-mode)
  )

(use-package lsp-python-ms
  :demand
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

(use-package lsp-haskell
  :demand
  :hook (haskell-mode . lsp)
  :config
  (setq lsp-haskell-process-path-hie "hie-wrapper"))

(provide 'stackcats-lsp)
;;; stackcats-lsp.el ends here
