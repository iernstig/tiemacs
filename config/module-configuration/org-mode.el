;;; Use org-bullets
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

;;; set auto break lines at 80
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; Set org todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PRORGESS(p)" "WAITING(w)" "|" "DONE(d)" "ABORT(a)") 
	));; (sequence  "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")

;;; Function to convert several headlines to todo.
(defun org-outline-to-TODO ()
  (interactive)
  (if (region-active-p)
      (replace-regexp "^*+" "* TODO" nil (region-beginning) (region-end))
    (replace-regexp "^*+" "* TODO" nil
                    (line-beginning-position)
                    (line-end-position))))

;;; Set org-priorities
(setq org-lowest-priority ?G)
;;; Setup archiving
(setq org-archive-location 
      (concat "~/notes/archives/"
	      (format-time-string "%Y-%m" (current-time)) "-%s::* " (format-time-string "%Y-%m-%d" (current-time))))

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; make sure we save after each archiving action
(defun org-archive-save-buffer ()
  (let ((afile (org-extract-archive-file (org-get-local-archive-location))))
    (if (file-exists-p afile)
	(let ((buffer (find-file-noselect afile)))
	  (if (y-or-n-p (format "Save (%s)" buffer))
	      (with-current-buffer buffer
		(save-buffer))
	    (message "You expressly chose _not_ to save (%s)" buffer)))
      (message "Ooooops ... (%s) does not exist." afile))))
(add-hook 'org-archive-hook 'org-archive-save-buffer)   
;;; Org-agenda configuration
(setq org-agenda-files (list "~/notes/todo.org"))
;;; Outshine insert todo-heading
(defun outshine-insert-todo-heading ()
  (interactive)
  (progn (outshine-insert-heading)
	 (beginning-of-line)
	 (outshine-todo)
	 (end-of-line)
	 (insert " ")
	 (end-of-line)
	 ))

(setq org-log-done 'time) 
(setq org-hierarchical-todo-statistics t)
;;; Org-capture templates
(setq org-capture-templates
      '(("t" "Unfiled todo" entry (file+headline "~/notes/todo.org" "Inbox")
	 "* TODO %?\n%U") ;; :empty-lines 1
	("T" "Unfiled todo with Clipboard" entry (file+headline "~/notes/todo.org" "Inbox")
	 "* TODO %?\n%U\n   %c\n")
	("m" "Money related todo" entry (file+headline "~/notes/todo.org" "Money")
	 "* TODO %?\n%U\n   %c\n")
	("p" "Project-idea " entry (file+headline "~/notes/todo.org" "Project Ideas")
	 "* %?\n%U\n   %c\n")
	("u" "Upkeep/Maintenance todo" entry (file+headline "~/notes/todo.org" "Maintenance")
	 "* TODO %?\n%U\n   %c\n")
	("w" "Work related todo" entry (file+headline "~/notes/todo.org" "Work Tasks")
	 "* TODO %?\n%U\n   %c\n"))
      )


;;; org-journal
(use-package org-journal
  :ensure t
  :defer t
  :custom
  (org-journal-dir "~/journal/"))

(add-hook 'org-journal-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-journal-mode-hook 'turn-on-auto-fill)

;;; Enable org-agenda-mode
;;; org-kanban
(use-package org-kanban :ensure t)
;;; org-pomodoro
;; to easier get started with activities
(setq org-pomodoro-length 10)
;;; Restart org for changes to take effect
(org-mode-restart)

;;; Flycheck compilation settings
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
