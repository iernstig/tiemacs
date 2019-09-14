;; remove menus from visibility
(menu-bar-mode -1)
;; tell emacs we never want scroll bars
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))
(tool-bar-mode -1)

;; set the font
(set-frame-font "Fira Code 10" nil t) 
;; load icons, modeline and theme 
(use-package all-the-icons :ensure t)
(use-package doom-modeline :ensure t)
(use-package atom-one-dark-theme :ensure t) 

(load-theme 'atom-one-dark t) 
(global-display-line-numbers-mode) 
;; remove titlebar text
(setq frame-title-format nil) 









