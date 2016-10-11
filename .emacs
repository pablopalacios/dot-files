(add-to-list 'default-frame-alist
             '(font . "-adobe-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

;; Basics
(blink-cursor-mode 0)
(column-number-mode t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tooltip-mode 0)
(tool-bar-mode 0)
;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; remove trailing spaces before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Ido
(ido-mode t)
(setq ido-auto-merge-work-directories-length -1) ;; cancel ido auto-complete


;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; Magit
(global-set-key (kbd "C-x g") 'magit-status)


;; Projectile
(projectile-global-mode)


;; Yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'python-mode-hook 'yas-minor-mode)


;; Anaconda
(add-hook 'python-mode-hook 'anaconda-mode)


;; Company
(eval-after-load "company"
 '(progn
    (add-to-list 'company-backends 'company-anaconda)
    ))
(add-hook 'python-mode-hook 'company-mode)


;; Web-mode
;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(setq web-mode-enable-current-element-highlight t)

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2C3E50" "#E74C3C" "#2ECC71" "#F1C40F" "#3498DB" "#9B59B6" "#3498DB" "#e0e0e0"])
 '(ansi-term-color-vector
   [unspecified "#2C3E50" "#E74C3C" "#2ECC71" "#F1C40F" "#3498DB" "#9B59B6" "#3498DB" "#e0e0e0"])
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length -1)
 '(custom-enabled-themes (quote (base16-monokai-dark)))
 '(custom-safe-themes
   (quote
    ("368334f0e23c9daeb0c8b3df28d7fb366dde5b78aeb12e0ed85206d5caca3d8e" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "6916fa929b497ab630e23f2a4785b3b72ce9877640ae52088c65c00f8897d67f" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "1edf370d2840c0bf4c031a044f3f500731b41a3fd96b02e4c257522c7457882e" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "7e346cf2cb6a8324930c9f07ce050e9b7dfae5a315cd8ed3af6bcc94343f8402" "b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "39e93a10eb292941640adfe28509e0c3eeb84e30cbfed6ef9841be136081ca34" default)))
 '(magit-commit-arguments (quote ("--signoff")))
 '(zeal-at-point-mode-alist
   (quote
    ((actionscript-mode . "actionscript")
     (arduino-mode . "arduino")
     (c++-mode . "c++")
     (c-mode . "c")
     (clojure-mode . "clojure")
     (coffee-mode . "coffee")
     (lisp-mode . "lisp")
     (cperl-mode . "perl")
     (css-mode . "css")
     (elixir-mode . "elixir")
     (emacs-lisp-mode . "emacs lisp")
     (enh-ruby-mode . "ruby")
     (erlang-mode . "erlang")
     (gfm-mode . "markdown")
     (go-mode . "go")
     (groovy-mode . "groovy")
     (haskell-mode . "haskell")
     (html-mode . "html")
     (java-mode . "java")
     (js2-mode . "javascript")
     (js3-mode . "nodejs")
     (less-css-mode . "less")
     (lua-mode . "lua")
     (markdown-mode . "markdown")
     (objc-mode . "iphoneos")
     (perl-mode . "perl")
     (php-mode . "php")
     (processing-mode . "processing")
     (puppet-mode . "puppet")
     (python-mode . "python")
     (ruby-mode . "ruby")
     (rust-mode . "rust")
     (sass-mode . "sass")
     (scala-mode . "scala")
     (tcl-mode . "tcl")
     (vim-mode . "vim")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
