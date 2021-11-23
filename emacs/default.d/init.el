;;;;我的 Common Lisp 语言设置
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime/")
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/evil")

(require 'slime)
(slime-setup)

(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-modes
   '(emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode haskell-mode fundamental-mode rust-mode))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(flyspell-abbrev-p t)
 '(flyspell-after-incorrect-word-string nil)
 '(font-use-system-font t)
 '(global-auto-complete-mode t)
 '(global-linum-mode t)
 '(package-selected-packages
   '(winum fancy-battery nyan-mode snazzy-theme wakatime-mode ox-asciidoc ox-gfm markdown-mode sicp material-theme zenburn-theme dracula-theme rainbow-mode evil rust-auto-use rust-mode rust-playground powerline monokai-theme monokai-alt-theme haskell-mode auto-complete))
 '(show-paren-mode t)
 '(size-indication-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq linum-format "%d  ")
(push (substitute-in-file-name "~/.emacs.d/idea-theme/") custom-theme-load-path)
(load-theme 'zenburn t)

(require 'powerline)
(powerline-center-theme)

;(require 'spaceline-config)
;(spaceline-emacs-theme)

(setq winum-auto-setup-mode-line nil)
(winum-mode)

(menu-bar-mode 0)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq inhibit-startup-message t)
(setq indent-tabs-mode nil)
(global-hl-line-mode 1)
(setq org-src-fontify-natively t)
(setq make-backup-files nil)
(setq org-support-shift-select t)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(add-to-list 'org-latex-packages-alist '("" "parskip"))
(add-to-list 'org-latex-packages-alist '("UTF8" "ctex"))
(add-to-list 'org-latex-packages-alist '("margin=1.5cm" "geometry"))

(setq user-full-name "Kiva"
      user-mail-address "imkiva@islovely.icu")

(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode t)))

(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md 'asciidoc))

(setq org-ellipsis "⇘")
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'evil)
(evil-mode 1)

(save-place-mode t)
