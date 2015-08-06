;; setup-tbemail.el -- tbemail-mode setup

(require 'tbemail)
(add-hook 'tbemail-mode-hook
          (lambda ()
            (set-fill-column 70)
            (auto-fill-mode 1)
            (flyspell-mode 1)))

(provide 'setup-tbemail)
