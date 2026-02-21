;;-*- lexical-binding: t; -*-

(use-package cc-mode
  :hook (c-mode .
				(lambda ()
				  (setq-local c-basic-offset 4 c-default-style "k&r")
				  (lsp-deferred))))

(use-package gnu-indent
  :straight (:protocol https)
  :custom (gnu-indent-options
		   '("-kr" "-i4" "-l80" "-psl" "-sob" "-npcs" "-bap" "-br" "-brs" "-ce" "-di4" "-nfc1" "-saf" "-sai" "-ssc" "-ts4" "-nut" "-fca"))
  :bind (:map c-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (if (region-active-p)
					 (gnu-indent-region (region-beginning) (region-end))
				   (gnu-indent-buffer)))))
  :config ; nofmt
  (fishman/save-current-buffer-around 'gnu-indent-region)
  (fishman/save-current-buffer-around 'gnu-indent-buffer))
