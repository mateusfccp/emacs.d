;; Prevent Emacs for writing inside init.el. It will now save on
;; emacs-autosettings.el, which I won't load and will gitignore it.
(setq custom-file (concat user-emacs-directory "/emacs-autosettings.el"))

;; Define packages directory to load, and it's subdirs
(let ((default-directory  "~/.emacs.d/packages/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Editor variables change default
(column-number-mode 1) 		; Show column
(display-battery-mode 1)	; Show battery percent
(menu-bar-mode -1)		; Hide menu bar
(scroll-bar-mode -1)		; Hide scroll bar
(tool-bar-mode -1)		; Hide toolbar

;; Font
(set-face-attribute 'default nil :height 75)
(set-face-attribute 'default nil :font "Fira Code")

;; Disable sounds
(setq visible-bell 1)

;; Start initial (main) frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Allow dead-keys input
(require 'iso-transl)

;; Show parenthesis matching
(show-paren-mode 1)

;; Emacs backups settings
(setq backup-directory-alist `(("." . "~/.emacs.d/saves"))) ; Make all backup files go to the same folder instead of the current folder
(setq backup-by-copying t)			             ; Safest but slower method

;; Defines a quicker reload function
(defun mateusfccp-reload () (interactive)
       "Reload the init.el file so the new settings are available."
       (load-file user-init-file)
       (message "Reloaded user init file."))

(defun mateusfccp-reload-current () (interactive)
       "Reload the current buffer file if it is within the config directory."
       (when (buffer-file-name)		; If buffer is visiting a file
	 (when (and
		(member buffer-file-name (directory-files-recursively user-emacs-directory ".")) ; If the file is within the config directory
		(not (string= (buffer-file-name) "c:/.emacs.d/pkgs"))) ;; Exception: packages file
	   (load buffer-file-name))))	; Reload it

;; Reload saved file when it belongs to settings
(add-hook 'after-save-hook 'mateusfccp-reload-current)

;; Define find and grep binaries when on Windows
(when (or (eq system-type 'windows-nt) (eq system-type 'msdos))
  (setq find-program "\"C:\\Program Files (x86)\\ezwinports\\bin\\find.exe\""
        grep-program "\"C:\\Program Files (x86)\\ezwinports\\bin\\grep.exe\""))
