;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with SPC . and enter text in its buffer.

(dolist (item all-the-icons-icon-alist)
  (let* ((extension (car item))
         (icon (apply (cdr item))))
    (ht-set! treemacs-icons-hash 
             (s-replace-all '(("\\" . "") ("$" . "") ("." . "")) extension)
             (concat icon " "))))

(use-package doom-themes :ensure t)
(doom-themes-treemacs-config)
(setq which-key-maximum-display-columns 3)
(which-key-mode 1)
