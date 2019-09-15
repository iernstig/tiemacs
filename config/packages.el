;; --------------------------------------------------
;;           general package definition
;;           and bootstrap of use-package
;; --------------------------------------------------

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
;; --------------------------------------------------
;;            Bootstrap 'use-package'
;; --------------------------------------------------

(unless (package-installed-p 'use-package) ;; unless it is already installed
  (package-refresh-contents) ;; update packages archive
  (package-install 'use-package)) ;; install the most recent version of use-package

;; --------------------------------------------------
;;           Packages installation list 
;; --------------------------------------------------

;; for keybindings
(use-package general :ensure t) 
;; Jump to things, not currently used though
(use-package avy :ensure t) 
(use-package ivy :ensure t) ;; lightweight emacs vanilla enhancements
(use-package counsel :ensure t) ;; addon for ivy
(use-package swiper :ensure t) ;; addon for ivy
(use-package evil :ensure t)  ;; essential bindings for buffer nav
(use-package which-key :ensure t) ;; describe keybingings

(use-package projectile :ensure t) ;; project management

(use-package lsp-mode :ensure t) ;; for intelligent code analysis, debugging etc.
(use-package lsp-ui :ensure t)

(use-package magit :ensure t)

(use-package yasnippet :ensure t)

(use-package treemacs :ensure t) ;; tree like file view
(use-package lsp-treemacs :ensure t)
(use-package treemacs-evil :ensure t)
(use-package treemacs-magit :ensure t)
(use-package treemacs-projectile :ensure t)

(use-package dashboard :ensure t ;; start dashboard 
  :config
  (dashboard-setup-startup-hook))
(use-package beacon :ensure t) ;; for showing the cursor in new buffers
(use-package restart-emacs :ensure t) ;; simple restart of emacs
(use-package smex :ensure t)
(use-package hungry-delete :ensure t) ;; delete needless space in files
;;(use-package desktop+ :ensure t)
;;(use-package anzu :ensure t)


;; --------------------------------------------------
;;           Enable all the packages
;; --------------------------------------------------

(require 'smex)
(smex-initialize)
(require 'use-package)
(require 'ivy)
(ivy-mode)
(require 'evil)
(evil-mode 1)
(require 'which-key)
(which-key-mode)
(require 'projectile)
(projectile-mode +1)
(require 'beacon)
(beacon-mode 1)
(require 'lsp-mode)
(global-hungry-delete-mode)
(require 'yasnippet)
(yas-global-mode 1)


;; --------------------------------------------------
;;           Package configuration section
;; --------------------------------------------------

;; dashboard
(setq dashboard-banner-logo-title "Welcome to TieMacs")
(setq dashboard-items '((recents .5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))

