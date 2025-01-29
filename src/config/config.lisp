(in-package #:0xcacti-website.config)

(defclass config ()
  ((github-token :initarg :github-token 
                 :reader get-github-token
                 :type string)))

(defun load-env-file (&optional (path ".env"))
  (with-open-file (stream path :if-does-not-exist nil)
    (when stream
      (loop for line = (read-line stream nil nil)
            while line
            when (and (> (length line) 0)
                     (not (char= (char line 0) #\#)))
            do (let* ((parts (str:split "=" line))
                     (key (string-trim " " (first parts)))
                     (value (string-trim " " (second parts))))
                 (setf (uiop:getenv key) value))))))

(defun make-config ()
  (load-env-file)
  (make-instance 'config
                 :github-token (or (uiop:getenv "GITHUB_TOKEN")
                                   (error "GITHUB_TOKEN environment variable not set"))))

(defparameter *config* (make-config))
