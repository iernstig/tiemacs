;; * Remove emacs vanilla ugly GUI
;; remove menus from visibility
(menu-bar-mode -1)
;; * tell emacs we never want scroll bars
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))
(tool-bar-mode -1)
;; * remove titlebar text
(setq frame-title-format nil) 

;; * Display line numbers, of course!
(global-display-line-numbers-mode) 

;; * set font, adjust size according to screen size
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
;; ** Theme
(use-package doom-themes :ensure t)
(doom-themes-treemacs-config)
(load-theme 'doom-city-lights t)
(setq-default left-fringe-width  10)
(set-face-attribute 'fringe nil :background nil)
;; red: "#D95468"
(set-face-background 'line-number-current-line nil) 
;; cleaner background for line indicator
(set-face-foreground 'line-number-current-line "DeepBlueSky") 
(set-face-background 'org-level-1 nil) ;; set background to none, org-mode

;; ** Modeline
(use-package doom-modeline :ensure t)
(require 'doom-modeline)
(doom-modeline-mode 1)
(let ((line (face-attribute 'mode-line :underline)))
  (set-face-attribute 'mode-line          nil :overline   line)
  (set-face-attribute 'mode-line-inactive nil :overline   line)
  (set-face-attribute 'mode-line-inactive nil :underline  line)
  (set-face-attribute 'mode-line          nil :box        nil)
  (set-face-attribute 'mode-line-inactive nil :box        nil))
;; ** Center text, mainly
(use-package sublimity :ensure t)
(require 'sublimity-attractive)

;; ** More eye-candy sublime-text-like
;;(sublimity-attractive-hide-vertical-border)
(sublimity-attractive-hide-fringes)
(setq sublimity-attractive-centering-width 120)
(sublimity-mode 1)

;; ** Rainbow mode, easier paren reading
(use-package rainbow-delimiters :ensure t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ** Visual Regexp
(use-package visual-regexp-steroids :ensure t)

;; ** Color code variables
(use-package color-identifiers-mode :ensure t)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; ** Beacon
(use-package beacon :ensure t) ;; for showing the cursor in new buffers
(beacon-mode 1)

;;; Flycheck compilation settings
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
