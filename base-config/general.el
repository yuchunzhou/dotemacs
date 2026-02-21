;;-*- lexical-binding: t; -*-

(use-package general)

(general-define-key :keymaps 'override "C-a"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (move-beginning-of-line 1)))

(general-define-key :keymaps 'override "C-e"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (move-end-of-line 1)))

(general-define-key :keymaps 'override "M-a"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (beginning-of-line-text)))

(general-define-key :keymaps 'override "M-e"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (goto-char
					   (-
						(+
						 (line-beginning-position)
						 (length
						  (string-trim-right
						   (buffer-substring-no-properties
							(line-beginning-position)
							(line-end-position)))))
						1))))

(general-define-key :keymaps 'override "M-g"
					(lambda (line-number)
					  (interactive "nGoto line: ")
					  (let* ((last-line-number
							  (count-lines (point-min) (point-max)))
							 (step-line-count
							  (-
							   (min line-number last-line-number)
							   (line-number-at-pos))))
						(xref-push-marker-stack)
						(forward-line step-line-count))))

(general-define-key :keymaps 'override "M-<"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (goto-char (point-min))))

(general-define-key :keymaps 'override "M->"
					(lambda ()
					  (interactive)
					  (xref-push-marker-stack)
					  (goto-char (- (point-max) 2))))

(general-define-key :keymaps 'override "S-<up>" 'windmove-up)
(general-define-key :keymaps 'override "S-<down>" 'windmove-down)
(general-define-key :keymaps 'override "S-<left>" 'windmove-left)
(general-define-key :keymaps 'override "S-<right>" 'windmove-right)

(general-define-key :keymaps 'override "<f7>"
					(lambda () (interactive) (read-only-mode)))

(general-define-key :keymaps 'override "<f8>"
					(lambda () (interactive) (read-only-mode -1)))
