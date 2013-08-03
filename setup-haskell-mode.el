;; haskell-mode setup

(require 'haskell-mode-autoloads)

(add-to-list 'Info-default-directory-list user-emacs-directory)

(add-hook 'haskell-mode-hook (lambda ()
                               ;(ghc-init)
                               ;(flymake-mode)
                               ;(flyspell-mode -1)
                               (turn-on-haskell-indentation)))

;;(setq haskell-process-path-ghci "~/ghc/bin/ghci")
;;(setq haskell-program-name "~/ghc/bin/ghci")

(provide 'setup-haskell-mode)
