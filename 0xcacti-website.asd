(asdf:defsystem #:0xcacti-website
  :description "A website built with Common Lisp and HTMX"
  :author "0xcacti"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:hunchentoot
               :cl-who
               :parenscript
               :str)   
  :components ((:module "src"
                :components ((:file "package")
                             (:file "main")))))

