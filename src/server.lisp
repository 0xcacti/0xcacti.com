(in-package #:0xcacti-website)

(defvar *server* nil)

(defvar *static-dir*
  (merge-pathnames #p"static/" (asdf:system-source-directory :0xcacti-website)))

(defun start-server (&key (port 3000))
  (when *server*
    (stop-server))
  (setf *server* 
        (make-instance 'easy-acceptor :port port))
  (push (create-folder-dispatcher-and-handler 
          "/static/" *static-dir*)
        *dispatch-table*)
  (start *server*)
  (format t "Server started on port ~A~%" port))

(defun stop-server ()
  (when *server* 
    (stop *server*)
    (setf *server* nil)))

