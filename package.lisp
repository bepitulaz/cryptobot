(defpackage #:cryptobot-nlp
  (:use :cl)
  (:export :get-entity))

(defpackage #:cryptobot-message
  (:use :cl)
  (:export :generic-template))

(defpackage #:cryptobot-sendapi
  (:use :cl :cryptobot-nlp :jsown :cryptobot-message)
  (:export :*page-access-token*
           :send-message))

(defpackage #:cryptobot
  (:use :cl :clack :ningle :drakma :cl-json :cryptobot-sendapi)
  (:export :server-start
           :server-stop))
