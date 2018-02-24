;;; setup-haskell-mode.el --- haskell-mode setup

;;; Commentary:
;; Some haskell-mode tweaks. Defines few more functions to ease up
;; work with the mode

(require 'inf-haskell)

;;; Code:

(add-to-list 'Info-default-directory-list user-emacs-directory)

(setq haskell-mode-hook nil)
(add-hook 'haskell-mode-hook
          (lambda ()
            (define-key haskell-mode-map (kbd "M-n") nil)
            (define-key haskell-mode-map (kbd "M-p") nil)
            (define-key haskell-mode-map (kbd "C-c C-l")
              'inferior-haskell-load-file)
            (turn-on-haskell-indentation)
            (turn-on-haskell-doc)
            (setq tags-revert-without-query t)
            (hs-minor-mode)))
; (add-hook 'haskell-mode-hook 'inf-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook 'flymake-hlint-load)
(add-hook 'haskell-mode-hook 'flymake-cursor-mode)
(add-hook 'haskell-mode-hook 'hlint-refactor-mode)

(add-hook 'inferior-haskell-mode-hook (lambda ()
                                        (whitespace-mode -1)
                                        (disable-paredit-mode)
                                        (turn-off-show-smartparens-mode)))
(setq haskell-proces-type 'ghci)
(setq haskell-tags-on-save nil)

(defun haskell-insert-type ()
  "Insert the type of the function on the previous line.
You have to be be on the first line of the function.
Use `haskell-insert-type-infix' for infix functions.
It uses the Haskell inferior process in order to get the class constraints
as well"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (zap-up-to-char 1 ?\s)
    (yank)
    (let ((func-type (inferior-haskell-type (yank-peek))))
      (beginning-of-line)
      (newline)
      (previous-line)
      (insert func-type))))

(defun haskell-insert-type-infix ()
  "Insert a type of the infix function on the previous line.
Also see `haskell-insert-type'. Note that this works by using the spaces between
arguments to determine the of function so it will fail if your first argument
contains a space, for example when matching on a String.
It uses the Haskell inferior process in order to get the class constraints
as well. Make sure you have loaded the file using `inferior-haskell-load-file'."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (zap-up-to-char 1 ?\s)
    (yank)
    (forward-char)
    (zap-up-to-char 1 ?\s)
    (yank)
    (let ((func-type (inferior-haskell-type
                      (concat "(" (yank-peek) ")"))))
      (beginning-of-line)
      (newline)
      (previous-line)
      (insert func-type))))

(setenv "NIX_PATH" "nixpkgs=/home/shana/programming/nixpkgs")
(setq haskell-program-name "nix-shell -A env --pure --command \"ghci -fdefer-type-errors\"")

(provide 'setup-haskell-mode)

;;; setup-haskell-mode.el ends here
