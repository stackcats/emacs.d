;;; package --- Summary
;;; Commentary:
;;; Code:
(setq gc-cons-threshold 100000000)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar local-dir (file-name-directory load-file-name))
(defvar config-dir (expand-file-name  "config" local-dir))

(add-to-list 'load-path config-dir)

(use-package stackcats-custom)
(use-package stackcats-helm)
(use-package stackcats-key)
(use-package stackcats-c)
(use-package stackcats-clisp)
(use-package stackcats-clojure)
(use-package stackcats-ensime)
(use-package stackcats-go)
(use-package stackcats-haskell)
(use-package stackcats-js)
(use-package stackcats-perl)
(use-package stackcats-python)
(use-package stackcats-racket)
(use-package stackcats-web)
(use-package stackcats-yas)
(use-package stackcats-flycheck)
(use-package stackcats-company)
(use-package stackcats-sql)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multi-term anzu company-web company-web-html company-c-headers yahoo-weather which-key web-mode use-package sqlup-mode spaceline solarized-theme smartparens shm rainbow-mode rainbow-delimiters racket-mode nyan-mode neotree mode-icons memoize magit js2-mode hindent helm-projectile helm-gtags helm-flycheck grandshell-theme git-gutter-fringe+ flycheck-pos-tip flycheck-clojure expand-region exec-path-from-shell ensime company-tern company-jedi company-irony company-go company-ghc anaconda-mode all-the-icons-dired ace-window ace-jump-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
