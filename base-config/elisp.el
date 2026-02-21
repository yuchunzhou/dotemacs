;;-*- lexical-binding: t; -*-

(use-package paredit :hook (emacs-lisp-mode . paredit-mode))

(use-package emr
  :bind (:map emacs-lisp-mode-map ("C-c C-r" . emr-show-refactor-menu)))

(use-package macrostep
  :bind (:map emacs-lisp-mode-map
			  ("M-o" . macrostep-expand)
			  ("M-i" . macrostep-collapse)))

(use-package elfmt
  :straight (:host github :repo "riscy/elfmt")
  :bind (:map emacs-lisp-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (elfmt-buffer)
				 (message "buffer is formatted"))))
  :config (fishman/save-current-buffer-around 'elfmt-buffer))

(use-package gcmh :straight (:protocol https) :config (gcmh-mode))
