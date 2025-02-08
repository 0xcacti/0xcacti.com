(in-package #:0xcacti-website.routes)

(defun home-handler ()
  (setf (ht:content-type*) "text/html")
  (components:with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex flex-col justify-between items-center gap-3 p-2"
      
     (:div :class "w-full pt-3 flex-1 grid grid-cols-1 lg:grid-cols-2 gap-3" 
      (:div :class "flex flex-col justify-start rounded-lg p-4 border border-gray-300 overflow-y-auto" 
       (:div :class "mb-8 text-2xl font-light text-black"
          "Recent Projects")
       (:div 
        :class "grid gap-4 sm:gap-6"
          (components:project
            :name "0xcacti.com"
            :link "https://github.com/0xcacti/0xcacti.com"
            :language "cl"
            :description "My personal website in common lisp + htmx")

          (components:project 
            :name "chaplet.nvim" 
            :link "https://github.com/0xcacti/chaplet.nvim"
            :language "lua"
            :description "Pray the Rosary and other chaplets while you code")

          (components:project 
            :name "ring" 
            :link "https://github.com/0xcacti/ring"
            :language "rust"
            :description "An implementation of ping in rust")

          (components:project 
            :name "interpreter" 
            :link "https://github.com/0xcacti/interpreter"
            :language "rust"
            :description "An implementation of Thorsten Ball's Monkey language in rust")

          (components:project
            :name "optimized tictactoe"
            :link "https://github.com/0xcacti/tictactoe"
            :language "solidity"
            :description "An optimized version of tictactoe in solidity")
        ))

        (:div :class "flex flex-col justify-start rounded-lg p-4 border border-gray-300 text-xs h-[535px]" 
         (:div :class "flex justify-start text-2xl font-light text-black"
            "Languages"
          (:div :class "flex flex-grow justify-end  gap-1"
           (:button 
            :class "px-2 py-1 rounded border border-gray-300 bg-gray-100 focus:outline-none focus:ring-2 focus:ring-red-500 group"
            :name "language"
            :hx-get "/languages?direction=prev" 
            :hx-target "#languages"
            :hx-trigger "click"
            :onclick "this.blur()"

            (components:arrow-left :class "h-6 w-6 group-hover:text-red-500")
            )
           (:button 
            :class "px-2 py-1 rounded border border-gray-300 bg-gray-100 focus:outline-none focus:ring-2 focus:ring-red-500 group"
            :name "language"
            :hx-get "/languages?direction=next" 
            :hx-target "#languages"
            :hx-trigger "click"
            :onclick "this.blur()"

            (components:arrow-right :class "h-6 w-6 group-hover:text-red-500")
            )
           ))
        (:div :id "languages" :class "flex-1 min-h-0 flex flex-col"
          (components:language :language "go"))

         ))

     (:div :class "flex justify-center items-center w-full h-[150px] border rounded-lg border-gray-300 px-2"
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
            :onchange "this.blur()"
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


(defun get-session-index ()
  (or (hunchentoot:session-value 'language-index) 0))

(defun set-session-index (index)
  (setf (hunchentoot:session-value 'language-index) index))

(defparameter *languages* #("go" "rust" "lua" "cl" "solidity"))

(defun languages-handler ()
  (setf (hunchentoot:content-type*) "text/html")
  (let* ((direction (hunchentoot:get-parameter "direction"))
         (current (get-session-index))
         (len (length *languages*))
         (next-index (mod (if (string= direction "prev")
                             (1- current)
                             (1+ current))
                         len)))
    (set-session-index next-index)
    (who:with-html-output-to-string (*standard-output*)
    (cond ((string= (aref *languages* next-index) "go") 
             (components:language :language "go"))
          ((string= (aref *languages* next-index) "rust")
             (components:language :language "rust"))
          ((string= (aref *languages* next-index) "lua")
             (components:language :language "lua"))
          ((string= (aref *languages* next-index) "cl")
             (components:language :language "cl"))
          ((string= (aref *languages* next-index) "solidity")
             (components:language :language "solidity"))))))

