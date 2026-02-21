;;-*- lexical-binding: t; -*-

(use-package python-mode
  :straight (:protocol https)
  :bind (:map python-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (save-buffer)
				 (display-message-or-buffer
				  (shell-command-to-string
				   (format "autoflake --remove-all-unused-imports --in-place %s"
						   (buffer-file-name))))
				 (revert-buffer t t t)
				 (python-isort-buffer)
				 (blacken-buffer)))))

(use-package lsp-pyright
  :custom (lsp-pyright-prefer-remote-env nil)
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp-deferred))))

(use-package python-isort
  :config (fishman/save-current-buffer-around 'python-isort-buffer))

(use-package blacken
  :config (fishman/save-current-buffer-around 'blacken-buffer))
