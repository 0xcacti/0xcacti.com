(in-package #:0xcacti-website.components)

(defun get-first-day-of-year (year)
  (let* ((date (encode-universal-time 0 0 0 1 1 year))
         (day-index (nth-value 6 (decode-universal-time date))))
    (mod (+ day-index 1) 7)))

(defun get-number-of-days-in-year (year)
  (cond 
      ((and (zerop (mod year 4)) (or (not (mod year 100)) (mod year 400))) 366)
      (t 365)))

(defun assign-color (level) 
  (cond ((= level 0) "#ebedf0")
        ((= level 1) "#9be9a8")
        ((= level 2) "#40c463")
        ((= level 3) "#30a14e")
        ((= level 4) "#216e39")))

(defun format-date-with-ordinal (date-string count) 
  (let* ((year-month-day (cl-ppcre:split "-" date-string))
         (month-num (parse-integer (second year-month-day)))
         (day-num (parse-integer (third year-month-day)))
         (month-names #("" "January" "February" "March" "April" "May" "June" 
                        "July" "August" "September" "October" "November" "December"))
         (month-name (aref month-names month-num))
         (no-or-num  (if (> count 0) 
                        (format nil "~D" count)
                        "No"))
         (should-pluralize (cond ((= count 0) "contributions")
                                 ((= count 1) "contribution")
                                 (t "contributions")))
         (day-with-suffix (format nil "~D~A" 
                                  day-num 
                                  (cond ((and (>= day-num 11) (<= day-num 13)) "th")
                                        ((= (mod day-num 10) 1) "st")
                                        ((= (mod day-num 10) 2) "nd")
                                        ((= (mod day-num 10) 3) "rd")
                                        (t "th")))))
    (format nil "~A ~A on ~A ~A."
            no-or-num should-pluralize month-name day-with-suffix)))


(defmacro contributions-chart (&key (year 2025) (box-width 10) (box-margin 2) (text-height 15) (scale-factor 1.0))
  `(with-html-output (*standard-output* nil :prologue t)
     (let* ((height (* 722 ,scale-factor))
            (width (* 112 ,scale-factor))
            (box-width (* ,box-width ,scale-factor))
            (box-margin (* ,box-margin ,scale-factor))
            (text-height (* ,text-height ,scale-factor))
            (above-offset (* ,text-height 2))
            (left-offset (+ (* ,box-width 2) 15))
            (days-in-year (get-number-of-days-in-year ,year))
            (days-left-in-year days-in-year)  
            (first-date (encode-universal-time 0 0 0 1 1 ,year))
            (first-day-in-year (get-first-day-of-year ,year))
            (filtered-data (db:get-contributions ,year))) 

       (htm
         (:svg 
          :xmlns "http://www.w3.org/2000/svg"
          :width "722"
          :height "112"
          :viewBox (format nil "0 0 ~A ~A" height width)
          :preserveAspectRatio "xMidYMid meet"
          
          (htm
            (:g
             :transform (format nil "translate(0, ~A)" above-offset)
             (loop for day from 0 below 7
                when (member day '(1 3 5))
                do
                  (htm
                    (:text
                     :x 0
                     :y (write-to-string (- (* (1+ day) (+ box-width box-margin)) 2))
                     :fill "#000000"
                     :style (format nil "font-size: ~Apx;" ,text-height) 
                     (str (nth day '("Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"))))))))

          (htm
            (:g
             :transform (format nil "translate(~A, ~A)" left-offset (/ above-offset 2))
             (let* ((last-month -1))
               (loop for week from 0 to 52
                     for date = (- (+ first-date (* week 7 24 60 60)) (* first-day-in-year 24 60 60))
                     for month = (nth-value 4 (decode-universal-time date))
                     when (/= month last-month)
                     do
                       (progn
                         (setf last-month month)
                         (htm
                           (:text
                            :x (write-to-string (* week (+ box-width box-margin)))
                            :y 0
                            :fill "#000000"
                            :style (format nil "font-size: ~Apx;" ,text-height) 
                            (if (= week 0)
                                (str "Jan")
                                (str (nth (1- month) '("" "Feb" "Mar" "Apr" "May" "Jun" 
                                                     "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"))))))))))

          (htm
            (:g
             :transform (format nil "translate(~A, ~A)" left-offset above-offset)
               (loop for week from 0 to 52 do
                     (htm
                       (:g
                        :transform (format nil "translate(~A, 0)" (* week (+ box-width box-margin)))
                        (cond 
                         ((= week 0)
                          (let ((day-idx (get-first-day-of-year ,year)))
                            (loop for day from day-idx to 6
                             for idx = (- days-in-year days-left-in-year)
                             for datum = (nth idx filtered-data)
                             for date = (getf datum :date) 
                             for cnt = (getf datum :count)
                             for level = (getf datum :level)
                             do (decf days-left-in-year)
                             do
                               (htm
                                 (:rect
                                  :x 0
                                  :y (* day (+ box-width box-margin))
                                  :width box-width
                                  :height box-width
                                  :rx (/ box-width 4)  
                                  :fill (assign-color level)
                                  :data-tooltip (format-date-with-ordinal date cnt)
                                  )))))
                         ((= week 52)
                          (let ((remaining days-left-in-year))
                          (loop for day from 0 below remaining
                                for index = (- days-in-year days-left-in-year)
                                for datum = (nth index filtered-data)
                                for date = (getf datum :date)
                                for cnt = (getf datum :count)
                                for level = (getf datum :level)
                                do (decf days-left-in-year)
                                do
                                  (htm
                                    (:rect
                                     :x 0
                                     :y (* day (+ box-width box-margin))
                                     :width box-width
                                     :height box-width
                                     :rx (/ box-width 4)  
                                     :fill (assign-color level)
                                     :data-tooltip (format-date-with-ordinal date cnt)
                                    )))))
                         (t
                          (loop for day from 0 to 6
                                for idx = (- days-in-year days-left-in-year)
                                for datum = (nth idx filtered-data)
                                for date = (getf datum :date)
                                for cnt = (getf datum :count)
                                for level = (getf datum :level)
                                do (decf days-left-in-year)
                                (htm
                                  (:rect
                                   :x 0
                                   :y (* day (+ box-width box-margin))
                                   :width box-width
                                   :height box-width
                                   :rx (/ box-width 4)  
                                   :fill (assign-color level)
                                   :data-tooltip (format-date-with-ordinal date cnt)

                                   ))))))))))))))))
