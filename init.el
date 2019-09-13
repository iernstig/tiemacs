;; Emacs configuration file
;; Basically bootstrap use-package and load other configuration files

;; add scripts to load path
(add-to-list 'load-path "~/.emacs.d/config")
(load "settings") ;; for setting variables and functions inherent to emacs
(load "packages") ;; settings for all external packages
(load "keybindings") ;; all keybinding settings
(load "appearance")
(load "mode-configuration")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-bullets projectile which-key use-package solarized-theme one-themes general evil dracula-theme doom-modeline counsel atom-one-dark-theme ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
