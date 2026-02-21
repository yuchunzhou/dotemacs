;;-*- lexical-binding: t; -*-

(use-package yafolding
  :bind (:map prog-mode-map ("C-t" . yafolding-toggle-element))
  :hook (prog-mode . yafolding-mode)
  :config (fishman/save-current-buffer-before 'yafolding-toggle-element))
