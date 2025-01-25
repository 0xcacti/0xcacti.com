(in-package #:0xcacti-website.components)

(defun get-first-day-of-year (year)
  (let* ((date (encode-universal-time 0 0 0 1 1 year))
         (day-index (nth-value 6 (decode-universal-time date))))
    (mod (+ day-index 1) 7)))


(defun get-number-of-days-in-year (year)
  (cond 
      ((and (zerop (mod year 4)) (or (not (mod year 100)) (mod year 400))) 366)
      (t 365)))

(defmacro contributions-chart (&key (box-width 10) (box-margin 2) (text-height 15) (scale-factor 1.0))
  `(with-html-output (*standard-output*)
     (let* ((box-width (* ,box-width ,scale-factor))
            (box-margin (* ,box-margin ,scale-factor))
            (text-height (* ,text-height ,scale-factor))
            (above-offset (* ,text-height 2))
            (left-offset (+ (* ,box-width 2) 10))
            (chart-width (+ (* 52 (+ box-width box-margin)) left-offset))
            (chart-height (+ (* 7 (+ box-width box-margin)) above-offset))
            
            ;; Convert all measurements to percentages
            (box-width-pct (* (/ box-width chart-width) 100))
            (box-margin-pct (* (/ box-margin chart-width) 100))
            (text-height-pct (* (/ text-height chart-height) 100))
            (above-offset-pct (* (/ above-offset chart-height) 100))
            (left-offset-pct (* (/ left-offset chart-width) 100)))
       (htm
         (:svg 
          :class "w-full h-full"
          :width "100%"    
          :height "100%"   
          :viewBox (format nil "0 0 100 100")
          
          ;; Day labels
          (htm
            (:g
             :transform (format nil "translate(0%, ~A%)" above-offset-pct)
             (loop for day from 0 below 7
                when (member day '(1 3 5))
                do
                  (htm
                    (:text
                     :x "0%"
                     :y (format nil "~A%" (* (1+ day) (+ box-width-pct box-margin-pct)))
                     :fill "#5c6ac4"
                     :style (format nil "font-size: ~A%;" text-height-pct)
                     (str (nth day '("Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"))))))))

          ;; Month labels
          (htm
            (:g
             :transform (format nil "translate(~A%, ~A%)" left-offset-pct (/ above-offset-pct 2))
             (let* ((first-date (encode-universal-time 0 0 0 1 1 2024))
                    (first-day-in-year (get-first-day-of-year 2024))
                    (last-month -1))
               (loop for week from 0 to 52
                     for date = (- (+ first-date (* week 7 24 60 60)) (* first-day-in-year 24 60 60))
                     for month = (nth-value 4 (decode-universal-time date))
                     when (/= month last-month)
                     do
                       (progn
                         (setf last-month month)
                         (htm
                           (:text
                            :x (format nil "~A%" (* week (+ box-width-pct box-margin-pct)))
                            :y "0%"
                            :fill "#5c6ac4"
                            :style (format nil "font-size: ~A%;" text-height-pct)
                            (if (= week 0)
                                (str "Jan")
                                (str (nth (1- month) '("" "Feb" "Mar" "Apr" "May" "Jun" 
                                                     "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"))))))))))

          ;; Contribution boxes
          (htm
            (:g
             :transform (format nil "translate(~A%, ~A%)" left-offset-pct above-offset-pct)
             (let ((days-in-year (get-number-of-days-in-year 2024)))
               (loop for week from 0 to 52 do
                     (htm
                       (:g
                        :transform (format nil "translate(~A%, 0)" (* week (+ box-width-pct box-margin-pct)))
                        (cond 
                         ((= week 0)
                          (let ((day-idx (get-first-day-of-year 2024)))
                            (loop for day from day-idx to 6
                               do (decf days-in-year)
                               (htm
                                 (:rect
                                  :x "0%"
                                  :y (format nil "~A%" (* day (+ box-width-pct box-margin-pct)))
                                  :width (format nil "~A%" box-width-pct)
                                  :height (format nil "~A%" box-width-pct)
                                  :fill "#5c6ac4")))))
                         ((= week 52)
                          (loop for day from 0 below days-in-year
                                do
                                  (htm
                                    (:rect
                                     :x "0%"
                                     :y (format nil "~A%" (* day (+ box-width-pct box-margin-pct)))
                                     :width (format nil "~A%" box-width-pct)
                                     :height (format nil "~A%" box-width-pct)
                                     :fill "#5c6ac4"))))
                         (t
                          (loop for day from 0 to 6
                                do (decf days-in-year)
                                (htm
                                  (:rect
                                   :x "0%"
                                   :y (format nil "~A%" (* day (+ box-width-pct box-margin-pct)))
                                   :width (format nil "~A%" box-width-pct)
                                   :height (format nil "~A%" box-width-pct)
                                   :fill "#5c6ac4")))))))))))))))))
