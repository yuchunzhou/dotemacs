;;-*- lexical-binding: t; -*-

(use-package transient :commands transient--set-layout)

(use-package combobulate
  :after (python-mode go-mode)
  :custom (combobulate-flash-node nil)
  :bind ; nofmt
  (:map python-mode-map ("M-k" . combobulate-kill-node-dwim))
  (:map go-mode-map ("M-k" . combobulate-kill-node-dwim))
  (:map python-mode-map ("M-m" . combobulate-mark-node-dwim))
  (:map go-mode-map ("M-m" . combobulate-mark-node-dwim))
  (:map python-mode-map
		("TAB" .
		 (lambda ()
		   (interactive)
		   (if (use-region-p)
			   (combobulate-python-indent-for-tab-command)
			 (py-indent-line)))))
  :config ; nofmt
  (fishman/save-current-buffer-before 'combobulate-kill-node-dwim)
  (fishman/save-current-buffer-before 'combobulate-mark-node-dwim))
