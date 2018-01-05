(require 'znc)
(setq znc-detatch-on-kill t)

;; sets znc-servers with passwords to them too
(if (file-exists-p ".ercsettings.el")
    (load ".ercsettings.el"))

(provide 'setup-znc)
