(require 'lsp-python-ms)
(add-hook 'python-mode #'lsp)
(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-python-ms)
			 (lsp))))