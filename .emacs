;; Basics
(blink-cursor-mode 0)
(column-number-mode t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tooltip-mode 0)
(tool-bar-mode 0)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; remove trailing spaces before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Font
(add-to-list 'default-frame-alist
             '(font . "-adobe-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))


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


;; Company
(eval-after-load "company"
  '(progn (add-to-list 'company-backends 'company-anaconda)))
(eval-after-load "company"
  '(progn (add-to-list 'company-backends 'company-go)))
(setq-default company-idle-delay 0.2)
(setq-default company-minimum-prefix-length -1)


;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun custom-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
)
(add-hook 'web-mode-hook 'custom-web-mode-hook)


;; LANGUAGES


;; Go
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; JS
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'tern-mode)


;; Python
(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 79)))
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'company-mode)


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
 '(company-backends
   (quote
    (company-tern company-go company-anaconda company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length -1)
 '(custom-enabled-themes (quote (base16-monokai-dark)))
 '(custom-safe-themes
   (quote
    ("368334f0e23c9daeb0c8b3df28d7fb366dde5b78aeb12e0ed85206d5caca3d8e" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "6916fa929b497ab630e23f2a4785b3b72ce9877640ae52088c65c00f8897d67f" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "1edf370d2840c0bf4c031a044f3f500731b41a3fd96b02e4c257522c7457882e" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "7e346cf2cb6a8324930c9f07ce050e9b7dfae5a315cd8ed3af6bcc94343f8402" "b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "39e93a10eb292941640adfe28509e0c3eeb84e30cbfed6ef9841be136081ca34" default)))
 '(js-indent-level 2)
 '(magit-commit-arguments (quote ("--signoff")))
 '(package-selected-packages
   (quote
    (js2-mode company-tern tern groovy-mode company-go go-eldoc go-snippets golint go-mode yaml-mode toml-mode python-mode xclip column-marker elm-mode sx engine-mode zeal-at-point yasnippet web-mode term+ projectile magit-gerrit haskell-mode company-anaconda base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
