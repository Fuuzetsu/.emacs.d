;; Default input method to Agda for delicious Unicode
(require 'agda2)
(require 'agda-input)

(defadvice switch-to-buffer (after activate-input-method activate)
  (activate-input-method "Agda"))

(setq agda2-include-dirs
      (let ((dir (expand-file-name "~/agdalib/src")))
        (if (file-exists-p dir)
            (list "." dir)
          (progn
            (warn (concat "Didn't find Agda libraries at " dir))
            (setq agda2-include-dirs '("."))))))

(provide 'setup-agda)
