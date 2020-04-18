(use-package lsp-mode
  ;; Set prefix for lsp-command-keymap
  :init (setq lsp-keymap-prefix "s-l")
  :hook ((dart-mode . lsp)
	 (haskell-mode . lsp)
	 (rust-mode . lsp))
  :commands lsp
  :config (setq lsp-dart-sdk-dir "~/.flutter_dir/flutter/bin/cache/dart-sdk"))

;; sdk
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
