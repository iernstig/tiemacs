;; * Remove emacs vanilla ugly GUI
;;  remove menus from visibility
(menu-bar-mode -1)
;; tell emacs we never want scroll bars
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))
(tool-bar-mode -1)
;; remove titlebar text
(setq frame-title-format nil) 

;; Display line numbers, of course!
(global-display-line-numbers-mode) 

;; set font, adjust size according to screen size
(defun set-font (fontname fontsize)
  (set-face-attribute 'default nil :font
		      (format "%s:pixelsize=%d" fontname fontsize)))

(when window-system
  (if (> (x-display-pixel-width) 2000)
	 (set-font "Fira Code" 18)
	 (set-font "Fira Code" 12)))

;; ---------------------------------------- 
;; * Appearance packages
;; ---------------------------------------- 

;; ** Load icons
(use-package all-the-icons :ensure t)
;; ** Modeline
(use-package doom-modeline :ensure t)
(require 'doom-modeline)
(doom-modeline-mode 1)
;; ** Theme
(use-package doom-themes :ensure t)
(doom-themes-treemacs-config)
(load-theme 'doom-solarized-dark t)

;; ** Center text, mainly
(use-package sublimity :ensure t)
(require 'sublimity-attractive)

;; ** More eye-candy sublime-text-like
;;(sublimity-attractive-hide-vertical-border)
(sublimity-attractive-hide-fringes)
(setq sublimity-attractive-centering-width 120)
(require 'sublimity-scroll)
(setq sublimity-scroll-weight 100
      sublimity-scroll-drift-lenght 100)
(sublimity-mode 1)


;; ** Rainbow mode, easier paren reading
(use-package rainbow-delimiters :ensure t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ** Visual Regexp
(use-package visual-regexp-steroids :ensure t)

;; ** Tabs
(use-package centaur-tabs :ensure t
  :config
  (setq centaur-tabs-set-icons t
	centaur-tabs-style "bar"
	centaur-tabs-set-bar 'left
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-modified-marker t
	centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-buffer-groups)
  )


;; ** Color code variables
(use-package color-identifiers-mode :ensure t)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; ** Dashboard
(use-package dashboard :ensure t ;; start dashboard 
  :config
  (dashboard-setup-startup-hook))
;; dashboard
(setq dashboard-banner-logo-title "Welcome to TieMacs")
(setq dashboard-items '((recents .5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))
;; ** Beacon
(use-package beacon :ensure t) ;; for showing the cursor in new buffers
(beacon-mode 1)
