(in-package #:0xcacti-website)

(defvar *server* nil)


(defun start-server (&key (port 3000))
  (when *server*
    (stop-server))
  (setf *server* 
        (make-instance 'easy-acceptor :port port))
  (start *server*)
  (format t "Server started on port ~A~%" port))

(defun stop-server ()
  (when *server* 
    (stop *server*)
    (setf *server* nil)))

(define-easy-handler (hello :uri "/") ()
  (setf (content-type*) "text/html")
  "<h1>Hello, Lindsay")

