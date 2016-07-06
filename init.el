;;; Code:

(add-to-list 'load-path "~/.emacs.d/config/")

(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

(require 'stackcats-custom)
(require 'stackcats-helm)
(require 'stackcats-clisp)
(require 'stackcats-js)
(require 'stackcats-key)
(require 'stackcats-go)
(require 'stackcats-python)
(require 'stackcats-web)
(require 'stackcats-c)
(require 'stackcats-company)
(require 'stackcats-yas)
(require 'stackcats-flycheck)
(require 'stackcats-minor)
;; (when window-system
;;   (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (inf-groovy malabar-mode sql-indent anaconda-mode company-jedi helm-flycheck yasnippet xelb which-key web-mode web spacemacs-theme spaceline smartparens slime rainbow-mode rainbow-delimiters osx-pseudo-daemon nyan-mode mode-compile markdown-mode magit js2-mode js-comint jade-mode htmlize helm-gtags helm-dash helm-ag gnu-apl-mode git-gutter-fringe+ flycheck-tip flycheck-protobuf flycheck-pos-tip flycheck-clojure expand-region exec-path-from-shell dired-rainbow diminish company-web company-tern company-irony company-go company-flx company-c-headers color-theme-sanityinc-solarized bison-mode better-defaults auto-complete atom-one-dark-theme anzu ace-jump-mode ac-html-bootstrap))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
