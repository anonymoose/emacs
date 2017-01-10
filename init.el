;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config

(live-load-config-file "modes.el")
(live-load-config-file "functions.el")
(live-load-config-file "bindings.el")


;(add-to-list 'load-path "~/.live-packs/ken-pack/lib/company-mode")
;(load "company")
;(global-company-mode)


;(add-hook 'cider-repl-mode-hook #'company-mode)
;(add-hook 'cider-mode-hook #'company-mode)


(add-to-list 'load-path "~/.live-packs/ken-pack/lib/csv-mode")
(load "csv-mode")
