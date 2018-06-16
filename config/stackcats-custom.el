;;; package --- Summary
;;; Commentary:
;;; Code:
(custom-set-variables
 '(tool-bar-mode nil)
 '(menu-bar-mode 1)
 '(scroll-bar-mode nil)
 '(tab-width 2)
 '(indent-tabs-mode nil)
 '(show-paren-mode 1)
 '(global-linum-mode t)
 '(inhibit-startup-message t)
 '(frame-title-format "%b")
 '(inhibit-startup-message t)
 '(message-log-max nil)
 '(stack-trace-on-error nil)
 '(global-font-lock-mode t)
 '(ring-bell-function 'ignore)
 '(make-backup-files nil)
 '(auto-save-default nil)
 '(global-prettify-symbols-mode 1) ; display lambda as "λ"
 '(prefer-coding-system 'utf-8)
 '(select-enable-clipboard t)
 '(default-directory "~/project/src/github.com")
 '(pending-delete-mode t) ; 覆盖当前选中region
 '(mouse-wheel-scroll-amount '(1 ((shift) . 2)))
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-follow-mouse 't)
 '(hl-line-range-function
   #'(lambda () (cons (line-end-position) (line-beginning-position 2))))
 '(global-hl-line-sticky-flag t)
 '(global-hl-line-mode 1)
 )

(custom-set-faces
 '(spaceline-highlight-face
   ((t (:foreground "#F4E8BA" :background "#000"))))) ;282C32
;; spaceline-all-the-icons-info-face
(provide 'stackcats-custom)
;;; stackcats-custom.el ends here
