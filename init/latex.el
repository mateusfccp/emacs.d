;;;; RefTeX Settings
(use-package reftex
  :defer t
  :config
  
  ;; Enable RefTeX with AUCTeX mode
  :hook (LaTeX-mode . reftex-mode))

;;;; AUCTeX Settings
(use-package auctex
  :defer t
  :mode ("\\.tex\\'" . LaTeX-mode)
  
  :init
  (setq-default TeX-master nil		; Query for Master master file
		TeX-engine 'xetex)	; Use XeTeX as default engine
  :config
  (setq TeX-auto-save t			; Enable parsing on save
	TeX-parse-self t))		; Enable parsing on load

