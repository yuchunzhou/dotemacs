;;-*- lexical-binding: t; -*-

(use-package expand-region
  :init ; nofmt
  (set-face-background 'region "#777888")
  (set-face-foreground 'region nil)
  :bind ("M-m" . er/expand-region)
  :config (delete-selection-mode))
