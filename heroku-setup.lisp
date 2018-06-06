(in-package :cl-user)

(print ">>> Building system....")

(load (merge-pathnames "cryptobot.asd" *build-dir*))

(ql:quickload :cryptobot)

;;; Redefine / extend heroku-toplevel here if necessary.

(print ">>> Done building system")