;; Emacs configuration file
;; Basically bootstrap use-package and load other configuration files


;; add scripts to load path
(add-to-list 'load-path "~/.emacs.d/config")
(require 'no-littering)
(load "settings") ;; for setting variables and functions inherent to emacs
(load "packages") ;; settings for all external packages
(load "keybindings") ;; all keybinding settings
(load "appearance")
(load "org-mode")
(load "treemacs")


