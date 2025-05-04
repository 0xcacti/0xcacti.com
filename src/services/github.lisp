(in-package #:0xcacti-website.services)

(defun assign-level (c-count)
  (cond ((= c-count 0) 0)
        ((<= c-count 3) 1) 
        ((<= c-count 6) 2)
        ((<= c-count 9) 3)
        (t 4)))


(defun filter-contributions (contributions) 
  (let* ((data (cdr (assoc :data contributions)))
         (user (cdr (assoc :user data)))
         (contrib-collection (cdr (assoc :CONTRIBUTIONS-COLLECTION user)))
         (contrib-cal (cdr (assoc :CONTRIBUTION-CALENDAR contrib-collection)))
         (weeks (cdr (assoc :WEEKS contrib-cal))))
  (loop for week in weeks append
      (loop for day in (cdr (assoc :CONTRIBUTION-DAYS week)) collect
            (list 
              :date (cdr (assoc :DATE day))
              :count (cdr (assoc :CONTRIBUTION-COUNT day))
              :level (assign-level (cdr (assoc :CONTRIBUTION-COUNT day))))))))

(defun get-contributions (username year)
  (let* ((token (config:get-github-token config:*config*))
         (start-time (format nil "~A-01-01T00:00:00Z" year))
         (end-time (format nil "~A-12-31T23:59:59Z" year))
         (query "query($username: String!, $from: DateTime, $to: DateTime) {
                  user(login: $username) {
                    contributionsCollection(from: $from, to: $to) {
                      contributionCalendar {
                        totalContributions
                        weeks {
                          contributionDays {
                            contributionCount
                            date
                          }
                        }
                      }
                    }
                  }
                }")
         (payload (cl-json:encode-json-to-string  
                   `(("query" . ,query)
                     ("variables" . (("username" . ,username)
                                   ("from" . ,start-time)
                                   ("to" . ,end-time))))))
         (response (dk:http-request "https://api.github.com/graphql"
                    :method :post
                    :content-type "application/json"
                    :additional-headers `(("Authorization" . ,(format nil "Bearer ~A" token)))
                    :content payload)))
    (cl-json:decode-json-from-string 
      (babel:octets-to-string response :encoding :utf-8))))


(defun get-filtered-contributions (username year) 
     (let* ((contributions (get-contributions "0xcacti" year))
            (filtered-data (filter-contributions contributions)))
        (format t "First dates: ~{~a ~}~%" 
            (loop for i from 0 to 5 
                  collect (getf (nth i filtered-data) :date)))
      filtered-data))
