(in-package #:0xcacti-website.components)


(defmacro go-ascii ()
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

(defmacro lisp-ascii ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-green-500"
"                                               "(:span :class "text-blue-600" "________")"  "(:br)
"                                              "(:span :class "text-orange-800" "//")" "(:span :class "text-black" "lisp")" "(:span :class "text-blue-600" "/")"  "(:br)
"                          "(:span :class "text-gray-300" "@@")"                 "(:span :class "text-orange-800" "//")""(:span :class "text-blue-600" "------`")"  "(:br)
"                         "(:span :class "text-gray-300" "@@@@")"               "(:span :class "text-orange-800" "//")"  "(:br)
"            ,eunthaoeunxr,"(:span :class "text-gray-300" "@@@")",,         stn"(:span :class "text-orange-800" "//")"`  "(:br)
"          aoeusthueasuesueastes        oeu"(:span :class "text-orange-800" "//")"`  "(:br)
"         xjlaeuskntbast uuuuu x!      ao "(:span :class "text-orange-800" "//")"  "(:br)
"       xjjsnthstkjajaoe unnnn )#!s   ts "(:span :class "text-orange-800" "//")"  "(:br)
"      ,xkkjkuesa-oeurcueastha\\  sa j%  "(:br)
"     //  //             ||    \\  `ex  "(:br)
"    //  //              ||    ||  "(:br)
"   //  //               ||    ||  "(:br)
"  (,) (,)               (,)   (,)   "(:br)
  )))

(defmacro lua-ascii ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-blue-900"

"                              ,czczv       "(:br)
"                             uczcczc!      "(:br)
"             ,uczczcczczu:   |czczcz       "(:br)
"           zcczczcczczcczczv  'cuxz`       "(:br)
"         /zczczczczczc      ut             "(:br)
"        zcczczczczczc        zc            "(:br)
"       fczczcczcczccz        czf           "(:br)
"      `zczczczczczczcc      cccz',         "(:br)
"      ?ccl| |czczcczczczcz____,cz}         "(:br)
"      ?czl| |cjc| |cz| |c|__, |fz          "(:br)
"      `zcI| |zfx| |cz| |zc__| |zz,         "(:br)
"       jcl| |__,| |__| |z/ c' |zi          "(:br)
"        c>|____||______||___;_|            "(:br)
"         jcczcczccczczczczczcj`            "(:br)
"           zczczczczcczcczcz               "(:br)
"             izcczcczczcz!                 "(:br)
     )))


(defmacro solidity-ascii ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-black"
"                  *             "(:br)
"                ++*%%           "(:br)
"               +++*%%%          "(:br)
"              ++++*%%%%         "(:br)
"             +++++*%%%%%        "(:br)
"            ++++++*%%%%%%       "(:br)
"           ++++###*@@@@%%%      "(:br)
"          +++#####%@@@@@@%%     "(:br)
"         *########%@@@@@@@@%    "(:br)
"         *+#######%@@@@@@@@%    "(:br)
"          +++  ###%@@@  ###     "(:br)
"           ++++  #%@  ####      "(:br)
"            ++++++*######       "(:br)
"              ++++*####         "(:br)
"               +++*###          "(:br)
"                ++*##           "(:br)
"                  *             "(:br))))




(defmacro ascii-switch (&key language)
  `(cond  ; use cond, not double parens
     ((string= ,language "go") (go-ascii))
     ((string= ,language "rust") (rust-ascii))
     ((string= ,language "cl") (lisp-ascii))
     ((string= ,language "lua") (lua-ascii))
     ((string= ,language "solidity") (solidity-ascii))
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
     ((string= ,language "cl") "I love learning new programming languages. I picked lisp to learn in 2024 because I wanted something syntactically different
                               than yet another C-like language. All I can say about lisp is wow.  It's amazing. It's my first time really using macros 
                               and I'm just blown away by the things you can do.  Just the loop macro on it's own is enough to be convinced of this. 
                               I even wrote this website in lisp, and it was extremely convenient to use macros to embed html templates. 
                               Moreover, the error handling and debugging experience is amazing. I'm fully in on the lisp cult")
     ((string= ,language "lua") "How could you not show love to this gem? Lua is literally sick.  Perhaps it's just because I love neovim, but I have such
                                a soft spot for lua.  Plus, one based indexing is objectively correct.  Honestly, give lua a go.  You can learn it in an 
                                afternoon, and for such a simple language it's very expressive.  I am literally looking for an excuse to need an embedded 
                                language so I can finally embed lua in something.")
     ((string= ,language "solidity") "Solidity. Honestly, I'm ashamed to say how much time I have spent writing this cursed language.  It's devilishly 
                                     complicated despite being severely limited.  There are just so many quirks.  And to be fair, this isn't necessarily 
                                     the fault of the language, but rather it's the fault of the EVM.  However, it's still wild to me how deep you can 
                                     get into writing optimized smart contracts.  Ultimately, it's a very fun language")

     (t (error "Language not supported"))))


(defmacro language (&key language)
  `(with-html-output (*standard-output*)
     (:div :class "flex-1 flex flex-col p-2"
       (:div :class "flex-1 flex items-center justify-center"
         ,(ascii-switch :language language))

       ;; Ensuring this stays at the bottom
       (:div :class "mt-auto flex-shrink-0"
         ,(thoughts-switch :language language)))))

