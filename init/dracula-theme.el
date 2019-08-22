;;;; Define theme
(use-package dracula-theme
  :config
  (unless (custom-theme-p 'dracula)
    (load-theme 'dracula t)))
