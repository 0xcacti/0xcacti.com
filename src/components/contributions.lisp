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
     (let* ((box-width-pct 1.385) ; 0.0138504155 * 100
            (box-height-pct 8.197) ; 0.0819672131 * 100
            (box-margin-pct 0.3)   ; 0.003 * 100
            (left-offset-pct 5.540) ; 0.055401662 * 100
            (day-above-offset-pct 24.590) ; 0.2459016393 * 100
            (month-top-offset-pct 16.393)) ; 0.1639344262 * 100)
       (htm
         (:svg 
          :class "w-full h-full"
          :width "100%"    
          :height "100%"   
          :viewBox "0 0 100 100"
          :preserveAspectRatio "xMidYMid meet"
          
          ;; Day labels
          (htm
            (:g
             :transform (format nil "translate(0, ~A)" day-above-offset-pct)
             (loop for day from 0 below 7
                when (member day '(1 3 5))
                do
                  (htm
                    (:text
                     :x "0"
                     :y (format nil "~A" (* (1+ day) (+ box-height-pct box-margin-pct)))
                     :fill "#5c6ac4"
                     :class "text-xs"
                     (str (nth day '("Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"))))))))

          ;; Month labels
          (htm
            (:g
             :transform (format nil "translate(~A, ~A)" left-offset-pct month-top-offset-pct)
             (let* ((first-date (encode-universal-time 0 0 0 1 1 2024))
                    (first-day-in-year (get-first-day-of-year 2024))
                    (last-month -1))
               (loop for week from 0 to 52
                     for date = (- (+ first-date (* week 7 24 60 60)) 
                                 (* first-day-in-year 24 60 60))
                     for month = (nth-value 4 (decode-universal-time date))
                     when (/= month last-month)
                     do
                       (progn
                         (setf last-month month)
                         (htm
                           (:text
                            :x (format nil "~A" (* week (+ box-width-pct box-margin-pct)))
                            :y "0"
                            :fill "#5c6ac4"
                            :class "text-xs"
                            (if (= week 0)
                                (str "Jan")
                                (str (nth (1- month) 
                                        '("" "Feb" "Mar" "Apr" "May" "Jun" 
                                          "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")))))))))))

          ;; Contribution boxes
          (htm
            (:g
             :transform (format nil "translate(~A, ~A)" left-offset-pct day-above-offset-pct)
             (let ((days-in-year (get-number-of-days-in-year 2024)))
               (loop for week from 0 to 52 do
                     (htm
                       (:g
                        :transform (format nil "translate(~A, 0)" 
                                        (* week (+ box-width-pct box-margin-pct)))
                        (cond 
                         ((= week 0)
                          (let ((day-idx (get-first-day-of-year 2024)))
                            (loop for day from day-idx to 6
                               do (decf days-in-year)
                               (htm
                                 (:rect
                                  :x "0"
                                  :y (format nil "~A" (* day (+ box-height-pct box-margin-pct)))
                                  :width (format nil "~A" box-width-pct)
                                  :height (format nil "~A" box-height-pct)
                                  :fill "#5c6ac4")))))
                         ((= week 52)
                          (loop for day from 0 below days-in-year
                                do
                                  (htm
                                    (:rect
                                     :x "0"
                                     :y (format nil "~A" (* day (+ box-height-pct box-margin-pct)))
                                     :width (format nil "~A" box-width-pct)
                                     :height (format nil "~A" box-height-pct)
                                     :fill "#5c6ac4"))))
                         (t
                          (loop for day from 0 to 6
                                do (decf days-in-year)
                                (htm
                                  (:rect
                                   :x "0"
                                   :y (format nil "~A" (* day (+ box-height-pct box-margin-pct)))
                                   :width (format nil "~A" box-width-pct)
                                   :height (format nil "~A" box-height-pct)
                                   :fill "#5c6ac4")))))))))))))))
