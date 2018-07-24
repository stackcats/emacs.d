;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package sbt-mode
  :mode "\\.scala\\'"
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package ensime
  :hook ((java-mode . ensime-mode)
         (java-mode . smartparens-mode)
         (scala-mode . ensime-mode)
         (scala-mode . smartparens-mode))
  :config
  (setq ensime-auto-connect 'always)
  (setq-default ensime-startup-snapshot-notification nil))

(provide 'stackcats-ensime)
;;; stackcats-ensime.el ends here
