;;; package --- Summary
;;; Commentary:
;;; Code:
(setq exec-path (append exec-path '("/usr/local/bin" "~/.cargo/bin" "~/.asdf/shims")))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
  :defer t
  :init
  (exec-path-from-shell-initialize)))

(provide 'stackcats-env)
;;; stackcats-env.el ends here
