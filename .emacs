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

;; helpers
(defun enable-minor-mode (my-pair)
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(with-eval-after-load 'transient
  (transient-bind-q-to-quit))

;; Projectile
(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Company
(require 'company)

;; web-mode
(require 'web-mode)
(require 'prettier-js)
(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'(lambda () (enable-minor-mode '("\\.js[x]?\\'" . prettier-js-mode))))))
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
(add-hook 'web-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)

;; Python
(require 'python)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'isortify-mode)
(add-hook 'python-mode-hook 'blacken-mode)
(add-to-list 'python-shell-extra-pythonpaths "~/projects/bluepoint")
(add-to-list 'company-backends 'company-anaconda)

;; Yasnippet
(require 'yasnippet)
(yas-reload-all)

;; React
(defun component-name()
  (interactive)
  (insert (car (split-string (buffer-name) "\\."))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-idle-delay 0.1)
 '(custom-enabled-themes (quote (adwaita)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(initial-buffer-choice (quote magit-list-repositories))
 '(js-indent-level 2)
 '(magit-pull-arguments nil)
 '(magit-repository-directories (quote (("~/projects" . 1))))
 '(magit-submodule-arguments nil)
 '(package-selected-packages
   (quote
    (isortify haskell-mode blacken company-anaconda anaconda-mode add-node-modules-path base16-theme elpy prettier-js markdown-mode php-mode dockerfile-mode yaml-mode yasnippet-snippets projectile smex yasnippet company company-tern magit tern web-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
