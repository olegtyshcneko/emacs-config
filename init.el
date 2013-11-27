(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/user.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-expr-indent-offset 2)
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-mirror-mode t)
 '(js3-mode-dev-mode-p nil)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
