;; * General package definition, configuration
;; ------------------------------------------------------------

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
;; ------------------------------------------------------------
;; * Bootstrap 'use-package'
;; ------------------------------------------------------------

(unless (package-installed-p 'use-package) ;; unless it is already installed
  (package-refresh-contents) ;; update packages archive
  (package-install 'use-package)) ;; install the most recent version of use-package

;; ------------------------------------------------------------
;; * Install Quelpa-use-package
;; ------------------------------------------------------------
(use-package quelpa-use-package :ensure t)

;; ------------------------------------------------------------
;; * Refresh package contents
(when (not package-archive-contents)
  (package-refresh-contents))
;; * Enable outshine mode in all programming buffers
;; ------------------------------------------------------------
(use-package outshine
  :quelpa (outshine :fetcher github :repo "alphapapa/outshine"))

(add-hook 'prog-mode-hook 'outshine-mode) ;; enable for all programming languages
;; ugly hack to override default evil bind for elisp
(define-key emacs-lisp-mode-map (kbd "<tab>") 'org-cycle)
(use-package pretty-outlines
  :hook ((outline-mode       . pretty-outlines-set-display-table)
         (outline-minor-mode . pretty-outlines-set-display-table)
         (emacs-lisp-mode . pretty-outlines-add-bullets)
         (python-mode     . pretty-outlines-add-bullets)))
(defvar pretty-outline-bullets-bullet-list '("◉" "○" "✸" "✿"))
;; ------------------------------------------------------------
;; * Install and enable packages
;; ** Packages for editor navigation
(use-package general :ensure t)
;; Jump to things, not currently used though
(use-package avy :ensure t)
(use-package ivy :ensure t) ;; lightweight emacs vanilla enhancements
(ivy-mode)
(use-package smex :ensure t)
(smex-initialize)
(use-package counsel :ensure t) ;; addon for ivy
(use-package swiper :ensure t) ;; addon for ivy
(use-package evil :ensure t)  ;; essential bindings for buffer nav
(evil-mode 1)
(use-package which-key :ensure t
  :config
  (setq which-key-idle-delay 0.2)) ;; describe keybingings
(which-key-mode)
(use-package projectile :ensure t) ;; project management
(projectile-mode 1)
;; *** Flycheck
(use-package flycheck :ensure t
  :init (global-flycheck-mode)
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
(use-package lsp-mode :ensure t) ;; for intelligent code analysis, debugging etc.
(use-package lsp-ui :ensure t)

;; ** Version control
(use-package magit :ensure t)
(use-package evil-magit :ensure t)
(use-package diff-hl :ensure t) ; highlight diffs 
(global-diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(use-package treemacs :ensure t) ;; tree like file view
(use-package lsp-treemacs :ensure t)
(use-package treemacs-evil :ensure t)
(use-package treemacs-magit :ensure t)
(use-package treemacs-projectile :ensure t)

;; ** Snippets 
(use-package yasnippet :ensure t)
(yas-global-mode 1)

;; ** Misc useful functions
(use-package restart-emacs :ensure t) ;; simple restart of emacs
(use-package aggressive-indent :ensure t)
(add-hook 'prog-mode-hook #'aggressive-indent-mode)
;;(use-package desktop+ :ensure t)
;;(use-package anzu :ensure t) 
