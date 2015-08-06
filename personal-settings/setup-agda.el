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


;; (setq agda2-include-dirs '("/nix/store/jjxyv361w4armx83p39p89rrcsxvs7qy-agda-stdlib-2.4.2.3/share/agda"
;;                            "/nix/store/qh1513av3d97gh8ycw63gv9x6pmx6pln-categories-0.0.0.0/share/agda"
;;                            "."))



;; (setq agda2-include-dirs
;;       (let ((dir (expand-file-name "~/.nix-profile/share/agda")))
;;         (if (file-exists-p dir)
;;             (list "." dir)
;;           (progn
;;             (warn (concat "Didn't find Agda libraries at " dir))
;;             (setq agda2-include-dirs '("."))))))

(put 'erc-remove-text-properties-region 'disabled nil)

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))


(provide 'setup-agda)
