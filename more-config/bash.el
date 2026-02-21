;;-*- lexical-binding: t; -*-

(require 'sh-script)

(custom-set-variables
 '(sh-basic-offset 4)
 '(sh-indentation 4)
 '(sh-indent-comment t))

(use-package shfmt
  :custom (shfmt-arguments '("-i" "4"))
  :bind (:map sh-mode-map
			  ("M-\\" .
			   (lambda ()
				 (interactive)
				 (if (use-region-p)
					 (shfmt-region (region-beginning) (region-end))
				   (shfmt-buffer)))))
  :config ; notfmt
  (fishman/save-current-buffer-around 'shfmt-region)
  (fishman/save-current-buffer-around 'shfmt-buffer))

(add-hook 'sh-mode-hook 'lsp-deferred)
