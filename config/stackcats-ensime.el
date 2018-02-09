;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package ensime
  :ensure t
  :config
  (setq ensime-auto-connect 'always)
  (setq-default ensime-startup-snapshot-notification nil)
  (add-hook 'java-mode-hook 'ensime-mode)
  (add-hook 'scala-mode-hook 'ensime-mode))

(provide 'stackcats-ensime)
;;; stackcats-ensime.el ends here
