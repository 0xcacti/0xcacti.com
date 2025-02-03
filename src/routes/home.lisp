(in-package #:0xcacti-website.routes)

(defun home-handler ()
  (setf (ht:content-type*) "text/html")
  (components:with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex flex-col flex-1 justify-between items-center"
     (:div :class "text-xl w-full flex justify-center items-center text-center"
      "Christian, software engineer, programming language nerd, ascii art fan")
      
     (:div :class "w-full flex-1 grid grid-cols-1 lg:grid-cols-2 gap-4" 

      (:div :class "flex flex-col justify-center min-h-full rounded-lg border-4 border-gray-300" 
       (:div :class "pt-2 pl-2"
          "Recent Projects")

       (:div 
       :class "flex flex-col w-full h-full"
       (:div 
        :class "w-full rounded-lg border-t-4 border-b-4 border-gray-300 p-4"
        (:div :class "flex flex-col sm:flex-row items-start sm:items-center gap-4"
              (:div :class "flex items-center gap-4"  
                    (components:cl-logo :class "h-6 w-6 hover:text-red-500")
                    (:a :href "https://github.com/0xcacti/0xcacti.com" :class "hover:text-red-500" "0xcacti.com"))
              (:div :class "hidden sm:block w-0.5 self-stretch bg-gray-300 mx-2")
              (:div :class "text-sm sm:text-base"
                    "my personal website in common lisp + htmx")))
       (:div 
        :class "w-full rounded-lg border-t-4 border-b-4 border-gray-300 p-4"
        (:div :class "flex flex-col sm:flex-row items-start sm:items-center gap-4"
              (:div :class "flex items-center gap-4"  
                    (components:cl-logo :class "h-6 w-6 hover:text-red-500")
                    (:a :href "https://github.com/0xcacti/0xcacti.com" :class "hover:text-red-500" "0xcacti.com"))
              (:div :class "hidden sm:block w-0.5 self-stretch bg-gray-300 mx-2")
              (:div :class "text-sm sm:text-base"
                    "my personal website in common lisp + htmx")))
        ))

      (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full"
       "Languages")
      )

     (:div :class "flex justify-center items-center w-full h-[145px] border-4 rounded-lg border-gray-300 px-2"
      (:div :class "flex flex-row items-end max-w-full overflow-x-scroll [scrollbar-gutter:stable] hover:overflow-x-scroll pb-2" 
          (:div 
           :id "chart-container"
           :class "w-fit"
            (components:contributions-chart 
              :box-width 10
              :box-margin 2 
              :text-height 15 
              :scale-factor 1.0))
        (:div :class "px-2"
          (:select 
            :class "-ml-10 px-4 py-2 bg-gray-100 rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-red-500 relative z-10"
            :name "year"
            :hx-get "/contributions"
            :hx-target "#chart-container"
            :hx-trigger "change"
            :hx-include "this"
            (:option :value "2025" "2025")
            (:option :value "2024" "2024")
            (:option :value "2023" "2023")
            (:option :value "2022" "2022"))))

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



(defun contributions-handler ()
  (setf (hunchentoot:content-type*) "text/html")
  (who:with-html-output-to-string (*standard-output*)
  (let ((year (parse-integer (or (ht:get-parameter "year") "2025"))))
    (components:contributions-chart
      :year year 
      :box-width 10 
      :box-margin 2 
      :text-height 15 
      :scale-factor 1.0))))
