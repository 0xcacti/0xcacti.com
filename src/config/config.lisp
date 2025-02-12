(in-package #:0xcacti-website.config)

(defclass config ()
  ((github-token :initarg :github-token 
                 :reader get-github-token
                 :type string)
   (db-path :initarg :db-path 
            :reader get-db-path 
            :type string)
   (db-schema :initarg :db-schema 
              :reader get-db-schema-path
              :type string)
   (secret-api-key :initarg :secret-api-key 
               :reader get-secret-api-key
               :type string)))

(defun load-env-file (&optional (path ".env"))
  (with-open-file (stream path :if-does-not-exist nil)
    (when stream
      (loop for line = (read-line stream nil nil)
            while line
            when (and (> (length line) 0)
                     (not (char= (char line 0) #\#)))
            do (let* ((parts (str:split "=" line :limit 2))
                     (key (string-trim " " (first parts)))
                     (value (string-trim " \"" (second parts))))
                 (setf (uiop:getenv key) value))))))

(defun make-config ()
  (load-env-file)
  (make-instance 'config
                 :github-token (or (uiop:getenv "GITHUB_TOKEN")
                                   (error "GITHUB_TOKEN environment variable not set"))
                 :db-path (or (uiop:getenv "DB_PATH")
                              (error "DB_PATH environment variable not set"))
                 :db-schema (or (uiop:getenv "DB_SCHEMA")
                                (error "DB_SCHEMA environment variable not set"))
                 :secret-api-key (or (uiop:getenv "SECRET_API_KEY")
                                (error "SECRET_API_KEY environment variable not set"))))


(defparameter *config* (make-config))
