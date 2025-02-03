(defmacro language (&key thoughts)
  `(with-html-output (*standard-output*)
     (:div :class "flex flex-col items-center justify-center w-full"
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

      (:div :class "pt-6"
       "Golang was my first love.  In university, I briefly looked at Java as most students do, but Golang was the first 
       real language that I learned and used on my own. It's so simple, so easy.  I spent hours and hours writing crypto 
       trading bots in it, and the period during which I was writing Golang was the time I developed the most as a programmer.
       To this day, I maintain Golang is a great first language to learn because it makes you value simplicity. Of course, it's 
       easy to feel fomo writing Golang because it lacks the sex appeal of other languages, but that's okay.  It's a great language."
       ))))


