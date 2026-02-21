;;-*- lexical-binding: t; -*-

(use-package shrink-path :straight (:protocol https))

(use-package doom-modeline
  :custom ((doom-modeline-buffer-file-name-style 'buffer-name)
		   (doom-modeline-buffer-encoding nil))
  :config (doom-modeline-mode))
