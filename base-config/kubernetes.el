;;-*- lexical-binding: t; -*-

(use-package dockerfile-mode
  :bind (:map dockerfile-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (save-buffer)
				 (display-message-or-buffer
				  (shell-command-to-string
				   (format "dockerfmt -i 2 -w %s" (buffer-file-name))))
				 (revert-buffer t t t))))
  :hook (dockerfile-mode . lsp-deferred))

(use-package docker-compose-mode
  :bind (:map docker-compose-mode-map ("C-\\" . smart-comment))
  :hook (docker-compose-mode .
							 (lambda ()
							   (setq-local company-backends
										   '(company-capf)))))

(use-package yaml-mode
  :bind (:map yaml-mode-map ("C-\\" . smart-comment))
  :hook (yaml-mode . lsp-deferred))

(use-package yaml-pro
  :config ; nofmt
  (general-define-key :keymaps 'yaml-mode-map "C-k" 'yaml-pro-ts-kill-subtree)
  (fishman/save-current-buffer-around 'yaml-pro-ts-kill-subtree)
  (general-define-key :keymaps 'yaml-mode-map "M-\\" 'yaml-pro-format)
  (fishman/save-current-buffer-around 'yaml-pro-format))
