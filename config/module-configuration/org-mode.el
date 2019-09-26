;;; Use org-bullets
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

;;; set auto break lines at 80
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; Set org todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PRORGESS(p)" "|" "DONE(d)") 
	(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))

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
      '(("t" "Unfiled todo" entry (file+headline "~/org/todo/todo.org" "Tasks")
	 "* TODO %?\n%U") ;; :empty-lines 1
	("T" "Unfiled todo with Clipboard" entry (file "~/org/todo/todo.org")
	 "* TODO %?\n%U\n   %c")
	("m" "Money related todo" entry+headline (file "~/org/todo/money.org" "Tasks")
	 "* TODO %?\n%U\n   %c")
	("p" "Project-idea " entry+headline (file "~/org/todo/project-ideas.org" "Ideas")
	 "* %?\n%U\n   %c")
	("u" "Upkeep/Maintenance todo" entry+headline (file "~/org/todo/upkeep.org" "Tasks")
	 "* TODO %?\n%U\n   %c")
	("w" "Work related todo" entry+headline (file "~/org/todo/work.org" "Unfiled")
	 "* TODO %?\n%U\n   %c")
	("P" "Personal development though/task" entry+headline (file "~/org/todo/personal-development.org" "Unfiled")))
      )

;; modify the path of the org-capture to accomodate different capture projects


;;; org-journal
(use-package org-journal
  :ensure t
  :defer t
  :custom
  (org-journal-dir "~/journal/"))

(add-hook 'org-journal-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-journal-mode-hook 'turn-on-auto-fill)

;;; Restart org for changes to take effect
(org-mode-restart)

;;; Flycheck compilation settings
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
