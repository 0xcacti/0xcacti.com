(in-package :0xcacti-website.db)

(defparameter *first-year* 2022)

(defun read-schema () 
  "Read schema.sql file contents" 
  (with-open-file (stream (config:get-db-schema-path config:*config*))
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun verify-db-setup ()
  "Check if DB exists and is properly initialized"
  (handler-case 
    (sqlite:with-open-database (db (config:get-db-path config:*config*))
      (sqlite:execute-single db 
        "SELECT version FROM schema_info ORDER BY version DESC LIMIT 1"))
    (sqlite:sqlite-error () 
      (error "DB not properly initialized"))))

(defun init-db ()
  "Initialize DB with schema - only call this explicitly when setting up"
  (ensure-directories-exist (directory-namestring (config:get-db-path config:*config*)))
  (sqlite:with-open-database (db (config:get-db-path config:*config*))
    (let ((schema (read-schema)))
      ;; Split on semicolons and filter out empty statements
      (dolist (statement (remove-if 
                         (lambda (s) (string= "" (string-trim '(#\Space #\Newline #\Tab) s)))
                         (str:split ";" schema)))
        (sqlite:execute-non-query db (string-trim '(#\Space #\Newline #\Tab) statement))))))

(defun get-contributions (year)
  (sqlite:with-open-database (db (config:get-db-path config:*config*))
    (mapcar (lambda (row)
      (destructuring-bind (date count level) row
        `(:date ,date :count ,count :level ,level)))
    (sqlite:execute-to-list
      db 
      "SELECT date, count, level FROM contributions WHERE strftime('%Y', date) = ?"
      (write-to-string year)))))

(defun insert-contribution (date count level) 
  (sqlite:with-open-database (db (config:get-db-path config:*config*))
    (sqlite:execute-non-query 
      db 
      "INSERT OR REPLACE INTO contributions (date, count, level) VALUES (?, ?, ?)"
      date count level)))

(defun update-year (year) 
  (let ((contributions (services:get-filtered-contributions "0xcacti" year)))
    (when (null contributions)
      (ht:log-message* "No contributions found for year ~a" year)) 
    (dolist (contrib contributions) 
      (insert-contribution 
        (getf contrib :date)
        (getf contrib :count)
        (getf contrib :level)))))


(defun populate-historical-data (username)
  (let ((current-year (nth-value 5 (get-decoded-time))))
    (loop for year from *first-year* to current-year do 
      (let ((contributions (services:get-filtered-contributions username year)))
        (dolist (contrib contributions) 
          (insert-contribution 
            (getf contrib :date)
            (getf contrib :count)
            (getf contrib :level)))))))

