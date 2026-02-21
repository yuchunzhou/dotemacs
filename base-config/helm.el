;;-*- lexical-binding: t; -*-

(use-package helm
  ;; :init (setq helm-debug t)
  :custom ((helm-split-window-inside-p t)
		   (helm-follow-mode-persistent t))
  :bind ; nofmt
  ("C-x l" . helm-mini)
  ("C-x r" . helm-recentf)
  ("M-x" . helm-M-x)
  :config ; nofmt
  (helm-adaptive-mode)
  (helm-autoresize-mode)
  (helm-ff-icon-mode)
  (fishman/save-some-buffers-before 'helm-mini)
  (fishman/save-some-buffers-before 'helm-recentf)
  (fishman/save-some-buffers-before 'helm-M-x))

(use-package helm-swoop
  :custom ((helm-swoop-use-line-number-face t)
		   (helm-swoop-split-with-multiple-windows t))
  :bind ("C-s" .
		 (lambda ()
		   (interactive)
		   (if (string-equal major-mode "dired-mode")
			   (let ((helm-swoop-pre-input-function (lambda ())))
				 (helm-swoop))
			 (helm-swoop))))
  :config (fishman/save-current-buffer-before 'helm-swoop))

(use-package helm-rg
  :config ; nofmt
  (general-define-key :keymaps 'override "C-d" 'helm-rg)
  (fishman/save-some-buffers-before 'helm-rg))

(use-package projectile
  :custom ((projectile-auto-discover t)
		   (projectile-indexing-method 'alien)
		   (projectile-buffers-filter-function 'projectile-buffers-with-file)
		   (projectile-switch-project-action 'projectile-dired))
  :hook (emacs-startup .
					   (lambda ()
						 (and (projectile-project-root) (projectile-dired))))
  :config (projectile-mode))

(use-package helm-projectile
  :after projectile
  :custom ((helm-projectile-ignore-strategy 'search-tool)
		   (helm-projectile-fuzzy-match nil))
  :bind	; nofmt
  ("C-f" . helm-projectile-find-file)
  ("C-p" . helm-projectile-rg)
  ("C-r" . helm-projectile-recentf)
  ("C-x b" . helm-projectile-switch-to-buffer)
  :config ; nofmt
  (fishman/save-some-buffers-before 'helm-projectile-find-file)
  (fishman/save-some-buffers-before 'helm-projectile-rg)
  (fishman/save-some-buffers-before 'helm-projectile-recentf)
  (fishman/save-some-buffers-before 'helm-projectile-switch-to-buffer))
