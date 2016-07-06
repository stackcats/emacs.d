;;;js

(autoload 'js2-mode "js2-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq inferior-js-mode-hook
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
		"clearInterval"	"location" "__dirname" "exports"
		"console" "JSON" "setImmediate"	"Buffer" "$"
		"process" "define" "angular" "$http" "window"
		"async" "await" "syntax" "package" "message"
		"service" "rpc" "string" "logger" "statsd"
		"Image"))

(add-hook 'js2-mode-hook 
          '(lambda ()
	     (local-set-key (kbd "C-c C-c") 'js-send-last-sexp)
	     (local-set-key (kbd "C-x C-r") 'js-send-region)
	     (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
	     (local-set-key (kbd "C-c b") 'js-send-buffer)
	     (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
	     (tern-mode t)
	     (setq js2-basic-offset 2)
             (setq js-switch-indent-offset 2)
	     (setq dash-at-point-docset "javascript")
	     (diminish 'tern-mode "Ⓣ")))

(add-hook 'js2-mode-hook 'smartparens-mode)

(add-hook 'json-mode-hook
	  '(lambda ()
	     (make-local-variable 'js-indent-level)
	     (setq js-indent-level 2)))
(provide 'stackcats-js)
