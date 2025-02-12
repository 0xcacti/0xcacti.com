(defpackage #:0xcacti-website.routes
  (:use #:cl)
  (:local-nicknames (:config #:0xcacti-website.config)
                    (:db #:0xcacti-website.db)
                    (:components #:0xcacti-website.components)
                    (:ht #:hunchentoot)
                    (:who #:cl-who))
  (:export #:setup-routes))
