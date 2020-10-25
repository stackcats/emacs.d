;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  ;; :ensure-system-package
  ;; ((rls . "rustup component add rls rust-analysis rust-src")
  ;;  (ocaml-language-server . "npm install -g ocaml-language-server")
  ;;  ;; (cquery . "brew install cquery")
  ;;  (gopls . "go get golang.org/x/tools/cmd/gopls"))
  :hook ((c-mode . lsp)
         (tuareg-mode . lsp)
         (dart-mode . lsp))
  :config
  (defvar lsp-diagnostics-provider :flycheck)
  (setq lsp-eldoc-hook nil)
  (setq lsp-enable-snippet t)
  (setq lsp-log-io t)
  (setq lsp-document-sync-method 'full)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  
  (use-package lsp-ui
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-sideline-show-code-actions nil)
    (setq lsp-ui-doc-enable nil))

  ;; (use-package company-lsp
  ;;   :commands company-lsp
  ;;   :after company
  ;;   :config
  ;;   ;;(setq company-lsp-filter-candidates nil)
  ;;   (add-to-list 'company-backends 'company-lsp))
  
  (use-package helm-lsp
    :commands helm-lsp-workspace-symbol)
  )

(use-package lsp-haskell
  :demand
  :hook (haskell-mode . lsp)
  :config
  (defvar lsp-haskell-process-path-hie "hie-wrapper"))

(provide 'stackcats-lsp)
;;; stackcats-lsp.el ends here
