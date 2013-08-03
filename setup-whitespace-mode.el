;; make whitespace-mode use just basic coloring
(setq whitespace-style '(face indentation::space space-before-tab::space
                         trailing tab-mark spaces tabs newline tab-mark
                         lines-tail))

;; clean up buffer before saving it
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-whitespace-mode 1)
(provide 'setup-whitespace-mode)
