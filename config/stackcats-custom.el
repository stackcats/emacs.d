;;; package --- Summary
;;; Commentary:
;;; Code:
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

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
(setq tab-width 4)
;;括号匹配
(show-paren-mode 1)

;;彩虹猫
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'nyan-mode)
(nyan-mode 1)
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

(require 'rainbow-delimiters)
(add-hook 'c-mode-hook #'rainbow-delimiters-mode)
(add-hook 'slime-mode-hook #'rainbow-delimiters-mode)
(add-hook 'js2-mode-hook #'rainbow-delimiters-mode)

(require 'git-gutter-fringe+)
(global-git-gutter+-mode)
(setq git-gutter-fr+-side 'right-fringe)

;;;hiddenshow
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode 'hs-minor-mode)

(provide 'stackcats-custom)
;;; stackcats-custom.el ends here
