;;; package --- Summary
;;; Commentary:
;;; Command:
;;; rustup component add rust-src
;;; cargo install racer
;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (defvar rust-format-on-save t))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(provide 'stackcats-rust)
;;; stackcats-rust.el ends here
