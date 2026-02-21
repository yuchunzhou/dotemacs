;;-*- lexical-binding: t; -*-

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-hl-line-mode)
(global-display-line-numbers-mode)
(column-number-mode)
(customize-set-value 'fill-column 100)

(prefer-coding-system 'utf-8)

(customize-set-value 'auto-save-default nil)
(customize-set-value 'make-backup-files nil)

(customize-set-value 'create-lockfiles nil)
(customize-set-value 'enable-local-variables :safe)

(global-auto-revert-mode)
(customize-set-value 'auto-revert-verbose nil)

(run-with-timer 0.001 t 'redraw-display)

(setq undo-auto-current-boundary-timer t)

(save-place-mode)

(show-paren-mode)

(electric-indent-mode)
(electric-layout-mode)
(electric-pair-mode)
(electric-quote-mode)

(indent-tabs-mode -1)
(setq-default tab-width 4)

(recentf-mode)
(customize-set-value 'recentf-auto-cleanup 'never)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(customize-set-value 'compilation-scroll-output t)

(fset 'yes-or-no-p 'y-or-n-p)
(which-key-mode)

(defun fishman/save-current-buffer ()
  (interactive)
  (let ((inhibit-message t))
    (when buffer-file-name (save-buffer))))

(defmacro fishman/save-current-buffer-before (function)
  `(advice-add ,function :before
			   (lambda (&rest _) (fishman/save-current-buffer))))

(defmacro fishman/save-current-buffer-after (function)
  `(advice-add ,function :after
			   (lambda (&rest _) (fishman/save-current-buffer))))

(defmacro fishman/save-current-buffer-around (function)
  `(advice-add ,function :around
			   (lambda (orig-function &rest args)
                 (fishman/save-current-buffer)
                 (apply orig-function args)
                 (fishman/save-current-buffer))))

(defun fishman/save-some-buffers ()
  (interactive)
  (let ((inhibit-message t)) (save-some-buffers t)))

(defmacro fishman/save-some-buffers-before (function)
  `(advice-add ,function :before
			   (lambda (&rest _) (fishman/save-some-buffers))))

(defmacro fishman/save-some-buffers-after (function)
  `(advice-add ,function :after
			   (lambda (&rest _) (fishman/save-some-buffers))))

(defmacro fishman/save-some-buffers-around (function)
  `(advice-add ,function :around
			   (lambda (orig-function &rest args)
                 (fishman/save-some-buffers)
                 (apply orig-function args)
                 (fishman/save-some-buffers))))

(load-file (expand-file-name "bootstrap.el" user-emacs-directory))

(mapc
 (lambda (config-dir)
   (mapc
	(lambda (config-file) (load-file config-file))
	(directory-files
	 (expand-file-name config-dir user-emacs-directory)
	 :match "\\.el\\'")))
 '("base-config" "more-config"))

(customize-set-value 'custom-file
					 (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load-file custom-file))
