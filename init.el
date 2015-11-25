;;; Code:

(add-to-list 'load-path "~/.emacs.d/config/")

(require 'stackcats-package)
(require 'spaceline-config)
(setq powerline-default-separator 'box)
(setq spaceline-workspace-numbers-unicode t)
(spaceline-emacs-theme)
(require 'stackcats-custom)
(require 'stackcats-helm)
(require 'stackcats-clisp)
(require 'stackcats-js)
(require 'stackcats-key)
;;(require 'stackcats-ac)
(require 'stackcats-web)
(require 'stackcats-c)
(require 'stackcats-company)
(require 'stackcats-yas)
(require 'stackcats-flycheck)
(require 'stackcats-minor)

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)

(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

;;(add-hook 'after-save-hook 'indent-whole)

(add-hook 'after-save-hook
	  #'(lambda ()
	      (unless (string-match-p "makefile" mode-name)
		(indent-whole))))


(defun sort-minor-mode-alist ()
  (setq minor-mode-alist
	(sort minor-mode-alist
	      #'(lambda (a b)
		  (string< (car a) (car b))))))

(add-hook 'after-init-hook 'sort-minor-mode-alist)

(add-to-list 'load-path "~/.emacs.d/vendor/gforth.el")
(autoload 'forth-mode "gforth.el")
(autoload 'forth-block-mode "gforth.el")
(add-to-list 'auto-mode-alist '("\\.fs$" . forth-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#073642")
 '(pos-tip-internal-border-width 5)
 '(safe-local-variable-values (quote ((Package . CCL))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(show-paren-match ((t (:background "dark cyan")))))

;;; init.el ends here
