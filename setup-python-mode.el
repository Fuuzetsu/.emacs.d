;;; setup-python-mode.el --- python-mode setup

;;; Commentary:
;; General Python environment settings

;;; Code:

;; (require 'ipython)
;; (require 'python-mode)

;; (add-to-list 'Info-default-directory-list user-emacs-directory)

;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args ""
;;       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;       python-shell-completion-setup-code
;;       "from IPython.core.completerlib import module_completion"
;;       python-shell-completion-string-code "';'.join(__IP.complete('''%s'''))\n"
;;       python-shell-completion-module-string-code "")

(provide 'setup-python-mode)

;;; setup-python-mode.el ends here
