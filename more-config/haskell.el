;;-*- lexical-binding: t; -*-

(use-package haskell-mode
  :bind (:map haskell-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (save-buffer)
				 (display-message-or-buffer
				  (shell-command-to-string
				   (format "ormolu --mode=inplace %s" (buffer-file-name))))
				 (revert-buffer t t t)))))

(use-package lsp-haskell :hook (haskell-mode . lsp-deferred))
