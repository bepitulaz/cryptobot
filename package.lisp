(defpackage #:coinmarketcap
  (:use :cl :cl-json :drakma)
  (:export :get-currency-list
           :get-currency-specific-ticker
           :get-currency-ticker))

(defpackage #:cryptobot-nlp
  (:use :cl)
  (:export :get-entity))

(defpackage #:cryptobot-message
  (:use :cl)
  (:export :generic-template
           :list-template))

(defpackage #:cryptobot-sendapi
  (:use :cl :cryptobot-nlp :jsown :cryptobot-message :coinmarketcap)
  (:export :*page-access-token*
           :get-started
           :send-message
           :postback-reply))

(defpackage #:cryptobot
  (:use :cl :clack :ningle :cryptobot-sendapi)
  (:export :server-start
           :server-stop))
