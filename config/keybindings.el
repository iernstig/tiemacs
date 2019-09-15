(general-define-key
 :keymaps '(normal visual insert emacs motion)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "" nil

 ;;simple command
 "TAB" '(switch-to-other-buffer :which-key "prev buffer")
 "SPC" '(avy-goto-word-or-subword-1 :which-key "go to char")


 ;; create a new prefix (using :ignore t)
 "a" '(:ignore t :which-key "Applications")
 "ad" 'dired

 ":" '(counsel-M-x :which-key "M-x")
 "." '(find-file :which-key "Find file")

 ;; Restart commands
 "q" '(:ignore t :which-key "Quit")
 "qr" '(restart-emacs :which-key "Restart Emacs")
 "qq" '(save-buffers-kill-emacs :which-key "Quit n' save buffers")

 ;; commenting commands
 "c" '(comment-region :which-key "Comment region")

 ;; Buffer management
 "b" '(:ignore t :which-key "Buffer")
 "bb" '(counsel-switch-buffer :which-key "Switch to another buffer")
 "bk" '(kill-current-buffer :which-key "kill current buffer")
 "bx" '(kill-buffer-and-window :which-key "kill current buffer and window")
 "bp" '(previous-buffer :which-key "switch back to prev buffer")

 ;; Window navigation and splits
 "w" '(:ignore t :which-key "Window")
 "ws" '(evil-window-split :which-key "split window horizontally")
 "wv" '(evil-window-vsplit :which-key "split window vertically")
 "wl" '(evil-window-right :which-key "navigate to window, right")
 "wh" '(evil-window-left :which-key "navigate to window, left")
 "wj" '(evil-window-down :which-key "navigate to window, down")
 "wk" '(evil-window-up :which-key "navigate to window, up")
 "wq" '(evil-window-delete :which-key "delete current window")
 "wx" '(kill-buffer-and-window :which-key "kill current buffer and window")

 "g" '(:ignore t :which-key "MaGit")
 "gg" '(magit-status :which-key "Status")

 ;; org-mode, temporary!
 "m" '(:ignore t :which-key "Org-mode")
 "mt" '(org-todo :which-key "todo")

 ;; p: projects
 "p" '(projectile-command-map :package projectile :which-key "projectile command map")

 ;; o: open
 "o" '(:ignore t :which-key "Treemacs")
 "ot" '(treemacs :which-key "Toggle Treemacs")
 "t?" '(treemacs-helpful-hydra :which-key "Helpful Hydra")

 ;; centaur tabs
 "t" '(:ignore t :which-key "Centaur tabs")
 "tn" '(centaur-tabs-forward :which-key "next tab")
 "tt" '(centaur-tabs-backward :which-key "prev-tab")
 )

 
