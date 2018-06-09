(defpackage #:cryptobot-nlp
  (:use :cl)
  (:export :get-entity))

(defpackage #:cryptobot-sendapi
  (:use :cl :cryptobot-nlp)
  (:export :*page-access-token*
           :send-message))

(defpackage #:cryptobot
  (:use :cl :clack :ningle :drakma :cl-json :jsown :cryptobot-sendapi)
  (:export :server-start
           :server-stop))
