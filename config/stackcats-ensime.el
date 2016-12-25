;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package ensime
  :ensure t
  :commands ensime ensime-mode
  :config
  (add-hook 'java-mode-hook 'ensime-mode)
  (add-hook 'scala-mode-hook 'ensime-mode))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(provide 'stackcats-ensime)
;;; stackcats-ensime.el ends here
