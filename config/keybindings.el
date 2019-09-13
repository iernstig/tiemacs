(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"

 ;;simple command
 "TAB" '(switch-to-other-buffer :which-key "prev buffer")
 "SPC" '(avy-goto-word-or-subword-1 :which-key "go to char")

 ;; create a new prefix (using :ignore t)
 "a" '(:ignore t :which-key "Applications")
 "ad" 'dired

 ":" '(execute-extended-command :which-key "M-x")
 "." '(find-file :which-key "Find file")
 

 ;; Buffer management
 "b" '(:ignore t :which-key "Buffer")
 "bb" '(counsel-switch-buffer :which-key "Switch to another buffer")
 "bk" '(kill-current-buffer :which-key "kill current buffer")
 "bx" '(kill-buffer-and-window :which-key "kill current buffer and window")

 ;; Window navigation and splits
 "w" '(:ignore t :which-key "Window")
 "ws" '(evil-window-split :which-key "split window horizontally")
 "w-" '(evil-window-vsplit :which-key "split window vertically")
 "wl" '(evil-window-right :which-key "navigate to window, right")
 "wh" '(evil-window-left :which-key "navigate to window, left")
 "wj" '(evil-window-down :which-key "navigate to window, down")
 "wk" '(evil-window-up :which-key "navigate to window, up")
 "wq" '(evil-window-delete :which-key "delete current window")
 "wx" '(kill-buffer-and-window :which-key "kill current buffer and window")

 ;; org-mode
 "o" '(:ignore t :which-key "Org-mode")
 "ot" '(org-todo :which-key "todo")
 )
