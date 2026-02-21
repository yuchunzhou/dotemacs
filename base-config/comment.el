;;-*- lexical-binding: t; -*-

(use-package smart-comment
  :bind (:map prog-mode-map ("C-\\" . smart-comment))
  :config ; nofmt
  (fishman/save-current-buffer-around 'smart-comment)
  (advice-add 'smart-comment :after
			  (lambda (&rest _) (forward-line))))

(require 'newcomment)
(customize-set-value 'comment-style 'extra-line)
(fishman/save-current-buffer-around 'comment-or-uncomment-region)

(defun fishman/comment-function ()
  (interactive)
  (if (use-region-p)
      (progn
		(setq-local comment-start "/* " comment-end " */")
		(comment-or-uncomment-region (region-beginning) (region-end)))
    (progn
      (setq-local comment-start "// " comment-end "")
      (comment-or-uncomment-region
       (line-beginning-position)
       (line-end-position))
      (forward-line))))

(use-package separedit
  :after general
  :custom ((separedit-default-mode 'markdown-mode)
		   (separedit-preserve-string-indentation t)
		   (separedit-continue-fill-column t)
		   (separedit-write-file-when-execute-save t)
		   (separedit-remove-trailing-spaces-in-comment t))
  :config ; nofmt
  (general-define-key :keymaps 'prog-mode-map "M-d" 'separedit)
  (fishman/save-current-buffer-before 'separedit))
