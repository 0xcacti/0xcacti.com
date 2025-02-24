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

(defmacro contributions-chart (&key (year 2025) (box-width 10) (box-margin 2) (text-height 15) (scale-factor 1.0))
  `(with-html-output (*standard-output*)
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
                               do (decf days-left-in-year)
                               (htm
                                 (:rect
                                  :x 0
                                  :y (* day (+ box-width box-margin))
                                  :width box-width
                                  :height box-width
                                  :rx (/ box-width 4)  
                                  :fill (assign-color
                                         (getf 
                                           (nth (- days-in-year days-left-in-year) filtered-data)
                                           :level))
                                  )))))
                         ((= week 52)
                          (let ((remaining days-left-in-year))
                          (loop for day from 0 below remaining
                                for index = (- days-in-year days-left-in-year)
                                do (decf days-left-in-year)
                                do
                                  (htm
                                    (:rect
                                     :x 0
                                     :y (* day (+ box-width box-margin))
                                     :width box-width
                                     :height box-width
                                     :rx (/ box-width 4)  
                                     :fill (assign-color 
                                          (getf 
                                            (nth index filtered-data)
                                            :level))
                                    )))))
                         (t
                          (loop for day from 0 to 6
                                do (decf days-left-in-year)
                                (htm
                                  (:rect
                                   :x 0
                                   :y (* day (+ box-width box-margin))
                                   :width box-width
                                   :height box-width
                                   :rx (/ box-width 4)  
                                   :fill (assign-color 
                                          (getf 
                                            (nth (- days-in-year days-left-in-year) filtered-data)
                                            :level))

                                   ))))))))))))))))
