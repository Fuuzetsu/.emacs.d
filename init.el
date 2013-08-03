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

(setq ghc-mod-elisp-dir
      (expand-file-name "ghc-mod/elisp" site-lisp-dir))

(setq agda-mode-dir
      (let ((dir (sort
                  (file-expand-wildcards "~/.cabal/share/Agda*/emacs-mode")
                  'string<))) ;; newest version you can find
        (if dir
            (expand-file-name (car dir))
          (progn (warn "Agda not found!") nil))))

;; Load path
(add-to-list 'load-path user-emacs-directory) ;; top level
(add-to-list 'load-path site-lisp-dir) ;; site-lisp, for local packages
(add-to-list 'load-path ghc-mod-elisp-dir)
(add-to-list 'load-path agda-mode-dir)

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
                                     "C-x 8" "M-g" "C-x x"
                                     "C-S-c"))
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
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-paredit)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)
(require 'setup-ffip)
(require 'setup-whitespace-mode)
(require 'setup-erc)
(require 'setup-znc)


(when agda-mode-dir (require 'setup-agda))

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

;; Load stuff on demand
(autoload 'flycheck-mode "setup-flycheck" nil t)

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
(require 'eproject)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook
          (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
