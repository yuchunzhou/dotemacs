;;-*- lexical-binding: t; -*-

(use-package transpose-frame
  :bind ("C-u" . transpose-frame)
  :config (fishman/save-some-buffers-before 'transpose-frame))

(use-package ace-window
  :bind ("C-o" . ace-select-window)
  :config (fishman/save-some-buffers-before 'ace-select-window))

(use-package windsize
  :after general
  :custom ((windsize-rows 1)
		   (windsize-cols 1))
  :config ; nofmt
  (general-define-key :keymaps 'override "M-<up>" 'windsize-up)
  (fishman/save-some-buffers-before 'windsize-up)
  (general-define-key :keymaps 'override "M-<down>" 'windsize-down)
  (fishman/save-some-buffers-before 'windsize-down)
  (general-define-key :keymaps 'override "M-<left>" 'windsize-left)
  (fishman/save-some-buffers-before 'windsize-left)
  (general-define-key :keymaps 'override "M-<right>" 'windsize-right)
  (fishman/save-some-buffers-before 'windsize-right))
