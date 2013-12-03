;; Default input method to Agda for delicious Unicode
(require 'agda2)
(require 'agda-input)

(defadvice agda2-mode (after turn-off-erc-track-minor-mode activate)
  (erc-track-minor-mode -1))

(defadvice switch-to-buffer (after activate-input-method activate)
  (with-current-buffer (buffer-name)
    (if (boundp 'set-agda-before)
        nil
      (progn
        (set (make-local-variable 'set-agda-before) t)
        (activate-input-method "Agda")))))

(setq agda2-include-dirs
      (let ((dir (expand-file-name "~/agdalib/src")))
        (if (file-exists-p dir)
            (list "." dir)
          (progn
            (warn (concat "Didn't find Agda libraries at " dir))
            (setq agda2-include-dirs '("."))))))

(provide 'setup-agda)
