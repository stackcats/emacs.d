;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package yasnippet
  :defer t
  :init
  (defadvice auto-insert (around yasnippet-expand-after-auto-insert activate)
    "使用yas扩展模板."
    (let ((is-new-file (and (not buffer-read-only)
			    (or (eq this-command 'auto-insert)
				(and auto-insert (bobp) (eobp))))))
      ad-do-it
      (let ((old-point-max (point-max)))
	(when is-new-file
	  (goto-char old-point-max)
	  (yas-expand-snippet
	   (buffer-substring-no-properties (point-min) (point-max)))
	  (delete-region (point-min) old-point-max)))))
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1)
  (auto-insert-mode)
  (setq-default auto-insert-directory "~/.emacs.d/template/")
  (defvar auto-insert-query nil)
  (define-auto-insert "\\.el\\'" "elisp")
  (define-auto-insert "\\.c\\'" "c")
  (define-auto-insert "\\.l\\'" "flex")
  (define-auto-insert "\\.y\\'" "yacc")
  (define-auto-insert "\\.html\\'" "html")
  (define-auto-insert "\\.ejs\\'" "ejs"))

(provide 'stackcats-yas)
;;; stackcats-yas.el ends here
