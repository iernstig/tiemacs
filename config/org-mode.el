(use-package org-bullets :ensure t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))
