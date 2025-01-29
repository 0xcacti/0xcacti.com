(in-package #:0xcacti-website.routes)

(defun home-handler ()
  (setf (ht:content-type*) "text/html")
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

     (:div :class "flex justify-center items-center w-full h-[145px] border-4 rounded-lg border-gray-300 px-2"
      (:div :class "flex flex-row items-end max-w-full overflow-x-scroll [scrollbar-gutter:stable] hover:overflow-x-scroll" 
          (:div :class "w-fit"
            (components:contributions-chart 
              :box-width 10
              :box-margin 2 
              :text-height 15 
              :scale-factor 1.0))
          (:select :class "-ml-10 px-4 py-2 bg-gray-100 rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
            (:option :value "2025" "2025")
            (:option :value "2024" "2024")
            (:option :value "2023" "2023")
            (:option :value "2022" "2022")
            (:option :value "2021" "2021")))

      (:pre :class "text-red-500 text-sm" "





    |\\_ /|   
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


(defun get-contributions (username token &key (year 2025))
  (let* ((start-time (format nil "~A-01-01T00:00:00Z" year))
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

