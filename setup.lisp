(in-package :cl-user)

(require 'asdf)
(load "~/quicklisp/setup.lisp")

(print ">>> Building system....")

(load "cryptobot.asd")

(ql:quickload :cryptobot)

;;; Redefine / extend heroku-toplevel here if necessary.

(print ">>> Done building system")