;;; package --- Summary
;;; Commentary:
;;; Code:

;;环境变量
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;;英中文字体
(set-face-attribute 'default nil :font "Monaco 16")
(set-fontset-font "fontset-default" 'unicode '("苹方" . "unicode-ttf"))
;;启动GUI时配置
(when window-system
  (tool-bar-mode 0)
  (menu-bar-mode 1)
  (scroll-bar-mode 0))
;;高亮当前行
(setq hl-line-range-function
      #'(lambda ()
	  (cons (line-end-position) (line-beginning-position 2))))
(defvar global-hl-line-sticky-flag t)
(global-hl-line-mode 1)

;;mode-line显示时间及格式
(defvar display-time-format "%Y/%m/%d %H:%M")
(display-time-mode t)
;;TAB宽度
(setq tab-width 4)
;;括号匹配
(show-paren-mode 1)
;;显示文件名
(setq frame-title-format "%b")
;;显示行号
(global-linum-mode t)
(setq inhibit-startup-message t)
(setq message-log-max nil)
(kill-buffer "*Messages*")
(defvar stack-trace-on-error nil)
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
;;外部应用剪切板
(setq x-select-enable-clipboard t)
;;默认目录
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

(which-key-mode)
(defvar which-key-idle-delay 0.1)
(defvar which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's `emacs-lisp-mode' and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)

(defun indent-whole ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(add-hook 'after-save-hook
	  #'(lambda ()
	      (unless (or (string-match-p "makefile" mode-name)
			  (string-match-p "bison" mode-name)
			  (string-match-p "jade" mode-name))
		;;makefile自动格式化有问题
		(indent-whole))))


(require 'spaceline-config)
(setq powerline-default-separator 'box)
(setq spaceline-workspace-numbers-unicode t)
(spaceline-emacs-theme)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (rainbow-mode 1)))
(global-rainbow-mode 1)

(smartparens-global-mode t)

(global-anzu-mode 1)

(load-theme 'atom-one-dark t)

;; display lambda as "λ"
(global-prettify-symbols-mode 1)

(provide 'stackcats-custom)

;;; stackcats-custom.el ends here
