;; kill the dired buffers so the buffer list is uncluttered
(defun cider-show-ex ()
  (interactive)
  (setq cider-repl-popup-stacktraces t)
  )

(defun cider-hide-ex ()
  (interactive)
  (setq cider-repl-popup-stacktraces nil)
  )

(defun kill-dired-buffer (b)
  (with-current-buffer b
	(unless (null list-buffers-directory)
		  (kill-buffer (current-buffer)))))

(defun killdirs ()
  (interactive)
  (mapcar (function kill-dired-buffer) (buffer-list)))

;; A function to insert the time stamp at point.
(defun insert-stamp (arg)
  "Insert a comment signature at point"
  (interactive "p")
  (insert "KB: [" (format-time-string "%Y-%m-%d") "]: "))

(defun insert-todo (arg)
  "Insert a TODO: stamp"
  (interactive "p")
  (insert "TODO: KB: [" (format-time-string "%Y-%m-%d") "]: "))

(defun insert-single-comment (arg)
  "Insert a single line comment"
  (interactive "p")
  (if (equal mode-name "Python")
      (progn
        (insert "# "))
    (if (equal mode-name "Clojure")
        (progn
          (insert "; "))
      (progn
        (if (equal mode-name "HTML")
            (progn
              (insert "<!--  -->")
              (backward-char 4))
          (progn
            (insert "// ")))))))

(defun insert-comment (arg)
  "Insert a comment block"
  (interactive "p")
  (if (equal mode-name "Python")
      (progn
        (insert "\"\"\"  \"\"\"")
        (backward-char 4))
    (if (equal mode-name "Clojure")
        (progn
          (insert "; "))
    (if (equal mode-name "HTML")
        (progn
          (insert "<!--  -->")
          (backward-char 4))
      (progn
        (insert "/*  */")
        (backward-char 3))))))

(defun insert-4-spaces (arg)
  "Insert 4 spaces"
  (interactive "p")
  (insert "    "))

(defun insert-printr (arg)
  "Insert a print_r() statement"
  (interactive "p")
  (if (equal mode-name "Python")
      (progn
        (insert "print "))
    (progn
      (insert "print_r();")
      (backward-char 2))))

(defun insert-pdb (arg)
  "Insert a pdb.set_trace() statement"
  (interactive "p")
  (if (equal mode-name "Clojure")
      (progn
        (insert "(println  )")
        (backward-char 2)
        )
    (progn
      (insert "import pdb; pdb.set_trace()")))
  (indent-for-tab-command)
  )

(defun insert-jquery-val (arg)
  "Insert $('#fud').val()"
  (interactive "p")
  (progn
    (insert "$('#').val()")
    (backward-char 8)
    )
    (indent-for-tab-command))

(defun insert-html-var (arg)
  (interactive "p")
  (progn
    ;(insert "{{}}")
    (insert "{%   %}")
    (backward-char 4)))

(defun insert-html-func (arg)
  (interactive "p")
  (progn
    (insert "{%  %}")
    (backward-char 3)))



(defun insert-echo (arg)
  (interactive "p")
  (insert "echo ;")
  (backward-char 1))

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2))
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))

(defun refresh-chrome ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\"
                  activate
                  tell active tab of first window
                        execute javascript \"window.location.reload()\"
                  end tell
               end tell' > /dev/null"))

;; https://github.com/magnars/.emacs.d/blob/master/defuns/lisp-defuns.el
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(fset 'kb-indent
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 tab 14 1] 0 "%d")) arg)))


(defun insert-and-indent-line-above ()
  (interactive)
  (push-mark)
  (let*
    ((ipt (progn (back-to-indentation) (point)))
     (bol (progn (move-beginning-of-line 1) (point)))
     (indent (buffer-substring bol ipt)))
    (newline)
    (previous-line)
    (insert indent)))
