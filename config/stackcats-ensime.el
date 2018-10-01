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
  :hook ((java-mode . ensime-mode)
         (java-mode . smartparens-mode))
  :config
  (setq ensime-auto-connect 'always)
  (setq ensime-startup-notification nil)
  (setq-default ensime-startup-snapshot-notification nil))

(use-package scala-mode
  :mode "\\.scala\\'"
  :hook ((scala-mode . ensime-mode)
         (scala-mode . smartparens-mode))
  :interpreter
  ("scala" . scala-mode))

(provide 'stackcats-ensime)
;;; stackcats-ensime.el ends here
