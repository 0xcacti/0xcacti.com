(in-package #:0xcacti-website.components)

(defmacro go-ascii () 
  `(with-html-output (*standard-output*)
      (:pre :class "text-sky-300"
       "      ´.-::::::-.´" (:br)
       "  .:-::::::::::::::-:." (:br)
       "  ´_::" (:span :class "text-gray-500" ":    ::    :") "::_´" (:br)
       "   .:" (:span :class "text-gray-500" "( ^   :: ^   )") ":." (:br)
       "   ´::" (:span :class "text-gray-500" ":   ") (:span :class "text-orange-200" "(") (:span :class "text-black" "..") (:span :class "text-orange-200" ")") (:span :class "text-gray-500" "   :") "::." (:br)
       "   ´:::::::" (:span :class "text-gray-500" "UU") ":::::::´" (:br)
       "   .::::::::::::::::." (:br)
       (:span :class "text-orange-200" "   O") "::::::::::::::::" (:span :class "text-orange-200" "O") (:br)
       "   -::::::::::::::::-" (:br)
       "   ´::::::::::::::::´" (:br)
       "    .::::::::::::::." (:br)
       (:span :class "text-orange-200" "      oO") ":::::::" (:span :class "text-orange-200" "Oo"))
  ))


(defmacro go-ascii-two ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-sky-300"
"             ,************,                 "(:br)
"         ****              ****  "(:br)
"        *"(:span :class "text-blue-300" "@@")"    "(:span :class "text-black" ",_,    ,_,")(:span :class "text-blue-300" "    @@")"*         "(:br)
"        **     "(:span :class "text-black" "|<|+--+|<|")"     **  "(:br)
"         %     "(:span :class "text-black" "|_|    |_|")"      %  "(:br)
"        :*       "(:span :style "color: #d3b287;" "*")" "(:span :class "text-black" "@@")" "(:span :style "color: #d3b287;" "*")"        #  "(:br)
"        -*      "(:span :style "color: #d3b287;" "********")"       *  "(:br)
"        -*         "(:span :class "text-gray-300" "uu")"          *  "(:br)
"        .*                     *.  "(:br)
"       "(:span :style "color: #d3b287;" "#")":*                     +:"(:span :style "color: #d3b287;" "#")"  "(:br)
"     "(:span :style "color: #d3b287;" "+##")",*                     + "(:span :style "color: #d3b287;" "##+")"  "(:br)
"         *                     ;   "(:br)
"        *                      !*  "(:br)
"        ;                      *;  "(:br)
"        +                      #+  "(:br)
"         ;                      ;  "(:br)
"          *                   *  "(:br)
"          "(:span :style "color: #d3b287;" "##")"+,             ,+"(:span :style "color: #d3b287;" "##")"  "(:br)
"         "(:span :style "color: #d3b287;" "###")"  `************' "(:span :style "color: #d3b287;" "###")"  "(:br)

  )))

(defmacro rust-ascii ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-red-500"
"  ##          # #       # ##   "(:br)
" ### #     # ##### #    # ###  "(:br)
" ## #    # ######### #   ####  "(:br)
"  ###   ###############  ###  "(:br)
"   ## #####" (:span :class "text-black" "(`)")"##"(:span :class "text-black" "(`)")"##### ##  "(:br)
"     #@#################@#  "(:br)
"      ######## "(:span :class "text-black" "ru")" #######  "(:br)
"     ## #  #########  # ##  "(:br)
"      ## #           # ##   "(:br)
"       #, `         `,#  "(:br)
      )))





(defmacro ascii-switch (&key language)
  `(cond  ; use cond, not double parens
     ((string= ,language "go") (go-ascii-two))
     ((string= ,language "rust") (rust-ascii))
     (t (error "Language not supported ~A" ,language))))

(defmacro thoughts-switch (&key language)
  `(cond
     ((string= ,language "go") "Golang was my first love.  In university, I briefly looked at Java as most students do, but Golang was the first 
       real language that I learned and used on my own. It's so simple, so easy.  I spent hours and hours writing crypto 
       trading bots in it, and the period during which I was writing Golang was the time I developed the most as a programmer.
       To this day, I maintain Golang is a great first language to learn because it makes you value simplicity. Of course, it's 
       easy to feel fomo writing Golang because it lacks the sex appeal of other languages, but that's okay.  It's a great language.")
     ((string= ,language "rust") "Rust ... what do I say about rust.  I had a great time writing rust in the beginning because it let me feel like 
                                 a college kid pretending to be a tortured intellectual to impress a girl. But then I remembered how bad that sucks. 
                                 In all seriousness, Rust is great. I think everyone should learn it to enjoy it's amazing type system for a year. 
                                 Maybe you will love it, maybe you will realize it's not for you. ")
     (t (error "Language not supported"))))


(defmacro language (&key language)
  `(with-html-output (*standard-output*)
     (:div :class "flex-1 flex flex-col p-2"
       (:div :class "flex-1 flex items-center justify-center"
         ,(ascii-switch :language language))

       ;; Ensuring this stays at the bottom
       (:div :class "mt-auto flex-shrink-0"
         ,(thoughts-switch :language language)))))

