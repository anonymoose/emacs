;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)


(setq make-backup-files nil); backups off (~file)

(global-auto-revert-mode 1)
(global-font-lock-mode t)                 ; always do syntax coloring when possible
(auto-fill-mode -1)
; make PDF files auto-reload
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

(setq default-truncate-lines t)           ; don't wrap long lines when viewing
(setq inhibit-startup-message t)          ; no startup message
(which-function-mode)                     ; displays name of current function in modeline
(display-time)
(fset 'yes-or-no-p 'y-or-n-p)             ; replace "yes" with "y"

(setq visible-bell t)
(setq c-basic-offset 4)
(setq php-mode-force-pear t)

; http://www.gnu.org/software/emacs/manual/html_node/emacs/Completion-Options.html
(setq  completion-auto-help t)

; http://stackoverflow.com/questions/1381794/too-many-split-screens-opening-in-emacs
(setq split-height-threshold 999)
(setq split-width-threshold 999)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)


;; key remapping
;;(global-set-key "\C-xk"             'kill-this-buffer)
(global-set-key "\C-x/"             'comment-region)
(global-set-key "\C-xu"             'uncomment-region)
(global-set-key (kbd "C-x R")       'eval-and-replace)
(global-set-key (kbd "C--")         'redo)
(global-set-key (kbd "M-g")         'goto-line)
(global-set-key (kbd "M-n")         'forward-paragraph)
(global-set-key (kbd "M-p")         'backward-paragraph)
(global-set-key (kbd "M-t")         'make-frame-command)
(global-set-key "\C-x\C-b"          'ibuffer)
(global-set-key [C-tab]             'insert-4-spaces)
;;(global-set-key "\C-xp"             'insert-printr)
(global-set-key "\C-xp"             'insert-pdb)
(global-set-key "\C-xI"             'insert-html-var)
(global-set-key "\C-xJ"             'insert-html-func)
(global-set-key "\C-xO"             'other-frame)
;;(global-set-key "\C-xe"             'insert-echo)
(global-set-key [f1]                'redraw-display)
(global-set-key [f2]                'rename-buffer)
(global-set-key [f3]                'isearch-repeat-forward)
(global-set-key [f4]                'call-last-kbd-macro)
(global-set-key [C-f5]              'refresh-file)
(global-set-key "\C-c\C-d"          'rdebug)
;;(global-set-key "\C-xR"             'refresh-chrome)
(global-set-key [f9]                'kindent)
(global-set-key [f10]               'swap-windows)
(global-set-key [f11]               'mac-toggle-max-window)

(global-set-key [f5]                'insert-single-comment)
(global-set-key [f6]                'insert-comment)
(global-set-key [f7]                'insert-stamp)
(global-set-key [f8]                'insert-todo)
(global-set-key "\C-w"              'fixup-whitespace)
(global-set-key "\C-y"              'kill-region)
(global-set-key "\C-v"              'yank)
(global-set-key "\C-x="             'balance-windows)
(global-set-key "\C-xl"             'indent-region)
(global-set-key "\C-cl"             'org-store-link)
(global-set-key "\C-ca"             'org-agenda)
(global-set-key "\C-o"              'insert-and-indent-line-above)
;;(global-set-key "\C-\S-tab"        'previous-buffer)
;;(global-set-key "\C-<tab>"         'next-buffer)
;;(global-set-key "\C-c\C-k"         'kill-region)
;;(global-set-key "\C-<delete>"       'c-hungry-delete-forward)
;;(global-set-key "\C-<backspace>"    'c-hungry-delete-backwards)


(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
;(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)



; eliminate cruft on the screen every time we switch buffers (often).

;; (global-set-key "\C-xb"
;;                 (lambda ()
;;                   (interactive)
;;                   (redraw-display)
;;                   (iswitchb-buffer)))

;; (global-set-key "\C-x\C-r"
;;                 (lambda ()
;;                   (interactive)
;;                   (redraw-display)
;;                   (bury-buffer)))

(defalias 'qrr                      'query-replace-regexp)
(defalias 'rr                       'replace-regexp)
(defalias 'lml                      'list-matching-lines)
(defalias 'paste                    'clipboard-yank)
(defalias 'cut                      'clipboard-kill-region)
(defalias 'clear                    'desktop-clear)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SQLi mode customization
(defun sql-add-newline-first (output)
  "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
  (concat "\n" output))
(defun sqli-add-hooks ()
  "Add hooks to `sql-interactive-mode-hook'."
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))
(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DESKTOP maintenance.  Need to save the desktop in ~ to get it to work.
;;; this needs to be last so that vm loads ok
(load "desktop")
;;; save a list of open files in ~/.emacs.desktop
;;; save the desktop file automatically if it already exists
(setq desktop-save 'if-exists)
(desktop-save-mode 1)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(desktop-load-default)
(desktop-read)


(add-to-list 'auto-mode-alist '("\\.tpl\\'" . sgml-mode))
