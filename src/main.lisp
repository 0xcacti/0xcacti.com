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

(defmacro with-base-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t)
     (:html
      (:head
       (:title ,title)
       (:script :src "/static/htmx.min.js")
       (:script :src "https://cdn.tailwindcss.com"))
      (:body
       ,@body))))


(define-easy-handler (home :uri "/") ()
  (setf (content-type*) "text/html")
  (with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex justify-between items-center px-4 py-8 border-2 border-emerald-500"
     (:div :class "flex justify-center items-center"
      (:h1 "Hello, Sailor"))
     (:div :class "flex justify-center items-center"
      (:a :href "/about" "about"))
    )
    ))

(define-easy-handler (projects :uri "/about") () 
  (setf (content-type*) "text/html")
  (with-base-page (:title "About")
    (:div :class "container mx-auto flex justify-center items-center px-4 py-8 border-2 border-emerald-500"
    (:h1 "About"))))
