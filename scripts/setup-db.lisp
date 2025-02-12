(ql:quickload :0xcacti-website)  
(in-package :0xcacti-website)

;; Setup the db file and do migrations
(0xcacti-website.db:init-db)

;; Verify the db setup
(0xcacti-website.db:verify-db-setup)

;; Backfill the historical data
(0xcacti-website.db:populate-historical-data "0xcacti")

;; Get the contributions for the year 2025
(0xcacti-website.db:get-contributions 2025)

