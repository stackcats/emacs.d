;;; package --- Summary
;;; Commentary:
;;; Command:
;;; rustup component add rust-src
;;; Code:
(use-package rust-mode
  :ensure-system-package
   (rustfmt . "rustup component add rustfmt-preview")
  :config
  (setq rust-format-on-save t))

(use-package racer
  :ensure-system-package
  (racer . "cargo install racer")
  :after rust-mode
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)))

(use-package flycheck-rust
  :after (rust-mode flycheck)
  :hook ((flycheck-mode . flycheck-rust-setup)
         (rust-mode . flycheck-mode)))

(use-package company-racer
  :after (racer company)
  :config
  (add-to-list 'company-backends 'company-racer))

(provide 'stackcats-rust)
;;; stackcats-rust.el ends here
