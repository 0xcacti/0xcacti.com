(in-package #:0xcacti-website.components)

(defun get-first-day-of-year (year)
  (let* ((date (encode-universal-time 0 0 0 1 1 year))
         (day-index (nth-value 6 (decode-universal-time date))))
    (mod (+ day-index 1) 7)))


(defun get-number-of-days-in-year (year)
  (cond 
      ((and (zerop (mod year 4)) (or (not (mod year 100)) (mod year 400))) 366)
      (t 365)))


(defmacro contributions-chart (&key (box-width 10) (box-margin 2) (text-height 15))
  `(with-html-output (*standard-output*)     
     (let ((box-width ,box-width)
           (box-margin ,box-margin)
           (text-height ,text-height))
  (htm
    (:svg 
      :width "722"
      :height "112"
      :viewBox "0 0 722 112" 

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
                              :fill "#5c6ac4"))))))))))))))))
