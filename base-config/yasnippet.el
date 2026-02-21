;;-*- lexical-binding: t; -*-

(use-package yasnippet
  :hook (prog-mode . (lambda () (yas-reload-all) (yas-minor-mode)))
  :config (setq yas-verbosity 0))

(use-package yasnippet-snippets)
