(require 'erc)
(require 'erc-log)
(require 'erc-notify)
(require 'erc-spelling)
(require 'erc-autoaway)
(require 'erc-services)
(require 'notifications)

;; Nickname if we ever connect through ERC and not ZNC
(setq erc-nick "Fuuzetsu-emacs")


;; Highlight my original name as well
(setq erc-pals '("Fuuzetsu"))

;; Interpret silly colours
(setq erc-interpret-mirc-color t)

;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

;; open query buffers in the current window
(setq erc-query-display 'buffer)

;; exclude boring stuff from tracking
(erc-track-minor-mode -1) ;; No thanks
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))

;; Clear out the modeline
(defun reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-update))

;; logging
(setq erc-log-channels-directory "~/.erc/logs/")

(if (not (file-exists-p erc-log-channels-directory))
    (mkdir erc-log-channels-directory t))

(setq erc-save-buffer-on-part t)

;; truncate long irc buffers
(erc-truncate-mode +1)

;; enable spell checking with flyspell
(erc-spelling-mode 1)

;; autoaway setup
(setq erc-auto-discard-away t)
(setq erc-autoaway-idle-seconds 600)
(setq erc-autoaway-use-emacs-idle t)

;; utf-8 always and forever
(setq erc-server-coding-system '(utf-8 . utf-8))

(add-hook 'erc-mode-hook (λ (whitespace-mode -1)))

; fuck you fuck you fuck you fuck you fuck you fuck fuck fuck you track-minor
(defadvice switch-to-buffer (after other-window-now activate)
  (erc-track-minor-mode -1))

; I don't think I'll miss much without these messages
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

; 30k is too small
(setq erc-max-buffer-size 200000)

(provide 'setup-erc)
