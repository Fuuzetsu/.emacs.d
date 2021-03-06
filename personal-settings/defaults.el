;; e-mail address
(setq user-mail-address "fuuzetsu@fuuzetsu.co.uk")

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Disable marking text my using shift
(setq shift-select-mode nil)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Keep cursor away from edges when scrolling up/down
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000) ; 20MB before GC

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; Enable 'a' in dired
(put 'dired-find-alternate-file 'disabled nil)

;; Case-insensitive searches
(setq case-fold-search t)

;; Time logging in org-mode please
(setq org-log-done 'time)
(setq org-src-fontify-natively t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))
;; org-mode hooks here because we can be pretty sure we have org-mode
(add-hook 'org-mode-hook (lambda ()
                           (flyspell-mode)
                           (auto-fill-mode)))

;; Display help in minibuffer instantly
(custom-set-variables
 '(help-at-pt-timer-delay 0)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

;; 2 spaces for groovy and JS
(setq js-indent-level 2)
(setq groovy-indent-offset 2)
(setq python-indent-offset 2)

;; 2 spaces in general
(setq-default tab-width 2)

;; Final newline everywhere
(setq require-final-newline t)


(provide 'defaults)
