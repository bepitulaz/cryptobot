(in-package :cl-user)

(print ">>> Building system....")

(load "cryptobot.asd")

(ql:quickload :cryptobot)

;;; Redefine / extend heroku-toplevel here if necessary.

(print ">>> Done building system")