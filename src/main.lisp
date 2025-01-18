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
      (:body :class "min-h-screen flex flex-col"
        (:div :class "container mx-auto flex justify-between items-center px-4 py-8"
               (:div :class "flex justify-center items-center text-4xl"
                     (:a :href "/" "0xcacti"))
               (:div :class "flex justify-center items-center text-2xl"
                     (:a :href "/about" "about")))
       ,@body))))

(define-easy-handler (home :uri "/") ()
  (setf (content-type*) "text/html")
  (with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex flex-col flex-1 justify-between items-center"
     (:div :class "text-xl w-full flex justify-center items-center border-4 border-emerald-500"
      "Christian, software engineer, programming language nerd, ascii art fan")
      
     (:div :class "w-full flex-1 grid grid-cols-1 lg:grid-cols-3 gap-4" ; Added flex-1
      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full" ; Added min-h-full
       "Recent Projcts")
      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full"
       "Languages")
      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full"
       "Section 3"))

     (:div :class "flex justify-end items-center w-full border-4 border-emerald-500 "
      (:pre :class "text-red-500" "    |\\_ /|   
   ( o  o )
    > . <&#47;
    |    \\
    |  |  \\
    |  |   | 
   (_(_f_, ) 0xcacti
         //
        ((
         ))  
        ((
         v")))))

(define-easy-handler (projects :uri "blog") () 
  (setf (content-type*) "text/html")
  (with-base-page (:title "blog")
    (:div :class "container mx-auto flex justify-center items-center px-4 py-8"
    (:h1 "Blog"))))
