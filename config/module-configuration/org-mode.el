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

;;; Set org-priorities
(setq org-lowest-priority ?G)
;;; Setup archiving
(setq org-archive-location 
      (concat "~/notes/archives/"
	      (format-time-string "%Y-%m" (current-time)) "-%s::* " (format-time-string "%Y-%m-%d" (current-time))))
	      
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
      '(("t" "Unfiled todo" entry (file+headline "~/notes/todo.org" "Tasks")
	 "* TODO %?\n%U") ;; :empty-lines 1
	("T" "Unfiled todo with Clipboard" entry (file "~/notes/todo.org")
	 "* TODO %?\n%U\n   %c\n")
	("m" "Money related todo" entry (file+headline "~/notes/money.org" "Tasks")
	 "* TODO %?\n%U\n   %c\n")
	("p" "Project-idea " entry (file+headline "~/notes/project-ideas.org" "Ideas")
	 "* %?\n%U\n   %c\n")
	("u" "Upkeep/Maintenance todo" entry (file+headline "~/notes/upkeep.org" "Tasks")
	 "* TODO %?\n%U\n   %c\n")
	("w" "Work related todo" entry (file+headline "~/notes/work.org" "Tasks")
	 "* TODO %?\n%U\n   %c\n")
	("P" "Personal development idea" entry (file+headline "~/notes/personal-devel-dump.org" "Ideas")
	 "* %?\n%U\n   %c\n"))
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
;;; Restart org for changes to take effect
(org-mode-restart)

;;; Flycheck compilation settings
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
