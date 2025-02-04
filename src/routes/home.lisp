(in-package #:0xcacti-website.routes)

(defun home-handler ()
  (setf (ht:content-type*) "text/html")
  (components:with-base-page (:title "0xcacti")
    (:div :class "container mx-auto flex flex-col flex-1 justify-between items-center gap-4"
      
     (:div :class "w-full pt-6 flex-1 grid grid-cols-1 lg:grid-cols-2 gap-4" 
      (:div :class "flex flex-col justify-start min-h-full rounded-lg p-4 border border-gray-300" 
       (:div :class "mb-8 text-2xl font-light text-gray-600"
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

        (:div :class "flex flex-col justify-start min-h-full rounded-lg p-4 border border-gray-300" 
         (:div :class "flex justify-start mb-8 text-2xl font-light text-gray-600"
            "Languages"
          (:div :class "flex flex-grow justify-end text-sm"
           (:button 
            :class "px-2 py-1 rounded border border-gray-300 bg-gray-100 focus:outline-none focus:ring-2 focus:ring-red-500"
            :name "language"
            :hx-get "/languages" 
            :hx-target "#languages"
            :hx-trigger "click"
            "Switch")))

         (components:language :thoughts "Golang was my first love.  In university, I briefly looked at Java as most students do, but Golang was the first 
       real language that I learned and used on my own. It's so simple, so easy.  I spent hours and hours writing crypto 
       trading bots in it, and the period during which I was writing Golang was the time I developed the most as a programmer.
       To this day, I maintain Golang is a great first language to learn because it makes you value simplicity. Of course, it's 
       easy to feel fomo writing Golang because it lacks the sex appeal of other languages, but that's okay.  It's a great language.")

         ))

     (:div :class "flex justify-center items-center w-full h-[145px] border rounded-lg border-gray-300 px-2"
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
