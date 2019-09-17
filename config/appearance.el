;; remove menus from visibility
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
;;         Appearance packages  
;; ---------------------------------------- 

;; load icons
(use-package all-the-icons :ensure t)
;; modeline
(use-package doom-modeline :ensure t)
(require 'doom-modeline)
(doom-modeline-mode 1)
;; and theme
;; (use-package atom-one-dark-theme :ensure t) 
;; (load-theme 'atom-one-dark t) 

(use-package doom-themes :ensure t)
(load-theme 'doom-solarized-dark t)

(use-package sublimity :ensure t)
(require 'sublimity-attractive)

;;(sublimity-attractive-hide-vertical-border)
(sublimity-attractive-hide-fringes)
(setq sublimity-attractive-centering-width 120)
(require 'sublimity-scroll)
(setq sublimity-scroll-weight 100
      sublimity-scroll-drift-lenght 100)
(sublimity-mode 1)

;; for colors, html etc.
(use-package rainbow-mode :ensure t)
(rainbow-mode +1)

;; enable easier parenthesis reading
(use-package rainbow-delimiters :ensure t)
    (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

;; easier visuals from searching
(use-package visual-regexp-steroids :ensure t)

;; for pretty side bars!
(use-package solaire-mode :ensure t)

;; fancy tabs to be aware of started buffers! 
(use-package centaur-tabs :ensure t)
(require 'centaur-tabs)
(centaur-tabs-mode 1)
(setq centaur-tabs-set-icons t)
(centaur-tabs-headline-match)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-bar 'left)
(centaur-tabs-group-by-projectile-project)


;; for easier spotting of variables
(use-package color-identifiers-mode :ensure t)
(color-identifiers-mode t)
