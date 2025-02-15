(in-package #:0xcacti-website.components)

(defmacro with-base-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t)
     (:html
      (:head
       (:meta :charset "utf-8")
       (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
       (:title ,title)

       ;; favicon setup
       (:link :rel "icon" :type "image/x-icon" :href "/static/images/favicon.ico")
       (:link :rel "icon" :type "image/png" :sizes "32x32" :href "/static/images/favicon-32x32.png")
       (:link :rel "icon" :type "image/png" :sizes "16x16" :href "/static/images/favicon-16x16.png")

       ;; Mobile/device specific icons
       (:link :rel "apple-touch-icon" :sizes "180x180" :href "/static/images/apple-touch-icon.png")
       (:link :rel "manifest" :href "/static/images/site.webmanifest")
        
       ;; scripts
       (:script :src "/static/htmx.min.js")
       (:script :src "https://cdn.tailwindcss.com"))
      (:body :class "min-h-screen flex flex-col"
        (:div :class "container mx-auto flex justify-between items-center px-4 py-4"
               (:div :class "flex flex-grow justify-start items-center gap-4 text-4xl"
                     (:a :href "/" :class "hover:text-red-500" "0xcacti")
                     (:div :class "hidden sm:block w-[1px] self-stretch bg-red-500 mx-2")
                     (:div :class "hidden sm:block text-lg md:text-xl"
                        "Christian, software engineer, programming language nerd, ascii art fan"))
         
               (:div :class "flex justify-center items-center space-x-6 text-2xl"
                     ;;(:a :href "/blog" :class "hover:text-red-500" "blog")
                     (:a :href "https://x.com/0xcacti" 
                      (x-logo :class "h-6 w-6 hover:text-red-500")
                      )
                     (:a :href "https://github.com/0xcacti" 
                      (github-logo :class "h-6 w-6 hover:text-red-500")
                      )))
               (:div :class "sm:hidden text-xl text-center"
                  "Christian, software engineer, programming language nerd, ascii art fan")
       ,@body))))

