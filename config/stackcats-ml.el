;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package tuareg
  :mode ("\\.ml[4ilpy]?$" . tuareg-mode))

(use-package merlin
  :after tuareg
  :hook (tuareg-mode . merlin-mode))

(use-package flycheck-ocaml
  :after (flycheck merlin)
  :config
  (setq merlin-error-after-save nil)
  (setq shell-file-name "/bin/sh")
  (flycheck-ocaml-setup))

(provide 'stackcats-ml)
;;; stackcats-ml.el ends here
