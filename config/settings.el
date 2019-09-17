
(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))  ; which directory to put backups file
(setq vc-follow-symlinks t)			       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
    (setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)

(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

;; create auto-save-list directory, sometimes it does not exist for some reason
(unless (file-directory-p "~/.emacs.d/auto-save-list")
  (mkdir "~/.emacs.d/auto-save-list"))

;; set the default dir to user home
(setq default-directory "~/")

;; some differences regarding which operating system in use
;;* TODO 
(cond ((string-equal system-type "windows-nt")
       (message "Microsoft Windows"))
      (string-equal system-type "darwin")
      (message "OS X")
	(string-equal system-type "gnu/linux"))
