(set-frame-font "IBM Plex Mono 10" nil t) ;; set the font
(use-package dracula-theme :ensure t) ;; load the theme 
(load-theme 'dracula t) ;; set the theme
(global-display-line-numbers-mode) ;; display line numbers
(add-to-list 'default-frame-alist '(ns-appearance . 'dark))
(setq frame-title-format nil) ;; remove titlebar text










