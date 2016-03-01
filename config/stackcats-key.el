;;;key-binding
;;; Code:
;;mac按键设置
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super))

(defun open-shell ()
  "Open eshell in other buffer"
  (interactive)
  (eshell))

(global-set-key (kbd "s-1") 'hs-toggle-hiding)
(global-set-key (kbd "s-2") 'open-shell)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key [f9] 'run-js)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
;; rebind tab to run persistent action
;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; make TAB works in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c m") 'comment-or-uncomment-region)
(global-set-key (kbd "s-e") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c f") 'flycheck-list-errors)
(provide 'stackcats-key)
;;; stackcats-key.el ends here
