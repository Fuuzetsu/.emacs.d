;; Fūzetsu's init file
;; A lot of it is ‘borrowed’ from https://github.com/magnars/.emacs.d

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

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

;; Set up appearance
(require 'appearance)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Load modules we want to have at the start
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Make sure we have our defaults
(require 'defaults)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v"
                                     "C-x 8" "M-g" "C-x x"))
(guide-key-mode 1)
(setq guide-key/highlight-command-regexp "magit")
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-paredit)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          markdown-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

;; Load stuff on demand
(autoload 'flycheck-mode "setup-flycheck" nil t)

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Setup key bindings
(require 'key-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
