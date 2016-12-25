;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package jdee
  :ensure t
  :mode ("\\.java\\'" . java-mode)
  :config
  (setq jdee-server-dir "~/.emacs.d/vendor/jdee-server/target/jdee-bundle-1.1-SNAPSHOT.jar-jar-with-dependencies.jar"))

(provide 'stackcats-java)
;;; stackcats-java.el ends here
