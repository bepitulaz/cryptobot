(defpackage #:cryptobot
  (:use :cl :clack :ningle :drakma :cl-json :jsown)
  (:export :*page-access-token*
           :server-start
           :server-stop
           :show-service))

(defpackage #:nlp
  (:use :cl)
  (:export :get-entity))
