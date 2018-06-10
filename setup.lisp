;;;; Load this file for the first time, if you run SBCL on UNIX platform.
;;;; This file is tested on Ubuntu 16.04.
(in-package :cl-user)

(require 'asdf)

(load "~/.quicklisp/setup.lisp")

(print ">>> Building system....")

(load "cryptobot.asd")

(ql:quickload :cryptobot)

(print ">>> Done building system")