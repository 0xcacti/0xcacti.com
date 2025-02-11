(defpackage #:0xcacti-website.db
  (:use #:cl
        #:sqlite)
  (:local-nicknames (:config #:0xcacti-website.config)
                    (:services #:0xcacti-website.services))
  (:export
    :init-db
    :verify-db-setup
    :populate-historical-data))
