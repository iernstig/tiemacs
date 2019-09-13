
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

(use-package general :ensure t)
(use-package avy :ensure t)
(use-package ivy :ensure t)
(use-package counsel :ensure t)
(use-package swiper :ensure t)
(use-package evil :ensure t) 
(use-package which-key :ensure t)
(use-package projectile :ensure t)
(use-package lsp-mode :ensure t)
(use-package dashboard :ensure t
  :config
  (dashboard-setup-startup-hook))
(use-package beacon :ensure t)


;; --------------------------------------------------
;;           Enable all the packages
;; --------------------------------------------------

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
(setq dashboard-center-content t)
