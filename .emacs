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

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Projectile
(projectile-global-mode)

;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(setq web-mode-enable-current-element-highlight t)

(defun custom-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
)
(add-hook 'web-mode-hook 'custom-web-mode-hook)
(add-hook 'web-mode-hook 'company-mode)

;; Company
(require 'company)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-anaconda)

;; JS
(add-hook 'web-mode-hook 'tern-mode)

;; Python
(add-hook 'python-mode-hook 'anaconda-mode)

;; Org
(require 'ox-md)
(require 'ox-odt)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.2)
 '(magit-commit-arguments (quote ("--signoff")))
 '(package-selected-packages
   (quote
    (company-anaconda anaconda-mode haml-mode yaml-mode scss-mode apib-mode markdown-mode company-tern tern company projectile web-mode haskell-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
