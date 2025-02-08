(in-package :0xcacti-website.db)

(defun read-schema () 
  "Read schema.sql file contents" 
  (with-open-file (stream config:get-db-schema-path)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))


(defun verify-db-setup ()
  "Check if DB exists and is properly initialized"
  (handler-case 
    (sqlite:with-open-database (db (config:get-db-path))
      (sqlite:execute-single db 
        "SELECT version FROM schema_info ORDER BY version DESC LIMIT 1"))
    (sqlite:sqlite-error () 
      (error "DB not properly initialized"))))


(defun init-db ()
  "Initialize DB with schema - only call this explicitly when setting up"
  (ensure-directories-exist (directory-namestring (config:get-db-path)))
  (sqlite:with-open-database (db (config:get-db-path))
    (sqlite:execute-non-query db (read-schema))))
