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

(setq inferior-js-program-command "/usr/local/bin/node --interactive")

(setq-default js2-global-externs
			  '("module"
				"require"
				"buster"
				"sinon"
				"assert"
				"refute"
				"setTimeout"
				"clearTimeout"
				"setInterval"
				"clearInterval"
				"location"
				"__dirname"
				"exports"
				"console"
				"JSON"
				"setImmediate"
				"Buffer"
				"process"))

(add-hook 'js2-mode-hook 
          '(lambda ()
            (local-set-key (kbd "C-c C-c") 'js-send-last-sexp)
            (local-set-key (kbd "C-x C-r") 'js-send-region)
            (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'js-send-buffer)
            (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)))

(provide 'stackcats-js)
