(require 'with-editor)

(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)

(provide 'setup-with-editor)
