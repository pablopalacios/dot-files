(blink-cursor-mode 0)
(column-number-mode t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)
(tooltip-mode 0)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

(setq gc-cons-threshold 20000000)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(eval-when-compile (require 'use-package))

(setq use-package-always-ensure t)

(use-package add-node-modules-path)
(use-package anaconda-mode)
(use-package blacken)
(use-package dockerfile-mode)
(use-package haskell-mode)
(use-package isortify)
(use-package prettier-js)
(use-package tern)
(use-package yasnippet-snippets)

(use-package magit
  :bind ("C-x g" . magit-status)
  :custom
  (initial-buffer-choice (quote magit-list-repositories))
  (magit-pull-arguments nil)
  (magit-repository-directories (quote (("~/projects" . 1))))
  (magit-submodule-arguments nil))

(use-package smex
  :bind ("M-x" . smex))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  :custom
  (ido-enable-flex-matching t)
  (ido-use-faces nil))

(use-package company
  :config
  (global-company-mode 1)
  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1))

(use-package company-tern
  :config
  (push 'company-tern company-backends))

(use-package company-anaconda
  :config
  (push 'company-anaconda company-backends))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yaml-mode
  :init
  (add-hook 'yaml-mode-hook 'prettier-js-mode))

(use-package python
  :init
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'blacken-mode)
  (add-hook 'python-mode-hook 'isortify-mode))

(use-package web-mode
  :init
  (add-hook 'web-mode-hook 'add-node-modules-path)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'tern-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
  :custom
  (web-mode-attr-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (web-mode-enable-current-element-highlight t)
  (web-mode-engines-alist '(("django" . "\\.html\\'")))
  )

(custom-set-variables
 '(package-selected-packages
   (quote
    (web-mode yasnippet-snippets dockerfile-mode prettier-js
    prettier-js-mode yaml-mode company-anaconda company-tern
    company flx-ido projectile use-package smex magit))))
(custom-set-faces)
