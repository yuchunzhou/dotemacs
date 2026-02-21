;;-*- lexical-binding: t; -*-

(defun fishman/symbols-outline-toggle ()
  (interactive)
  (when (bound-and-true-p lsp-mode)
    (let ((window (get-buffer-window symbols-outline-buffer-name)))
      (if (and window (window-live-p window))
		  (delete-window window)
		(symbols-outline-show)))))

(use-package symbols-outline
  :custom ((symbols-outline-no-other-window nil)
		   (symbols-outline-ignore-variable-symbols nil))
  :bind ("<f6>" . fishman/symbols-outline-toggle)
  :hook ; nofmt
  (lsp-mode .
			(lambda ()
			  (setq-local symbols-outline-fetch-fn 'symbols-outline-lsp-fetch)
			  (symbols-outline-follow-mode))))
