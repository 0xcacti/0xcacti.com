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

      (:svg 
      :width "722"
      :height "112"
      :viewBox "0 0 722 112" 
      (let ((box-width 10)
            (box-margin 2)
            (text-height 15))

        (htm
          (:g
           :transform "translate(0, 30)"
           (loop for day from 0 below 7 
            when (member day '(1 3 5)) 
            collect
            (htm
              (:text 
               :x 0
               :y (write-to-string (- (* (1+ day) (+ box-width box-margin)) 2))
               :fill "#5c6ac4"
               (str (nth day '("Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"))))))))


        (htm
          (:g 
            :transform "translate(40, 20)"
            (let* ((first-date (encode-universal-time 0 0 0 1 1 2024))
                   (first-day-in-year (get-first-day-of-year 2024))
                   (last-month -1))
            (loop for week from 0 to 52 
                  for date = (- (+ first-date (* week 7 24 60 60)) (* first-day-in-year 24 60 60))
                  for month = (nth-value 4 (decode-universal-time date))
                  do (format t "~%Week: ~A, Month: ~A" week month) ; Debug print
                  when (/= month last-month)
                  collect
                  (progn 
                    (setf last-month month)
                    (htm
                        (:text 
                         :x (write-to-string (* week (+ box-width box-margin)))
                         :y 0
                         :fill "#5c6ac4"
                          (if (= week 0)
                              (str "Jan") 
                              (str (nth (1- month) '("" "Feb" "Mar" "Apr" "May" "Jun" 
                                                   "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")))))))))))

        (htm
          (:g 
           :transform "translate(40, 30)"
          (let ((days-in-year (get-number-of-days-in-year 2024)))
            (loop for week from 0 to 52 do
              (htm
                (:g 
                  :transform (format nil "translate(~A, 0)" (* week 12))
                 (cond 
                  ((= week 0)
                   (let ((day-idx (get-first-day-of-year 2024)))
                    (loop for day from day-idx to 6 
                        do (decf days-in-year)
                        collect 
                          (htm
                             (:rect 
                              :x 0
                              :y (* day 12)
                              :width 10 
                              :height 10 
                              :fill "#5c6ac4")))))
                  ((= week 52)
                   (loop for day from 0 below days-in-year collect
                         (htm 
                           (:rect 
                            :x 0
                            :y (* day 12)
                            :width 10 
                            :height 10 
                            :fill "#5c6ac4"))))
                  (t 
                    (loop for day from 0 to 6 
                        do (decf days-in-year)
                        collect 
                          (htm
                             (:rect 
                              :x 0
                              :y (* day 12)
                              :width 10 
                              :height 10 
                              :fill "#5c6ac4")))))))))))))
        

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

;; <svg width={width} height={height} viewBox={`0 0 ${width} ${height}`}>
;;   {/* Week groups */}
;;   <g transform={`translate(${(blockSize + blockMargin) * weekIndex}, 0)`}>
;;     {/* Individual day rectangles */}
;;     <rect
;;       x={0}
;;       y={labelHeight + (blockSize + blockMargin) * dayIndex}
;;       width={blockSize}
;;       height={blockSize}
;;       rx={blockRadius}
;;       ry={blockRadius}
;;       fill={colorScale[activity.level]}
;;       data-date={activity.date}
;;       data-level={activity.level}
;;     />
;;   </g>
;; </svg>

;; 0 1 2 3 4 5 6
;; m t w t f s s

;; + 1

;; returns the 1st day of year from 0 - 6 
(defun get-first-day-of-year (year)
  (let* ((date (encode-universal-time 0 0 0 1 1 year))
         (day-index (nth-value 6 (decode-universal-time date))))
    (mod (+ day-index 1) 7)))


(defun get-number-of-days-in-year (year)
  (cond 
      ((and (zerop (mod year 4)) (or (not (mod year 100)) (mod year 400))) 366)
      (t 365)))

(defun get-contributions (username token (&key year 2025))
  (let* ((start-time ""
         (end-time "")))
    (cond 
      ((= year 2025)
          (setf start-time "2025-01-01T00:00:00Z")
          (setf end-time "2025-12-31T23:59:59Z"))
      ((= year 2024)
          (setf start-time "2024-01-01T00:00:00Z")
          (setf end-time "2024-12-31T23:59:59Z"))
      ((= year 2023)
          (setf start-time "2023-01-01T00:00:00Z")
          (setf end-time "2023-12-31T23:59:59Z"))
      ((= year 2022)
          (setf start-time "2022-01-01T00:00:00Z")
          (setf end-time "2022-12-31T23:59:59Z"))
      (t 
       (setf start-time "2025-01-01T00:00:00Z")
       (setf end-time "2025-12-31T23:59:59Z")))

    (let ((query "
       query($username: String!, $from: DateTime, $to: DateTime) {
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
      }"))
      (dex:post "https://api.github.com/graphql"
                :headers `(("Authorization" . ,(format nil "Bearer ~A" token)))
                :content (cl-json:encode-json 
                           '(:query query 
                             :variables 
                              (:username username
                               :from start-time
                               :to end-time)))))))


