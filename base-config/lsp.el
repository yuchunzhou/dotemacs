;;-*- lexical-binding: t; -*-

(use-package lsp-mode
  :custom ((lsp-auto-guess-root t)
		   (lsp-enable-suggest-server-download nil)
		   (lsp-auto-register-remote-clients nil)
		   (lsp-file-watch-threshold nil)
		   (lsp-headerline-breadcrumb-enable nil)
		   (lsp-lens-enable nil)
		   (lsp-signature-render-documentation nil)
		   (lsp-semantic-tokens-enable t))
  :bind (:map lsp-mode-map
			  ("C-c C-h" . lsp-describe-thing-at-point)
			  ("C-c C-r" . lsp-rename)
			  ("C-c C-x" . lsp-find-references))
  :config ; nofmt
  (fishman/save-some-buffers-before 'lsp-describe-thing-at-point)
  (fishman/save-some-buffers-around 'lsp-rename)
  (fishman/save-some-buffers-before 'lsp-find-references))

(use-package helm-lsp
  :after lsp-mode
  :bind (:map lsp-mode-map
			  ("C-c C-a" . helm-lsp-code-actions)
			  ("C-c C-d" . helm-lsp-diagnostics)
			  ("C-c C-s" . helm-lsp-workspace-symbol))
  :config ; nofmt
  (fishman/save-some-buffers-before 'helm-lsp-code-actions)
  (fishman/save-some-buffers-before 'helm-lsp-diagnostics)
  (fishman/save-some-buffers-before 'helm-lsp-workspace-symbol))

(fishman/save-current-buffer-around 'lsp-format-region)
(fishman/save-current-buffer-around 'lsp-format-buffer)

(defun fishman/lsp-format ()
  (interactive)
  (if (use-region-p)
      (lsp-format-region (region-beginning) (region-end))
    (lsp-format-buffer)))
