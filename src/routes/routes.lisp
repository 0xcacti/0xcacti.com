(in-package #:0xcacti-website.routes)

(defvar *route-handlers*
  `(("/" . home-handler)
    ("/blog" . blog-handler)))

(defun register-routes ()
  (loop for (uri . handler) in *route-handlers* do 
    (push 
      (create-prefix-dispatcher uri handler)
      *dispatch-table*)))

(defun setup-routes ()
  (setf *dispatch-table* nil)
  (register-routes))
