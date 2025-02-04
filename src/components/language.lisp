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

(defmacro rust-ascii ()
  `(with-html-output (*standard-output*)
     (:pre :class "text-red-500"
"                            ==   ===   ===                            "(:br)
"                      ==   ========== ====   ==                       "(:br)
"                      ==========================                      "(:br)
"                 ====================================                 "(:br)
"                 ====================================                 "(:br)
"            =============================================             "(:br)
"            =============================================             "(:br)
"         =========================+===+++=+++++++++++++++++++         "(:br)
"        =======+=++++++++++++++++++++++++++++++++++++++++++++         "(:br)
"         +++++++++++++++++++++++++++++++++++++++++++++++++++          "(:br)
"      ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++      "(:br)
"      ++++++++++++++++++++++==##++++++++==#*++++++++++++++++++++      "(:br)
"       ++++++++++++++++++++=  #@@*+++++*  *@@++++++++++++++++++       "(:br)
"      ++++++++++++++++++++*%--@@@@++++#@++@@@#++++++++++++++++++      "(:br)
"    +++++++++++++++++++++++@@@@@@#++++*@@@@@@*++++++++++++++++++++    "(:br)
"  +++++++**+++++++++++++++++#%%%#++++++*#%%*++++++++++++++****++++++  "(:br)
"  ++++++####**+++++++++++*####*++++++++*####**++++++**+++*####+++++   "(:br)
"   ++++++ ####*+++*****##*+++*#%*++++*##*++++#%#*###*++++ ### ++++    "(:br)
"     +++++ ### ++++**#*++++++++*#%##%#*********##******  ### ++++     "(:br)
"       ++++  ##  *************#***  *%@@@@#**********   ### ++++      "(:br)
"         ++++ #     *********            *********      ##  ++        "(:br)
"          ++++        ***********   ************           ++         "(:br)
"            ++          *********   **********             +          "(:br)
"                            **                                  "(:br)
      )))


(defmacro ascii-switch (&key language)
  `(cond  ; use cond, not double parens
     ((string= ,language "go") (go-ascii))
     ((string= ,language "rust") (rust-ascii))
     (t (error "Language not supported ~A" ,language))))

(defmacro thoughts-switch (&key language)
  `(cond
     ((string= ,language "go") "Golang was my first love.  In university, I briefly looked at Java as most students do, but Golang was the first 
       real language that I learned and used on my own. It's so simple, so easy.  I spent hours and hours writing crypto 
       trading bots in it, and the period during which I was writing Golang was the time I developed the most as a programmer.
       To this day, I maintain Golang is a great first language to learn because it makes you value simplicity. Of course, it's 
       easy to feel fomo writing Golang because it lacks the sex appeal of other languages, but that's okay.  It's a great language.")
     ((string= ,language "rust") "Rust, man what do we say about rust")
     (t (error "Language not supported"))))


(defmacro language (&key language)
  `(with-html-output (*standard-output*)
     (:div :class "flex flex-col items-center justify-center w-full"
      ,(ascii-switch :language language)
      (:div :class "pt-6" ,(thoughts-switch :language language)))))


