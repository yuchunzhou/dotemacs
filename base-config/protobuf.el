;;-*- lexical-binding: t; -*-

(use-package protobuf-mode
  :bind (:map protobuf-mode-map ("M-\\" . fishman/lsp-format))
  :hook (protobuf-mode .
					   (lambda ()
						 (require 'lsp-mode)
						 (setq-local lsp-disabled-clients '(buf bufls))
						 (lsp-register-client
						  (make-lsp-client :new-connection
										   (lsp-stdio-connection
 											'("protobuf-language-server" "-stdio"))
										   :activation-fn (lsp-activate-on "protobuf")
										   :language-id "protobuf"
										   :priority 1
										   :server-id 'protobuf-language-server))
						 (lsp-deferred))))
