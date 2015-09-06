;; license : Free to use.
;; If you share this original file. Notice who is developer

;; Developer : slashdeva(slashdeva@gmail.com)
;; Iamroot.org 12 DTeam

(defun insert-content(tag content)
  (insert (format " * %-15s %s \n" tag content)))

(defun insert-code-detail(content)
  (insert (format " *                %s\n" content)))

(defun insert-comment-seperator()
  (insert (format " * %75s\n" "")))

(defun insert-this-study(n)
  (insert (format " * The "))
  (cond ((eq n '1) (insert "1st"))
		((eq n '2) (insert "2nd"))
		(t (insert (format "%dth" n))))
  (insert " study\n"))

(defun insert-comment-outliner()
  (let (iter)
	(setq iter 0)
	(while (< iter 74)
	  (insert "=")
	  (setq iter (+ iter 1)))))

(defun insert-participants()
  (insert-content "" (format "%-5s (%s)" "slashdeva" "slashdeva@gmail.com"))
)

(defun insert-comment-top-outline()
  (insert "\n/* ")
  (insert-comment-outliner)
  (insert "\n")
)

(defun insert-comment-bottom-outline()
  (insert " * ")
  (insert-comment-outliner)
  (insert "*/\n")
)

(defun insert-daily-report(this-study place participants)
  "insert daily report"
  (interactive "nHow many times do we study about this source code? :\n\
sWhere do we meet? :\nsHow many members participate at today's study? :")
  (insert-comment-top-outline)
  
  (insert-this-study this-study)
  (insert-comment-seperator)
  (insert-content "Date:" (format-time-string "%d.%m.%Y"))
  (insert-content "Place:" place)
  (insert-comment-seperator)
  (insert-participants)
  (insert-comment-seperator)
  (insert-content "" (format "The Number of Participants: %d" (string-to-number participants)))

  (insert-comment-bottom-outline)  
)

(defun insert-file-summary(summary note)
  "insert file's summary, Use it on the head of file"
  (interactive "sPlease summarize this code file. :\nsPlease describe this code file detaily. :")
  (insert-comment-top-outline)

  (insert-content "File Name:" (file-name-nondirectory buffer-file-name))
  (insert-comment-seperator)
  (insert-content "Summary:" summary)
  (insert-content "Note:" note)
  (insert-comment-seperator)
  (insert-content "Team:" "Iamroot ARM Kernel 분석 12차 D조 (http://www.iamroot.org)")
  (insert-content "Date:" (format-time-string "%d.%m.%Y"))

  (insert-comment-bottom-outline)
)

(defun insert-code-review(note)
  "insert file's summary, Use it on the function you want to write on"
  (interactive "sDo you have any comment this function? :")
  (insert-comment-top-outline)
  
  (insert-content "Team:" "Iamroot ARM Kernel 분석 12차 D조 (http://www.iamroot.org)")
  (insert-content "Date:" (format-time-string "%d.%m.%Y"))
  (insert-comment-seperator)
  (insert-content "This code is.." "")
  (insert-code-detail note)
  (insert-code-detail "")
  (insert-code-detail "")

  (insert-comment-bottom-outline)
)

(provide 'auto-comment)
