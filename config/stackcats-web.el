(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

(setq browse-url-firefox-program
      "/Applications/Firefox.app/Contents/MacOS/firefox")

(defun debug-html ()
  (interactive)
  (let ((file (buffer-file-name)))
    (browse-url-firefox file)))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (local-set-key (kbd "C-c C-c") 'debug-html)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-style-padding 1))


(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide 'stackcats-web)
