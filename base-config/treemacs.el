;;-*- lexical-binding: t; -*-

(use-package treemacs
  :custom ((treemacs-position 'left)
		   (treemacs-width-is-initially-locked nil)
		   (treemacs-silent-refresh t)
		   (treemacs-silent-filewatch t)
		   (treemacs-follow-after-init t)
		   (treemacs-recenter-after-file-follow 'always)
		   (vc-follow-symlinks t))
  :bind ("<f5>" . treemacs)
  :config ; nofmt
  (setq treemacs--width-is-locked nil)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-filewatch-mode)
  (treemacs-follow-mode)
  (treemacs-project-follow-mode))
