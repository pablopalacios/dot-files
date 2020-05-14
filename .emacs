;; Global settings
(blink-cursor-mode 0)
(column-number-mode t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)
(tooltip-mode 0)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fset 'yes-or-no-p 'y-or-n-p)
(load-theme 'deeper-blue)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq gc-cons-threshold 20000000)
(setq-default indent-tabs-mode nil)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; use-package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; Some missing emacs modes
(use-package dockerfile-mode)
(use-package haskell-mode)
(use-package yaml-mode)

;; Emacs wise completions
(use-package smex
  :bind ("M-x" . smex))

(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

;; Project wise operations (open, find, replace, etc...)
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1)
  (setq projectile-use-git-grep t))

;; Git Integration
(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-repository-directories (quote (("~/projects" . 1))))
  (setq initial-buffer-choice (quote magit-list-repositories))
  (with-eval-after-load 'transient (transient-bind-q-to-quit)))

;; Code Snippets
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets))

;; Code Completions
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (use-package company-anaconda
    :config
    (add-to-list 'company-backends 'company-anaconda)))

;; JavaScript
(use-package rjsx-mode
  :mode "\\.js[x]?\\'"
  :config
  (use-package add-node-modules-path
    :hook rjsx-mode)
  (use-package prettier-js
    :hook (rjsx-mode . prettier-js-mode))
  (use-package lsp-mode
    :hook (rjsx-mode . lsp)
    :config
    (setq lsp-diagnostic-package :none)
    (setq lsp-eldoc-enable-hover nil)
    (setq lsp-enable-folding nil)
    (setq lsp-enable-indentation nil)
    (setq lsp-enable-on-type-formatting nil)
    (setq lsp-enable-snippet nil)
    (setq lsp-enable-text-document-color nil)
    (setq lsp-flycheck-live-reporting nil)))

;; Python
(use-package python
  :config
  (use-package anaconda-mode
    :hook ((python-mode)
           (python-mode . anaconda-eldoc-mode)))
  (use-package blacken
    :hook (python-mode . blacken-mode))
  (use-package isortify
    :hook (python-mode . isortify-mode)))
