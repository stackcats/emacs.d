(add-to-list 'load-path "~/.emacs.d/config")
;;;显示设置
;;英文字体
(set-face-attribute
 'default nil :font "Monaco 16")
;;启动GUI时配置
(when window-system
  ;;中文字体
  (set-fontset-font "fontset-default" 'unicode '("苹方" . "unicode-ttf"))
  (tool-bar-mode 0)
  (menu-bar-mode 1)
  (scroll-bar-mode 0))
;;高亮当前行
(global-hl-line-mode 1)
;;mode-line显示时间及格式
(display-time-mode t)
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t)
;;mode-line显示行列号
(setq line-number-mode t)
(setq column-number-mode t)
;;TAB宽度
(setq default-tab-width 4)
;;括号匹配
(show-paren-mode 1)
;;显示文件名
(setq frame-title-format "%b")
;;显示行号
(global-linum-mode t)
(setq inhibit-startup-message t)
(setq message-log-max nil)
(kill-buffer "*Messages*") 
(setq stack-trace-on-error nil)
(global-font-lock-mode t)
(setq indent-tabs-mode nil)
;;(setq tab-width 4)
;;彩虹猫
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'nyan-mode)
(nyan-mode 1)
;;;行为设置
;;关闭提示音
(setq ring-bell-function 'ignore)
;;覆盖当前选中region
(pending-delete-mode t)
;;关闭文件备份
(setq-default make-backup-files nil)
(setq auto-save-default nil)
;;utf8
(prefer-coding-system 'utf-8)
;(prefer-coding-system 'chinese-gbk)
;;外部应用剪切板
(setq x-select-enable-clipboard t)
(setq default-directory "~/") 

(require 'stackcats-package)
;;;helm-mode
(add-to-list 'load-path "~/.emacs.d/vendor/helm/")
(require 'helm)
(require 'helm-config)
(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(when (executable-find "ack-grep")
  (setq helm-grep-default-command
		"ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command
		"ack-grep -H --no-group --no-color %e %p %f"))
(helm-autoresize-mode t)
(helm-mode 1)

(require 'stackcats-clisp)
(require 'stackcats-js)
(require 'stackcats-key)
(require 'stackcats-ac)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
	("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
