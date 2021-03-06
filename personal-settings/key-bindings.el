(require 'misc)
(global-set-key (kbd "C-c C-a") 'copy-from-above-command)

;; Smart M-x
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-x") 'smex)

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "C-S-r") 'er/expand-region)

;; Experimental multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-c C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-c w p") 'mc/mark-previous-word-like-this)
(global-set-key (kbd "C-S-c w n") 'mc/mark-next-word-like-this)
(global-set-key (kbd "C-S-c w a") 'mc/mark-all-words-like-this)
(global-set-key (kbd "C-S-c s p") 'mc/mark-previous-symbol-like-this)
(global-set-key (kbd "C-S-c s a") 'mc/mark-all-symbols-like-this)
(global-set-key (kbd "C-S-c s n") 'mc/mark-next-symbol-like-this)
(global-set-key (kbd "C-S-c ~") 'mc/reverse-regions)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Magit
(global-set-key (kbd "M-g M-c") 'magit-status)
(autoload 'magit-status "magit")

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-and-retry-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

;; iy-go-to-char - like f in Vim
(global-set-key (kbd "M-m") 'jump-char-forward)
(global-set-key (kbd "M-M") 'jump-char-backward)

;; vim's ci and co commands
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)
(global-set-key (kbd "M-I") 'copy-inner)
(global-set-key (kbd "M-O") 'copy-outer)

;; For all your splitting needs
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

;; Add region to *multifile*
(global-set-key (kbd "C-!") 'mf/mirror-region-in-multifile)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Should be able to eval-and-replace/insert anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "C-c C-i") 'eval-and-insert)


;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "M-[") 'quick-switch-buffer)

;; Navigation bindings
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Move more quickly
(global-set-key (kbd "C-S-n") (λ (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (λ (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (λ (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (λ (ignore-errors (backward-char 5))))

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Clever newlines
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Line movement
(global-set-key (kbd "<C-S-down>") 'move-text-down)
(global-set-key (kbd "<C-S-up>") 'move-text-up)

;; Buffer file functions
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump)
(autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") (λ (dired-jump 1)))

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

; Multi-occur
(global-set-key (kbd "C-c m") 'multi-occur)
(global-set-key (kbd "C-c M") 'multi-occur-in-matching-buffers)

;; Find files by name and display results in dired
(global-set-key (kbd "C-c f") 'find-name-dired)

;; View occurrence in occur mode
(define-key occur-mode-map (kbd "v") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)

;; Some custom haskell-mode bindings
(require 'haskell-mode)
(define-key haskell-mode-map (kbd "C-c h t") 'haskell-insert-type)
(define-key haskell-mode-map (kbd "C-c h i") 'haskell-insert-type-infix)

;; Use ibuffer instead of list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Text scaling
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; stop flyspell from hijacking my stuff
(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-.") nil)
(define-key flyspell-mode-map (kbd "C-,") nil)
(define-key flyspell-mode-map (kbd "C-c s ,")
  'flyspell-goto-next-error)
(define-key flyspell-mode-map (kbd "C-c s .")
  'flyspell-auto-correct-word)

;; perspective bindings
(require 'perspective)
(global-set-key (kbd "C-c p h") (λ (persp-switch "haddock")))
(global-set-key (kbd "C-c p c") (λ (persp-switch "config")))
(global-set-key (kbd "C-c p e") (λ (persp-switch "erc")))
(global-set-key (kbd "C-c p b") (λ (persp-switch "blog")))
(global-set-key (kbd "C-c p y") (λ (persp-switch "yon-chan")))
(global-set-key (kbd "C-c p t") (λ (persp-switch "tmp")))
(global-set-key (kbd "C-c p m") (λ (persp-switch "main")))
(global-set-key (kbd "C-c p a") (λ (persp-switch "agscheme")))
(global-set-key (kbd "C-c p d") (λ (persp-switch "dev")))

;; stop erc from hijacking my stuff
(require 'erc)
(define-key erc-mode-map (kbd "C-c C-e") nil)
(define-key erc-mode-map (kbd "C-c C-i") nil)

;; Dedicated key for expand, when auto-complete gets in the way
(require' yasnippet)
(global-set-key (kbd "<M-tab>") 'yas-expand)

;; I'm not sending mail in emacs anyway
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'eshell)


(provide 'key-bindings)
