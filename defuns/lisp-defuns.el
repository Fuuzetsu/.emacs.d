;; Lisp specific defuns

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun eval-and-insert ()
  "Insert the value of preceding sexp after it."
  (interactive)
  (backward-kill-sexp)
  (let ((e (with-temp-buffer
             (yank)
             (buffer-string))))
    (condition-case nil
        (progn
          (yank)
          (insert " => ")
          (prin1 (eval (read e))
                 (current-buffer)))
      (error (message "Invalid expression")
             (insert (current-kill 0))))))


(defun yank-peek ()
  (with-temp-buffer
    (yank)
    (buffer-string)))
