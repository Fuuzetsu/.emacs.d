(require 'yasnippet)

;; Snippet directories
(setq yas/snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/site-lisp/yasnippet/snippets"))
(yas/global-mode 1)

;; Include snippets for stuff
;(require 'buster-snippets)
;(require 'angular-snippets)
;(require 'datomic-snippets)

;; Jump to end of snippet definition
(define-key yas/keymap (kbd "<return>") 'yas/exit-all-snippets)

;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas/snippets-at-point)))
        (position (yas/field-end (yas/snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas/snippets-at-point)))
        (position (yas/field-start (yas/snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

(define-key yas/keymap (kbd "C-e") 'yas/goto-end-of-active-field)
(define-key yas/keymap (kbd "C-a") 'yas/goto-start-of-active-field)

;; No dropdowns please, yas
(setq yas/prompt-functions '(yas/ido-prompt yas/completing-prompt))

;; No need to be so verbose
(setq yas/verbosity 1)

;; Wrap around region
(setq yas/wrap-around-region t)

(provide 'setup-yasnippet)
