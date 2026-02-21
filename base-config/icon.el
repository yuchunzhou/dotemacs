;;-*- lexical-binding: t; -*-

(use-package nerd-icons)

(use-package helm-icons
  :custom (helm-icons-provider 'nerd-icons)
  :config (helm-icons-enable))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package treemacs-nerd-icons
  :config (treemacs-load-theme "nerd-icons"))
