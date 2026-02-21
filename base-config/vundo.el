;;-*- lexical-binding: t; -*-

(use-package vundo
  :bind ; nofmt
  ("C-x u" . vundo)
  (:map vundo-mode-map ("q" . vundo-confirm))
  :config (fishman/save-current-buffer-after 'vundo-confirm))
