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

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ido
(require 'flx-ido)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Ace
(global-set-key (kbd "M-o") 'ace-window)

;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Projectile
(projectile-global-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-enable-current-element-highlight t)
(defun custom-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2))
(add-hook 'web-mode-hook 'custom-web-mode-hook)
(add-hook 'web-mode-hook 'company-mode)

;; Prettier
(require 'prettier-js)
(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

;; JS
(add-hook 'web-mode-hook 'tern-mode)

;; Python
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'company-mode)

(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 79)))

;; Company
(require 'company)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-anaconda)

;; Yasnippet
(require 'yasnippet)
(yas-reload-all)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(initial-buffer-choice (quote magit-list-repositories))
 '(js-indent-level 2)
 '(magit-pull-arguments nil)
 '(magit-repository-directories (quote (("~/projects" . 1))))
 '(magit-submodule-arguments nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets add-node-modules-path smartparens ace-window prettier-js haskell-mode nginx-mode company-anaconda column-marker anaconda-mode dockerfile-mode markdown-mode yaml-mode projectile smex yasnippet company company-tern magit tern web-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
