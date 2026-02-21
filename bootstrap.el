;;-*- lexical-binding: t; -*-

(defvar bootstrap-version)

(let ((bootstrap-version 7))
  (unless (file-exists-p
		   (expand-file-name "straight/repos/straight.el/bootstrap.el"
							 (or
							  (bound-and-true-p straight-base-dir)
							  user-emacs-directory)))
    (with-current-buffer (url-retrieve-synchronously
						  "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el" t t)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load
   (expand-file-name "straight/repos/straight.el/bootstrap.el"
                     (or
                      (bound-and-true-p straight-base-dir)
                      user-emacs-directory))
   nil t))

(straight-use-package 'use-package)
(customize-set-value 'straight-use-package-by-default t)

(customize-set-value 'straight-vc-git-default-protocol 'ssh)
(customize-set-value 'straight-vc-git-default-clone-depth 1)
