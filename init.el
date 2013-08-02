;; Fūzetsu's init file

;; Create the backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves")))

;; Unstable MELPA packages, clobber ELPA
(setq package-archives
      (list '("melpa" . "http://melpa.milkbox.net/packages/")))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Load path
(add-to-list 'load-path user-emacs-directory) ;; top level
(add-to-list 'load-path site-lisp-dir) ;; site-lisp, for local packages

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Load modules we want to have at the start
(require 'magit)
