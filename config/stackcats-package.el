;;;包管理
;;; Code:
(require 'cl)
(require 'package)

(defvar init-packages
  '(js2-mode
	rainbow-delimiters
	color-theme-sanityinc-solarized
	yasnippet
	expand-region
	magit
	smartparens
	auto-complete
	web-mode
	js-comint
	mode-compile
	helm-gtags
	company
	spaceline
	flycheck
	ace-jump-mode))

;;源地址设置
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
		("gnu" . "http://elpa.gnu.org/packages/")
		("melpa" . "http://melpa.milkbox.net/packages/")))


;;("ELPA" . "http://tromey.com/elpa/")
;;("gnu" . "http://elpa.gnu.org/packages/")
;;("melpa" . "http://melpa.milkbox.net/packages/")


(defun stackcats-packages-installed-p ()
  "检查是否所有包是否已安装"
  (every #'package-installed-p init-packages))

(defun stackcats-require-packages (packages)
  (mapc #'stackcats-require-package packages))

(defun stackcats-require-package (package)
  "安装没有安装的包"
  (unless (memq package init-packages)
    (add-to-list 'init-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun stackcats-install-packages ()
  "安装所有init-packages中的包"
  (unless (stackcats-packages-installed-p)
    (message "%s" "Refreshing packages...")
    (package-refresh-contents)
    (message "%s" " done.")
    (stackcats-require-packages init-packages)))

;;emacs24+自动加载包
(when (>= emacs-major-version 24)
  (package-initialize)
  (stackcats-install-packages))

(provide 'stackcats-package)
;;; stackcats-package.el ends here
