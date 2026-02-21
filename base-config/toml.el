;;-*- lexical-binding: t; -*-

(use-package toml-mode
  :bind (:map toml-mode-map
			  ("C-\\" . smart-comment)
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (save-buffer)
				 (display-message-or-buffer
				  (shell-command-to-string
				   (format "tombi format %s" (buffer-file-name))))
				 (revert-buffer t t t))))
  :hook (toml-mode .
				   (lambda ()
					 (add-to-list
					  (make-local-variable 'lsp-disabled-clients)
					  'taplo)
					 (lsp-deferred))))
