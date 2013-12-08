;;Oleg Tyshchenko Emacs Config file

(setq show-paren-style 'expression)
(show-paren-mode 2)

(menu-bar-mode -1)
(tool-bar-mode -1)

;disable backup and autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

(set-default-font "Monaco-13")

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'bs)
(setq bs-configurations
      '(f("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
 
(global-set-key (kbd "<f2>") 'bs-show)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")

(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")

(projectile-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(color-theme-classic)

(require 'litable)

(defun after-lisp-interaction-mode () 
  (litable-mode)
  (define-key litable-mode-map (kbd "<f9>") 'litable-refresh))
(defun after-clojure-mode ()
  (auto-auto-indent-mode)
  (paredit-mode))

(add-hook 'lisp-interaction-mode-hook 'after-lisp-interaction-mode)

(add-hook 'clojure-mode-hook 'after-clojure-mode)

(require 'smex) ;;M-x enchancment built on top of ido
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(require 'psvn)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun after-js2-mode () 
  (auto-auto-indent-mode)
  (autopair-mode))
(add-hook 'js2-mode-hook 'after-js2-mode)

(require 'emmet-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun after-web-mode () 
  (emmet-mode)
  (define-key web-mode-map (kbd "TAB") 'emmet-expand-yas)
  (auto-auto-indent-mode))

(defun after-html-mode () 
  (emmet-mode)
  (define-key html-mode-map (kbd "TAB") 'emmet-expand-yas)
  (auto-auto-indent-mode))

(defun after-css-mode ()
  (emmet-mode)
  (auto-auto-indent-mode)
  (autopair-mode))

(add-hook 'html-mode-hook 'after-html-mode)
(add-hook 'css-mode-hook 'after-css-mode)
