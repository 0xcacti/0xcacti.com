(defpackage #:0xcacti-website.routes
  (:use #:cl)
  (:local-nicknames (:components #:0xcacti-website.components)
                    (:ht #:hunchentoot)
                    (:who #:cl-who)
                    (:json #:cl-json)
                    (:dk #:drakma)
                    (:babel #:babel))
  (:export #:setup-routes))
