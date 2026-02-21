;;-*- lexical-binding: t; -*-

(use-package company
  :custom ((company-tooltip-align-annotations t)
		   (company-tooltip-flip-when-above t)
		   (company-selection-wrap-around t))
  :hook ; nofmt
  (prog-mode .
			 (lambda ()
			   (setq-local company-backends
						   '((company-capf :with company-yasnippet)
							 company-files))))
  (text-mode .
			 (lambda ()
			   (setq-local company-backends
						   '(company-ispell company-dabbrev))))
  :config (global-company-mode))
