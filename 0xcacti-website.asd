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
               :babel)   
  :components 
  ((:module "src"
    :serial t
    :components 
    ((:module "config" 
      :serial t
      :components
      ((:file "package")
       (:file "config")))
     (:module "components" 
      :serial t
      :depends-on ("config")
      :components
      ((:file "package")
       (:file "base")
       (:file "icons")
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
