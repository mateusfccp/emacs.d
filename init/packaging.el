(defun mateusfccp-read-packages ()
  "Returns the packages list from packages.el"
  (with-temp-buffer
    (insert-file-contents (concat user-emacs-directory "pkgs"))
    (read (current-buffer))))

(defun mateusfccp-write-packages (packages)
  "Write the packages list to packages.el"
  (with-temp-buffer
    (print packages (current-buffer))
    (write-file (concat user-emacs-directory "pkgs"))))
      
(defun mateusfccp-add (packages) (interactive "xPackage list: ")
       "Add the provide packages to package list and install them."

       (let* ((old-packages (mateusfccp-read-packages))
	      (new-packages
	       (delete-dups
		(sort (append packages old-packages)
		      (lambda (a b) (string< (symbol-name a) (symbol-name b)))))))
	 (mateusfccp-write-packages new-packages)
	 (mateusfccp-install)))
       

(defun mateusfccp-install () (interactive) 
       "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
       (let* ((missing (seq-remove #'package-installed-p (mateusfccp-read-packages)))
	      (count (length missing)))
	 (if (= count 0)
	     ;; If there's no package to install, exit with this message
	     (message "No packages to install.")
	   ;; If there's package to install, prompt the installation
	   (when (y-or-n-p (format "%d packages are missing. Install?" count))
	     ;; Refresh package archive contents if not available
	     (unless package-archive-contents
	       (package-refresh-contents))
	     ;; Install each of the packages
	     (mapc #'package-install missing)
	     (message "%d packages installed." count)))))

;; Require use-package to be used later
(eval-when-compile (require 'use-package))
