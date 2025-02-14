(ql:quickload :0xcacti-website)
(in-package :0xcacti-website)
(start-app :port 3000)
(sb-thread:join-thread 
  (find-if (lambda (th) 
             (search "hunchentoot" (sb-thread:thread-name th)))
           (sb-thread:list-all-threads)))
