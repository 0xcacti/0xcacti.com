(in-package #:0xcacti-website.routes)

(defvar *route-handlers*
  `(("/" . home-handler)
    ("/contributions" . contributions-handler)
    ("/languages" . languages-handler)))

(defun register-routes ()
  (loop for (uri . handler) in *route-handlers* do 
    (push 
      (ht:create-prefix-dispatcher uri handler)
      ht:*dispatch-table*)))

(defun setup-routes ()
  (setf ht:*dispatch-table* nil)
  (register-routes)
  (format t "~&Routes registered successfully.~%"))



