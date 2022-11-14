;;; package --- Summary
;;; Commentary:
;;; Code:
(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))

(defun my-project-try-tsconfig-json (dir)
  (when-let* ((found (locate-dominating-file dir "jsconfig.json")))
    (cons 'eglot-project found)))

(add-hook 'project-find-functions
          'my-project-try-tsconfig-json nil nil)

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '(rust-mode . "rust-analyzer"))
  ;;(add-to-list 'eglot-server-programs '(js2-mode . "~/.asdf/shims/typescript-language-server --stdio"))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.emacs.d/vendor/elixir-ls/language_server.sh")))

(provide 'stackcats-eglot)
;;; stackcats-eglot.el ends here
 

