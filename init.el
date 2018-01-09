;;; init.el --- Fūzetsu's init file
;; A lot of it is ‘borrowed’ from https://github.com/magnars/.emacs.d

;; Turn off mouse interface early in startup to avoid momentary display
(setq debug-on-error 1)

;; melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path (expand-file-name "site-lisp/use-package" user-emacs-directory))
  (require 'use-package))

(use-package auto-complete :ensure t)
(use-package bazel-mode :ensure t)
(use-package change-inner :ensure t)
(use-package diminish :ensure t)
(use-package elisp-slime-nav :ensure t)
(use-package flx-ido :ensure t)
(use-package gitconfig-mode :ensure t)
(use-package gitignore-mode :ensure t)
(use-package go-mode :ensure t)
(use-package guide-key :ensure t)
(use-package haskell-mode :ensure t)
(use-package helm :ensure t)
(use-package highlight-escape-sequences :ensure t)
(use-package ido-completing-read+ :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package ivy :ensure t)
(use-package jump-char :ensure t)
(use-package magit :ensure t)
(use-package markdown-mode :ensure t)
(use-package multiple-cursors :ensure t)
(use-package nix-mode :ensure t)
(use-package paredit :ensure t)
(use-package perspective :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package smart-forward :ensure t)
(use-package smartparens :ensure t)
(use-package smex :ensure t)
(use-package smooth-scrolling :ensure t)
(use-package terraform-mode :ensure t)
(use-package visual-regexp :ensure t)
(use-package wgrep :ensure t)
(use-package with-editor :ensure t)
(use-package yaml-mode :ensure t)
(use-package yasnippet :ensure t)
(use-package znc :ensure t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Create the backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves")))

;; Set path to dependencies
(setq personal-settings-dir
      (expand-file-name "personal-settings" user-emacs-directory))


;; (setq agda-mode-dir
;;       (file-name-directory (shell-command-to-string "agda-mode locate")))

;; Load path
;(add-to-list 'load-path user-emacs-directory) ;; top level
(add-to-list 'load-path personal-settings-dir)
;; (add-to-list 'load-path agda-mode-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" personal-settings-dir))
(load custom-file)

;; Set up appearance
(require 'appearance)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Load modules we want to have at the start
(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

;; Make sure we have our defaults
(require 'defaults)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v"
                                     "C-x 8" "M-g" "C-x x"
                                     "C-S-c" "C-c"))
(guide-key-mode 1)

(setq guide-key/highlight-command-regexp "magit")
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Functions (load all files in defuns-dir)
;; load these faster so that we can use the during setup
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


;; Setup extensions
(require 'setup-with-editor)
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-paredit)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)
(require 'setup-whitespace-mode)
(require 'setup-erc)
(require 'setup-znc)

;; has to be after magit
;(require 'git-commit)
(require 'gitconfig-mode)
(require 'gitignore-mode)
;(require 'git-rebase)

(require 'nix-mode)

(require 'terraform-mode)

(require 'yaml-mode)

;; don't load until I fix it
;; (require 'magit-gh-pulls)

;; (when agda-mode-dir (require 'setup-agda))

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
(eval-after-load 'haskell-mode '(require 'setup-haskell-mode))
(eval-after-load 'python-mode '(require 'setup-python-mode))

;; which
(eval-after-load "which-func" '(add-to-list 'which-func-modes 'haskell-mode))

;; Auto-completion is sick!
(require 'auto-complete)
(global-auto-complete-mode t)

;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; Make sure we have all the nice stuff loaded
(require 'expand-region)
(require 'multiple-cursors)
(require 'delsel)
(require 'jump-char)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'bazel-mode)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook
          (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; free up TAB in term-mode
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(set-cursor-color "#ffffff")
(provide 'init)

;;; init.el ends here
