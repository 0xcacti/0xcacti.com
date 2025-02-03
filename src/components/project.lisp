(in-package #:0xcacti-website.components)

(defmacro project (&key name link language description (class "h-6 w-6"))
  `(with-html-output (*standard-out*)
     (:div :class "flex flex-col sm:flex-row items-start sm:items-center gap-4 border-b border-gray-300 pb-4 sm:pb-6"
      (:div :class "flex items-center gap-4"  
       (lua-logo :class "h-6 w-6 hover:text-red-500")
       (:a :href ,link :class "hover:text-red-500" ,name))
      (:div :class "hidden sm:block w-[1px] self-stretch bg-red-500 mx-2")
      (:div :class "text-sm sm:text-base"
      ,description))))

