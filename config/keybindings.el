(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"

 ;;simple command
 "TAB" '(switch-to-other-buffer :which-key "prev buffer")
 "SPC" '(avy-goto-word-or-subword-1 :which-key "go to char")

 ;; create a new prefix 
 "a" '(:ignore t :which-key "Applications")
 "ad" 'dired

 )
