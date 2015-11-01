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
  (setq web-mode-style-padding 1))

(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2015-06-11"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-hook 'css-mode-hook 'xah-syntax-color-hex)
(add-hook 'my-web-mode-hook 'xah-syntax-color-hex)
(add-hook 'js2-mode-hook 'xah-syntax-color-hex)

(provide 'stackcats-web)
