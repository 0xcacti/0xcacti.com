(in-package #:0xcacti-website.components)

(defmacro language-switch (&key language (svg-class "h-6 w-6 hover:text-red-500"))
    `(cond
       ((string= ,language "lua") (lua-logo :class ,svg-class))
       ((string= ,language "cl") (cl-logo :class ,svg-class))
       ((string= ,language "rust") (rust-logo :class ,svg-class))
       ((string= ,language "solidity") (solidity-logo :class ,svg-class))
       ((string= ,language "c" (c-logo :class ,svg-class))
       (t (error "Language not supported"))))

(defmacro project (&key name link language description)
  `(with-html-output (*standard-output*)
     (:div :class "flex flex-col sm:flex-row items-start sm:items-center gap-4 border-b border-gray-300 pb-4 sm:pb-6"
      (:div :class "flex items-center gap-4"  
       ,(language-switch :language language :svg-class "h-6 w-6 hover:text-red-500")
       (:a :href ,link :class "hover:text-red-500" ,name))
      (:div :class "hidden sm:block w-[1px] self-stretch bg-red-500 mx-2")
      (:div :class "text-sm sm:text-base"
      ,description))))

