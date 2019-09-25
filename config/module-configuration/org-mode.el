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
      '(("t" "Todo" entry (file "~/org/todo/refile.org")
	 "* TODO %?\n%U" :empty-lines 1)
	("T" "Todo with Clipboard" entry (file "~/org/todo/refile.org")
	 "* TODO %?\n%U\n   %c" :empty-lines 1)
	("n" "Note" entry (file "~/org/todo/refile.org")
	 "* NOTE %?\n%U" :empty-lines 1)
	("N" "Note with Clipboard" entry (file "~/org/todo/refile.org")
	 "* NOTE %?\n%U\n   %c" :empty-lines 1)
	))
;;; Restart org for changes to take effect
(org-mode-restart)

;;; Flycheck compilation settings
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
