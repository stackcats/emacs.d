
;;; package --- Summary
;;; Commentary:
;;; Command:
;;; rustup component add rust-src
;;; Code:
(use-package rust-mode
  :ensure-system-package
  (rustfmt . "rustup component add rustfmt --toolchain stable-x86_64-apple-darwin")
  :config
  (setq rust-format-on-save t))

(provide 'stackcats-rust)
;;; stackcats-rust.el ends here
