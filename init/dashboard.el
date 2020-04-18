(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo
	dashboard-banner-logo-title (format "Emacs %s" emacs-version)
	dashboard-items '((recents  . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5))
	dashboard-set-heading-icons t
	dashboard-set-file-icons t))
