;;; Code:

(add-to-list 'load-path "~/.emacs.d/config/")

(require 'stackcats-custom)
(require 'stackcats-package)
(require 'stackcats-helm)
(require 'stackcats-clisp)
(require 'stackcats-js)
(require 'stackcats-key)
(require 'stackcats-ac)
(require 'stackcats-web)
(require 'stackcats-c)
(require 'stackcats-company)
(require 'stackcats-yas)
(require 'stackcats-flycheck)


(require 'spaceline-config)
(spaceline-spacemacs-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
	("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(safe-local-variable-values (quote ((Package . CCL)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#ffffff"))))
 '(company-scrollbar-fg ((t (:background "#ffffff"))))
 '(company-tooltip ((t (:inherit default :background "#ffffff"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

;;; init.el ends here
