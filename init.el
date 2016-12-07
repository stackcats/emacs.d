;;; package --- Summary
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/config/")

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'stackcats-custom)
(require 'stackcats-helm)
(require 'stackcats-clisp)
(require 'stackcats-js)
(require 'stackcats-key)
(require 'stackcats-go)
(require 'stackcats-python)
(require 'stackcats-web)
(require 'stackcats-c)
(require 'stackcats-clojure)
(require 'stackcats-scala)
(require 'stackcats-yas)
(require 'stackcats-flycheck)
(require 'stackcats-haskell)
(require 'stackcats-company)
(require 'stackcats-sql)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fci-rule-color "#14151E")
 '(custom-enabled-themes (quote (leuven)))
 '(package-selected-packages
   (quote
    (paredit ace-window afternoon-theme ensime meghanada sqlup-mode json-mode color-theme-modern yasnippet xelb which-key web-mode web use-package sql-indent spacemacs-theme spaceline smartparens slime rainbow-mode rainbow-delimiters osx-pseudo-daemon nyan-mode mode-compile markdown-mode malabar-mode magit js2-mode js-comint jade-mode inf-groovy htmlize helm-projectile helm-gtags helm-flycheck helm-dash helm-ag go-dlv gnu-apl-mode git-gutter-fringe+ flycheck-tip flycheck-protobuf flycheck-pos-tip flycheck-clojure expand-region exec-path-from-shell dired-rainbow company-web company-tern company-jedi company-irony company-go company-flx company-c-headers color-theme-sanityinc-solarized bison-mode better-defaults auto-complete atom-one-dark-theme anzu anaconda-mode ace-jump-mode ac-html-bootstrap)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
