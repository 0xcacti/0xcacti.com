(in-package #:0xcacti-website.routes)

(defun home-handler ()
  (setf (content-type*) "text/html")
  (components:with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex flex-col flex-1 justify-between items-center"
     (:div :class "text-xl w-full flex justify-center items-center border-4 border-emerald-500"
      "Christian, software engineer, programming language nerd, ascii art fan")
      
     (:div :class "w-full flex-1 grid grid-cols-1 lg:grid-cols-2 gap-4" 
      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full" 
       "Recent Projcts")
      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full"
       "Languages")
      )

     (:div :class "flex justify-end items-center w-full border-4 border-emerald-500 "

      (:div :class "flex-grow flex justify-center items-center"
        (str (components:contributions-chart)))   
        

      (:pre :class "text-red-500" "    |\\_ /|   
   ( o  o )
    > . <&#47;
    |    \\
    |  |  \\
    |  |   | 
   (_(_f_, ) 0xcacti
         //
        ((
         ))  
        ((
         v")))))


;;(defun get-contributions (username token (&key year 2025))
;;  (let* ((start-time ""
;;         (end-time "")))
;;    (cond 
;;      ((= year 2025)
;;          (setf start-time "2025-01-01T00:00:00Z")
;;          (setf end-time "2025-12-31T23:59:59Z"))
;;      ((= year 2024)
;;          (setf start-time "2024-01-01T00:00:00Z")
;;          (setf end-time "2024-12-31T23:59:59Z"))
;;      ((= year 2023)
;;          (setf start-time "2023-01-01T00:00:00Z")
;;          (setf end-time "2023-12-31T23:59:59Z"))
;;      ((= year 2022)
;;          (setf start-time "2022-01-01T00:00:00Z")
;;          (setf end-time "2022-12-31T23:59:59Z"))
;;      (t 
;;       (setf start-time "2025-01-01T00:00:00Z")
;;       (setf end-time "2025-12-31T23:59:59Z")))
;;
;;    (let ((query "
;;       query($username: String!, $from: DateTime, $to: DateTime) {
;;         user(login: $username) {
;;           contributionsCollection(from: $from, to: $to) {
;;             contributionCalendar {
;;               totalContributions
;;               weeks {
;;                 contributionDays {
;;                   contributionCount
;;                   date
;;                 }
;;               }
;;             }
;;           }
;;         }
;;      }"))
;;      (dex:post "https://api.github.com/graphql"
;;                :headers `(("Authorization" . ,(format nil "Bearer ~A" token)))
;;                :content (cl-json:encode-json 
;;                           '(:query query 
;;                             :variables 
;;                              (:username username
;;                               :from start-time
;;                               :to end-time)))))))
;;
;;
