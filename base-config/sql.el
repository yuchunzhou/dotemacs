;;-*- lexical-binding: t; -*-

(require 'sql)

(define-key sql-mode-map
			(kbd "M-\\")
			(lambda ()
			  (interactive)
			  (save-buffer)
			  (display-message-or-buffer
			   (shell-command-to-string
				(format "sqlfluff format %s" (buffer-file-name))))
			  (revert-buffer t t t)))

(add-to-list 'auto-mode-alist '("\\.sqlfluff\\'" . conf-unix-mode))
