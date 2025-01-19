(in-package #:0xcacti-website)

(defun start-app (&key (port 3000))
  (routes:setup-routes)
  (start-server port))

(defun stop-app ()
  (stop-server))



