;;-*- lexical-binding: t; -*-

(use-package rust-mode
  :custom ((lsp-rust-analyzer-cargo-target-dir t)
		   (lsp-rust-analyzer-cargo-watch-command "clippy"))
  :bind (:map rust-mode-map ("M-\\" . fishman/lsp-format))
  :hook (rust-mode . lsp-deferred))

(use-package cargo-mode :hook (rust-mode . cargo-minor-mode))
