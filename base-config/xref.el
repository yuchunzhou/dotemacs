;;-*- lexical-binding: t; -*-

(use-package xref
  :init (unload-feature 'xref t)
  :custom (xref-auto-jump-to-first-definition 'move)
  :bind (:map prog-mode-map
			  ("M-." . xref-find-definitions)
			  ("M-;" . lsp-find-type-definition)
			  ("M-," . xref-go-back))
  :config ; nofmt
  (fishman/save-some-buffers-before 'xref-find-definitions)
  (fishman/save-some-buffers-before 'lsp-find-type-definition)
  (fishman/save-some-buffers-before 'xref-go-back))

(use-package xref-project-history
  :straight (:type git :host codeberg :repo "imarko/xref-project-history" :protocol https)
  :custom (xref-history-storage 'xref-project-history))

(use-package helm-xref
  :config (setq xref-show-xrefs-function 'helm-xref-show-xrefs-27
				xref-show-definitions-function 'helm-xref-show-defs-27))
