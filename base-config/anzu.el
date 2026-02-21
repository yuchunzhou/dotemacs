;;-*- lexical-binding: t; -*-

(use-package anzu
  :after general
  :config ; nofmt
  (general-define-key :keymaps 'override "M-r" 'anzu-query-replace-regexp)
  (fishman/save-current-buffer-before 'anzu-query-replace-regexp))
