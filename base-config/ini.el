;;-*- lexical-binding: t; -*-

(require 'conf-mode)

(define-key conf-unix-mode-map (kbd "C-\\") 'smart-comment)

(define-key conf-unix-mode-map
			(kbd "M-\\")
			(lambda ()
			  (interactive)
			  (let ((start
					 (if (use-region-p)
						 (region-beginning)
					   (point-min)))
					(end
					 (if (use-region-p) (region-end) (point-max))))
				(indent-region start end))))

(fishman/save-current-buffer-around 'indent-region)
