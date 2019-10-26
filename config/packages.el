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

;; * Packages for editor navigation
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

;; * LSP
;; stolen some config from Zamansky
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-auto-guess-root nil)
  (lsp-prefer-flymake nil) ; Use flycheck instead of flymake
  :bind (:map lsp-mode-map ("C-c C-f" . lsp-format-buffer))
  :hook ((python-mode c-mode c++-mode) . lsp))
(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit t)
  ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))
(use-package dap-mode :ensure t)

;; * Python
;; install with "pip install --user 'python-language-server[all]'"
;; adding the default pyls path here
(add-to-list 'exec-path "~/.local/bin/")
;; * C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))
;; * AutoComplete
(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)

(add-hook 'after-init-hook 'global-company-mode)

;; rebind auto complete scrolling to C-n C-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
  (define-key company-active-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1))))
;; (use-package company-lsp
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'company
;;     (add-to-list 'company-backends 'company-lsp)))
;; (use-package company-cmake
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'company
;;     (add-to-list 'company-backends 'company-cmake)))
;; (use-package company-c-headers
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'company
;;     (add-to-list 'company-backends 'company-c-headers)))
;; * Projectile
(use-package projectile :ensure t) ;; project management
(projectile-mode 1)
;; * Highlighting
(use-package flycheck :ensure t
  :init (global-flycheck-mode)
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
;; * Version control
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

;; * Snippets 
(use-package yasnippet :ensure t)
(yas-global-mode 1)

;; * Misc useful functions
(use-package restart-emacs :ensure t) ;; simple restart of emacs
(use-package aggressive-indent :ensure t)
(add-hook 'prog-mode-hook #'aggressive-indent-mode)
;;(use-package desktop+ :ensure t)
;;(use-package anzu :ensure t) 
