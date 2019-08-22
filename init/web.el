;;; web-mode
(use-package web-mode
  ;; Associate extensions with mode
  :mode ("\\.phtml\\'"
	 "\\.html?\\'"
	 "\\.blade\\.php\\'")
  
  :config
  ;; Set engines
  (setq web-mode-engines-alist
	'(("php"    . "\\.phtml\\'")
	  ("blade"  . "\\.blade\\.")))

  ;; Never use tabs
  (setq-default indent-tabs-mode nil)

  ;; Highlight element and column
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)

  ;; Enable CSS colorization
  (setq web-mode-enable-css-colorization t)

  ;; Server commenting (for blade templates)
  (setq web-mode-comment-style 2)

  ;; Remove padding from style and script blocks
  (setq web-mode-style-padding 0)
  (setq web-mode-script-padding 0)

  ;; Indentation
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 0)
  (setq web-mode-code-indent-offset 4)

  ;; Workaround for new @error directives
  (setq web-mode-extra-control-blocks
        '(("blade" . ("error")))))

(defun web-prettify ()
  "Define web prettify mode and alist."
  (setq prettify-symbols-alist
	(append '(
		  ;; General symbols
		  ("->" . ?→)
		  ("<-" · ?←)
		  ("=>" . ?⇒)
		  ("..." . ?…)

		  ;; Arithmetics
		  ("*" . ?×)
		  ("!=" . ?≠)
		  (">=" . ?≥)
		  ("<=" . ?≤)

		  ;; Math constants
		  ("pi" . ?π)

		  ;; Boolean algebra symbols
		  ("&&" . ?∧)
		  ("||" . ?∨)
                  
		  ) prettify-symbols-alist))
  (prettify-symbols-mode t))

(add-hook 'web-mode-hook 'web-prettify)
