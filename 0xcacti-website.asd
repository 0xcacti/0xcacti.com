(asdf:defsystem #:0xcacti-website
  :description "A website built with Common Lisp and HTMX"
  :author "0xcacti"
  :license  "MIT"
  :version "0.0.1"
  :depends-on (:hunchentoot
               :cl-who
               :parenscript
               :str
               :drakma 
               :cl-json
               :babel
               :sqlite)   
  :components 
  ((:module "src"
    :serial t
    :components 
    ((:module "config" 
      :serial t
      :components
      ((:file "package")
       (:file "config")))
     (:module "services"
      :serial t
      :depends-on ("config")
      :components
      ((:file "package")
       (:file "github")))
     (:module "db" 
      :serial t 
      :depends-on ("config")
      :components 
      ((:file "package")
       (:file "db")))
     (:module "components" 
      :serial t
      :depends-on ("config")
      :components
      ((:file "package")
       (:file "base")
       (:file "icons")
       (:file "language")
       (:file "project")
       (:file "contributions")))
     (:module "routes" 
      :serial t
      :depends-on ("components")
      :components
      ((:file "package")
       (:file "routes")
       (:file "home")))
     (:file "package")
     (:file "server")
     (:file "main")))))
