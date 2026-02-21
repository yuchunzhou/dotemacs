;;-*- lexical-binding: t; -*-

(use-package helpful
  :bind (:map emacs-lisp-mode-map
			  ("C-h f" . helpful-callable)
			  ("C-h k" . helpful-key)
			  ("C-h p" . helpful-at-point)
			  ("C-h v" . helpful-variable)
			  ("C-h x" . helpful-command)))
