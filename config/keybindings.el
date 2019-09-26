;;; Leader key config
(general-define-key
 :states '(normal visual insert emacs motion)
 :keymaps 'override
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "" nil

;;;  File navigation and M-x
 ":" '(counsel-M-x :which-key "M-x")
 "." '(find-file :which-key "Find file")

;;; Restart commands
 "q" '(:ignore t :which-key "Quit")
 "qr" '(restart-emacs :which-key "Restart Emacs")
 "qq" '(save-buffers-kill-emacs :which-key "Quit n' save buffers")

;;;  commenting and capture commands
 "c" '(:ignore t :which-key "Comment or capture")
 "cr" '(comment-region :which-key "Comment region")
 "cu" '(uncomment-region :which-key "Uncomment region")
 "cc" '(org-capture :which-key "Org-capture")

;;;  Buffer management
 "b" '(:ignore t :which-key "Buffer")
 "bb" '(counsel-switch-buffer :which-key "Switch to another buffer")
 "bk" '(kill-current-buffer :which-key "kill current buffer")
 "bx" '(kill-buffer-and-window :which-key "kill current buffer and window")
 "bp" '(previous-buffer :which-key "switch back to prev buffer")

;;; Window navigation and splits
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
 "gc" '(magit-commit :which-key "Magit commit") ;; todo: add more of the magit stage commands and learn them
 "gs" '(:ignore t :which-key "magit stage")
 "gsf" '(magit-stage-file :which-key "stage file")
 "gsm" '(magit-stage-modified :which-key "stage modified")

 
;;; Outshine mode
 "n" '(:ignore t "OutShine-Mode")
 "ni" '(outshine-insert-heading :which-key "Insert heading")
 "nn" '(outshine-narrow-to-subtree :which-key "Narrow to subtree at point")
 "nw" '(widen :which-key "Widen")
 "nj" '(outline-move-subtree-down :which-key "Move down subtree")
 "nk" '(outline-move-subtree-up :which-key "Move up subtree")
 "nh" '(outline-promote :which-key "Promote heading")
 "nl" '(outline-demote :which-key "Demote heading")
 "nh" '(outshine-insert-heading :which-key "insert heading")
 "nt" '(outshine-todo :which-key "Todo")
 "nc" '(outshine-cycle-buffer :which-key "Cycle buffer")
 
;;; org-journal-mode
 "j" '(:ignore t "org-journal")
 
;;;  p: projects
 "p" '(projectile-command-map :package projectile :which-key "projectile command map")

;;;  o: open
 "o" '(:ignore t :which-key "Open")
 "ot" '(treemacs :which-key "Toggle Treemacs")
 "o?" '(treemacs-helpful-hydra :which-key "Helpful Hydra")

;;;  centaur tabs
 "t" '(:ignore t :which-key "Centaur tabs")
 "tn" '(centaur-tabs-forward :which-key "next tab")
 "tt" '(centaur-tabs-backward :which-key "prev-tab")
 "tc" '(centaur-tabs-do-close :which-key "close-tab")
;;;  YaSnippet
 ) 

