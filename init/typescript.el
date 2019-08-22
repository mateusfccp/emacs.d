(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode)))

(use-package tide
  :after
  (typescript-mode company flycheck)

  :hook
  ((typescript-mode . tide-setup)
   (typescript-mode . tide-hl-identifier-mode)))
