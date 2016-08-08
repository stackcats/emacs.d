;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package js2-mode
  :ensure t
  :mode ("\\.js" . js2-mode)
  :config
  (autoload 'js2-mode "js2-mode" nil t)
  (defvar inferior-js-mode-hook
    (lambda ()
      ;; We like nice colors
      (ansi-color-for-comint-mode-on)
      ;; Deal with some prompt nonsense
      (add-to-list
       'comint-preoutput-filter-functions
       (lambda (output)
         (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))))
  (defvar inferior-js-program-command "node")
  (setq-default js2-global-externs
                '("module" "require" "buster" "sinon" "assert"
                  "refute" "setTimeout" "clearTimeout" "setInterval"
                  "clearInterval" "location" "__dirname" "exports"
                  "console" "JSON" "setImmediate" "Buffer" "$"
                  "process" "define" "angular" "$http" "window"
                  "async" "await" "syntax" "package" "message"
                  "service" "rpc" "string" "logger" "statsd"
                  "Image"))
  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  (setq js2-idle-timer-delay 2)
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  (defvar dash-at-point-docset "javascript")
  :bind
  (("C-c C-c" . js-send-last-sexp)
   ("C-x C-r" . js-send-region)
   ("C-M-x" . js-send-last-sexp-and-go)
   ("C-c b" . js-send-buffer)
   ("C-c C-b" . js-send-buffer-and-go)))

(add-hook 'json-mode-hook
	  '(lambda ()
	     (make-local-variable 'js-indent-level)
	     (setq js-indent-level 2)))

(provide 'stackcats-js)
;;; stackcats-js.el ends here
