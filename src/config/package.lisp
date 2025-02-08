(defpackage #:0xcacti-website.config
  (:use #:cl)
  (:export #:*config*
           #:make-config
           #:load-env-file
           #:get-github-token
           #:get-db-path
           #:get-db-schema-path))
