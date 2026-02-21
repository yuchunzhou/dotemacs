;;-*- lexical-binding: t; -*-

(require 'make-mode)

(add-hook 'makefile-gmake-mode-hook
		  (lambda ()
			(indent-tabs-mode)
			(add-to-list 'lsp-language-id-configuration
						 '(makefile-gmake-mode . "Makefile"))
			(lsp-deferred)))

(define-key makefile-gmake-mode-map
			(kbd "M-\\")
			(lambda ()
			  (interactive)
			  (save-buffer)
			  (display-message-or-buffer
			   (shell-command-to-string
				(format "mbake format %s" (buffer-file-name))))
			  (revert-buffer t t t)))
