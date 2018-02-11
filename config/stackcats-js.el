;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.jsx\\'" . rjsx-mode))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :config
  (autoload 'js2-mode "js2-mode" nil t)
  (setq-default js2-global-externs
                '("module" "require" "buster" "sinon" "assert"
                  "refute" "setTimeout" "clearTimeout" "setInterval"
                  "clearInterval" "location" "__dirname" "exports"
                  "console" "JSON" "setImmediate" "Buffer" "$"
                  "process" "define" "angular" "$http" "window"
                  "async" "await" "syntax" "package" "message"
                  "service" "rpc" "string" "logger" "statsd"
                  "Image", "document"))
  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  (setq js2-idle-timer-delay 2)
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  (defvar dash-at-point-docset "javascript"))

(add-hook 'json-mode-hook
	  '(lambda ()
	     (make-local-variable 'js-indent-level)
	     (setq js-indent-level 2)))

(use-package company-tern
  :ensure-system-package
  (tern . "npm install -g tern")
  :after company
  :config
  (add-to-list 'company-backends 'company-tern)
  (setq company-tern-property-marker ""))

(provide 'stackcats-js)
;;; stackcats-js.el ends here
