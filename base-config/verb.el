;;-*- lexical-binding: t; -*-

(require 'org-persist)
(cancel-timer org-persist--refresh-gc-lock-timer)

(use-package verb
  :custom ((verb-auto-show-headers-buffer t)
		   (verb-show-timeout-warning 30))
  :config ; nofmt
  (general-define-key :keymaps 'org-mode-map "C-\\" 'smart-comment)
  (general-define-key :keymaps 'org-mode-map "C-c C-c" 'verb-export-request-on-point)
  (fishman/save-current-buffer-around 'verb-export-request-on-point)
  (general-define-key :keymaps 'org-mode-map "C-c C-r" 'verb-send-request-on-point-display)
  (fishman/save-current-buffer-before 'verb-send-request-on-point-display))

(use-package curl-to-elisp
  :bind (:map org-mode-map ("C-c C-v" . curl-to-elisp-verb))
  :config (fishman/save-current-buffer-around 'curl-to-elisp-verb))

(use-package json-reformat
  :config (fishman/save-current-buffer-around 'json-reformat-region))

(use-package json-mode
  :bind (:map json-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (if (use-region-p)
					 (json-reformat-region (region-beginning) (region-end))
				   (json-reformat-region (point-min) (point-max)))))))
