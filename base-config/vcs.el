;;-*- lexical-binding: t; -*-

(use-package git-modes)

(use-package magit
  :init (require 'magit-diff)
  :custom ((magit-completing-read-function 'helm--completing-read-default)
		   (magit-format-file-function 'magit-format-file-nerd-icons))
  :bind	; nofmt
  ("C-x j" . magit-log-current)
  ("C-x y" . magit-log-buffer-file)
  ("C-x s" . magit-branch-checkout)
  :hook ; nofmt
  (magit-status-mode .
					 (lambda ()
					   (display-line-numbers-mode)
					   (run-with-timer 0.001 t 'redraw-display)))
  (magit-diff-mode . display-line-numbers-mode)
  (magit-log-mode . display-line-numbers-mode)
  (magit-revision-mode . display-line-numbers-mode)
  :config ; nofmt
  (fishman/save-some-buffers-before 'magit-status)
  (fishman/save-some-buffers-before 'magit-log-current)
  (fishman/save-some-buffers-before 'magit-log-buffer-file)
  (fishman/save-some-buffers-before 'magit-branch-checkout))

(use-package git-gutter
  :init (defvar fishman/git-gutter-mode-enabled nil)
  :bind ("C-x c" .
		 (lambda ()
		   (interactive)
		   (if fishman/git-gutter-mode-enabled
			   (progn
				 (git-gutter-mode -1)
				 (setq fishman/git-gutter-mode-enabled nil))
			 (progn
			   (git-gutter-mode)
			   (setq fishman/git-gutter-mode-enabled t))))))
