
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

(use-package general :ensure t) ;; for keybindings
(use-package avy :ensure t) ;; Jump to things, not currently used though
(use-package ivy :ensure t) ;; lightweight emacs vanilla enhancements
(use-package counsel :ensure t) ;; addon for ivy
(use-package swiper :ensure t) ;; addon for ivy
(use-package evil :ensure t)  ;; essential bindings for buffer nav
(use-package which-key :ensure t) ;; describe keybingings
(use-package projectile :ensure t) ;; project management
(use-package doom-modeline :ensure t) ;; fancy, lightweight modeline
(use-package lsp-mode :ensure t) ;; for intelligent code analysis, debugging etc.
(use-package dashboard :ensure t ;; start dashboard 
  :config
  (dashboard-setup-startup-hook))
(use-package beacon :ensure t) ;; for showing the cursor in new buffers
(use-package restart-emacs :ensure t) ;; simple restart of emacs
(use-package smex :ensure t)
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
(require 'doom-modeline)
(doom-modeline-mode 1)
(require 'projectile)
(projectile-mode +1)
(require 'beacon)
(beacon-mode 1)




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

