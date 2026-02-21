;;-*- lexical-binding: t; -*-

(use-package super-save
  :custom ((super-save-all-buffers t)
		   (super-save-remote-files nil)
		   (super-save-silent t))
  :config (super-save-mode))
