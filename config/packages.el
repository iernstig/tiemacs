(use-package general :ensure t
	     :config
	     (general-define-key "C-'" 'avy-goto-word-1))

(use-package avy :ensure t
	     :commands (avy-goto-word-1))

(use-package ivy :ensure t)
(use-package counsel :ensure t)
(use-package swiper :ensure t)
(use-package evil :ensure t)
(use-package which-key :ensure t)

(require 'ivy)
(ivy-mode)


(require 'use-package)
(require 'evil)
(evil-mode 1)

(require 'which-key)
(which-key-mode)
