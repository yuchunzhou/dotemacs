;;-*- lexical-binding: t; -*-

(use-package rainbow-mode :hook (prog-mode  . rainbow-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
