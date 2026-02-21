;;-*- lexical-binding: t; -*-

(defun fishman/install-treesit-grammar ()
  (interactive)
  (mapc
   (lambda (grammar)
	 (add-to-list 'treesit-language-source-alist grammar)
	 (unless (treesit-language-available-p (car grammar))
       (treesit-install-language-grammar (car grammar))))
   '((python . ("https://github.com/tree-sitter/tree-sitter-python"))
	 (go . ("https://github.com/tree-sitter/tree-sitter-go"))
	 (yaml .
		   ("https://github.com/tree-sitter-grammars/tree-sitter-yaml")))))

(use-package tree-sitter
  :after (python-mode go-mode)
  :hook ((python-mode . tree-sitter-mode)
		 (go-mode . tree-sitter-mode)))

(use-package tree-sitter-langs)
