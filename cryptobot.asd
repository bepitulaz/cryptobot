;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(asdf:defsystem #:cryptobot
  :name "cryptobot"
  :version "0.0.0"
  :maintainer "Asep Bagja Priandana"
  :author "Asep Bagja Priandana"
  :licence "MIT"
  :description "An FB Messenger Cryptocurrency Bot"
  :long-description "A Facebook bot to read cryptocurrency market price."
  :serial t
  :depends-on (#:clack
               #:ningle
               #:drakma
               #:cl-json
               #:jsown)
  :components ((:file "package")
               (:module :src
                        :serial t
                        :components
                        ((:file "server")
                         (:file "listing")
                         (:file "sendapi")))))
