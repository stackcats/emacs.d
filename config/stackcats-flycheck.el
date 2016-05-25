;;; Code:

(when (fboundp 'define-fringe-bitmap)
  (define-fringe-bitmap 'my-flycheck-fringe-indicator
    (vector #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00011100
	    #b00111110
	    #b00111110
	    #b00111110
	    #b00011100
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b01111111)))

(flycheck-define-error-level 'error
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-error)

(flycheck-define-error-level 'warning
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-warning)

(flycheck-define-error-level 'info
  :overlay-category 'flycheck-info-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-info)
(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode)
  '(require 'flycheck-protobuf)
  (diminish 'flycheck-mode "Ⓕ")
  (define-key flycheck-mode-map (kbd "C-c f") 'helm-flycheck)
  )


;; js2-mode
(setq-default flycheck-temp-prefix ".")
(defvar flycheck-eslintrc "~/.eslintrc")
(defvar flycheck-javascript-eslint-executable "~/.nvm/versions/node/v4.2.6/bin/eslint")
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
(flycheck-add-mode 'javascript-eslint 'js2-mode)

(add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t)
(provide 'stackcats-flycheck)
;;; stackcats-flycheck.el ends here
