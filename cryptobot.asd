;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(defpackage #:cryptobot-asd
    (:use #:cl #:asdf))

(in-package :cryptobot-asd)

(defsystem cryptobot
    :name "cryptobot"
    :version "0.0.0"
    :maintainer "Asep Bagja Priandana"
    :author "Asep Bagja Priandana"
    :licence "MIT"
    :description "A Cryptocurrency Bot"
    :long-description "A bot to read cryptocurrency market price."
    :serial t
    :components ((:static-file "cryptobot.asd")
                 (:module :src)))