(defpackage #:0xcacti-website.routes
  (:use #:cl #:hunchentoot #:cl-who #:cl-json #:dexador)
  (:local-nicknames (:components #:0xcacti-website.components))
  (:export #:setup-routes))
