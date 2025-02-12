(defpackage #:0xcacti-website.routes
  (:use #:cl)
  (:local-nicknames (:config #:0xcacti-website.config)
                    (:components #:0xcacti-website.components)
                    (:ht #:hunchentoot)
                    (:who #:cl-who))
  (:export #:setup-routes))
