
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

(use-package general :ensure t
	     :config
	     (general-define-key "C-'" 'avy-goto-word-1))

(use-package avy :ensure t
	     :commands (avy-goto-word-1))

(use-package ivy :ensure t)
(use-package counsel :ensure t)
(use-package swiper :ensure t)

(use-package evil :ensure t) ;; for awesome navigation 
(use-package which-key :ensure t)


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
