;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package racket-mode
  :ensure t
  :config
  (setq racket-racket-program (getenv "RACKET"))
  (setq racket-raco-program (getenv "RACO")))

(provide 'stackcats-racket)
;;; stackcats-racket.el ends here
