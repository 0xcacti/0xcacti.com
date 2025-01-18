(in-package #:0xcacti-website)

(defmacro x-logo (&key (class "h-6 w-6"))
  `(with-html-output (*standard-output*)
     (:svg :xmlns "http://www.w3.org/2000/svg" 
           :viewBox "0 0 256 256"
           :class ,class
           (:path :fill "currentColor" 
                 :d "m218.12 209.56l-61-95.8l59.72-65.69a12 12 0 0 0-17.76-16.14l-55.27 60.84l-37.69-59.21A12 12 0 0 0 96 28H48a12 12 0 0 0-10.12 18.44l61 95.8l-59.76 65.69a12 12 0 1 0 17.76 16.14l55.31-60.84l37.69 59.21A12 12 0 0 0 160 228h48a12 12 0 0 0 10.12-18.44M166.59 204L69.86 52h19.55l96.73 152Z"))))

(defmacro github-logo (&key (class "h-6 w-6"))
  `(with-html-output (*standard-output*)
     (:svg :xmlns "http://www.w3.org/2000/svg"
           :viewbox "0 0 24 24" 
           :class ,class 
           (:path :fill "currentColor"
                  :d "M12 .999c-6.074 0-11 5.05-11 11.278c0 4.983 3.152 9.21 7.523 10.702c.55.104.727-.246.727-.543v-2.1c-3.06.683-3.697-1.33-3.697-1.33c-.5-1.304-1.222-1.65-1.222-1.65c-.998-.7.076-.686.076-.686c1.105.08 1.686 1.163 1.686 1.163c.98 1.724 2.573 1.226 3.201.937c.098-.728.383-1.226.698-1.508c-2.442-.286-5.01-1.253-5.01-5.574c0-1.232.429-2.237 1.132-3.027c-.114-.285-.49-1.432.107-2.985c0 0 .924-.303 3.026 1.156c.877-.25 1.818-.375 2.753-.38c.935.005 1.876.13 2.755.38c2.1-1.459 3.023-1.156 3.023-1.156c.598 1.554.222 2.701.108 2.985c.706.79 1.132 1.796 1.132 3.027c0 4.332-2.573 5.286-5.022 5.565c.394.35.754 1.036.754 2.088v3.095c0 .3.176.652.734.542C19.852 21.484 23 17.258 23 12.277C23 6.048 18.075.999 12 .999"))))

(defmacro with-base-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t)
     (:html
      (:head
       (:title ,title)
       (:script :src "/static/htmx.min.js")
       (:script :src "https://cdn.tailwindcss.com"))
      (:body :class "min-h-screen flex flex-col"
        (:div :class "container mx-auto flex justify-between items-center px-4 py-8"
               (:div :class "flex flex-grow justify-start items-center text-4xl"
                     (:a :href "/" :class "hover:text-red-500" "0xcacti"))
               (:div :class "flex justify-center items-center space-x-6 text-2xl"
                     (:a :href "/blog" :class "hover:text-red-500" "blog")
                     (:a :href "https://x.com/0xcacti" 
                      (x-logo :class "h-6 w-6 hover:text-red-500")
                      )
                     (:a :href "https://github.com/0xcacti" 
                      (github-logo :class "h-6 w-6 hover:text-red-500")
                      )
                     ))
       ,@body))))

;; (define-easy-handler (home :uri "/") ()
;;   (setf (content-type*) "text/html")
;;   (with-base-page (:title "0xcacti")
;;     (:div :class "container mx-auto flex flex-col flex-1 justify-between items-center"
;;      (:div :class "text-xl w-full flex justify-center items-center border-4 border-emerald-500"
;;       "Christian, software engineer, programming language nerd, ascii art fan")
;;       
;;      (:div :class "w-full flex-1 grid grid-cols-1 lg:grid-cols-2 gap-4" 
;;       (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full" 
;;        "Recent Projcts")
;;       (:div :class "border-4 border-purple-500 p-4 flex justify-center min-h-full"
;;        "Languages")
;;       )
;; 
;;      (:div :class "flex justify-end items-center w-full border-4 border-emerald-500 "
;;       (:pre :class "text-red-500" "    |\\_ /|   
;;    ( o  o )
;;     > . <&#47;
;;     |    \\
;;     |  |  \\
;;     |  |   | 
;;    (_(_f_, ) 0xcacti
;;          //
;;         ((
;;          ))  
;;         ((
;;          v")))))

;; (define-easy-handler (projects :uri "blog") () 
;;   (setf (content-type*) "text/html")
;;   (with-base-page (:title "blog")
;;     (:div :class "container mx-auto flex justify-center items-center px-4 py-8"
;;     (:h1 "Blog"))))
