(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

;; auto break lines at 80
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))

(defun outshine-heading-and-todo ()
  (interactive)
  (progn (insert ";;; ")
	 (beginning-of-line)
	 (outshine-todo)
	 (end-of-line)
	 (insert " ")
	 (end-of-line)
	 ))

