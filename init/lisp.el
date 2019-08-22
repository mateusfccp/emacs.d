(defun lisp-prettify ()
  "Define Lisps prettify mode and alist."
  (setq prettify-symbols-alist
	(append '(
		  ;; General symbols
		  ("->" . ?→)
		  ("<-" · ?←)
		  ("=>" . ?⇒)
		  ("..." . ?…)

		  ;; Arithmetics
		  ("*" . ?×)
		  ("/=" . ?≠)
		  (">=" . ?≥)
		  ("<=" . ?≤)
		  ("sqrt" . ?√)

		  ;; Math constants
		  ("pi" . ?π)

		  ;; Boolean algebra symbols
		  ("not" . ?¬)
		  ("and" . ?∧)
		  ("or" . ?∨)

		  ;; Lisp specific
		  ("defun" . ?ƒ) prettify-symbols-alist))
  (prettify-symbols-mode t)))

(add-hook 'emacs-lisp-mode-hook 'lisp-prettify)
(add-hook 'lisp-mode-hook 'lisp-prettify)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
