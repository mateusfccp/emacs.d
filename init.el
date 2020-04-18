;;;; General Editor Settings

;;; Custom Emacs Settings
(load "~/.emacs.d/settings.el")

;;; Melpa
(load "~/.emacs.d/init/melpa.el")

;;; Packages
(load "~/.emacs.d/init/packaging.el")

;; Fix PATH env
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;; All-the-icons
(load "~/.emacs.d/init/all-the-icons.el")

;;; Projectile
(load "~/.emacs.d/init/projectile.el")

;;; Dashboard
(load "~/.emacs.d/init/dashboard.el")

;;; Dracula theme
(load "~/.emacs.d/init/dracula-theme.el")

;;; Magit
(load "~/.emacs.d/init/magit.el")

;;; Flycheck
(load "~/.emacs.d/init/flycheck.el")

;;; Search and Replace
(load "~/.emacs.d/init/search-and-replace.el")

;;; Autocompletion
(load "~/.emacs.d/init/autocompletion.el")

;;; Language Server Protocol
(load "~/.emacs.d/init/lsp.el")


;;;; Language-Specific Settings

;;; LaTeX
(load "~/.emacs.d/init/latex.el")

;;; Lisp
(load "~/.emacs.d/init/lisp.el")

;;; Markdown
(load "~/.emacs.d/init/markdown.el")

;;; Python
(load "~/.emacs.d/init/python.el")

;;; Rust
(load "~/.emacs.d/init/rust.el")

;;; Typescript
(load "~/.emacs.d/init/typescript.el")

;;; Web (HTML, CSS, JS)
(load "~/.emacs.d/init/web.el")

;;; Yaml
(load "~/.emacs.d/init/yaml.el")
