(set-frame-font "Fira Code 10" nil t) ;; set the font
;; load icons, modeline and theme 
(use-package all-the-icons :ensure t)
(use-package doom-modeline :ensure t)
(use-package atom-one-dark-theme :ensure t) 

(load-theme 'atom-one-dark t) 
(global-display-line-numbers-mode) 
;; remove titlebar text
(setq frame-title-format nil) 










