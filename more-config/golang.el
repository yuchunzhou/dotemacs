;;-*- lexical-binding: t; -*-

(use-package go-mode
  :custom (gofmt-command "goimports")
  :bind (:map go-mode-map
			  ("C-c C-i" . go-import-add)
			  ("C-\\" . fishman/comment-function)
			  ("M-\\" . gofmt))
  :hook (go-mode . (lambda () (indent-tabs-mode) (lsp-deferred)))
  :config ; nofmt
  (fishman/save-some-buffers-before 'go-import-add)
  (fishman/save-current-buffer-around 'gofmt))

(use-package go-tag
  :config ; nofmt
  (fishman/save-current-buffer-around 'go-tag-add)
  (fishman/save-current-buffer-around 'go-tag-remove)
  (fishman/save-current-buffer-around 'go-tag-refresh))

(use-package go-impl
  :bind (:map go-mode-map ("M-i" . go-impl))
  :config (fishman/save-some-buffers-before 'go-impl))

(use-package go-gen-test
  :config ; nofmt
  (fishman/save-current-buffer-before 'go-gen-test-dwim)
  (fishman/save-current-buffer-before 'go-gen-test-exported)
  (fishman/save-current-buffer-before 'go-gen-test-all))
