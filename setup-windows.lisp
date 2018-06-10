;;;;; Load this file for the first time, if you run SBCL on Windows platform.
(in-package :cl-user)

(print ">>> Building system....")

(load "cryptobot.asd")

(ql:quickload :cryptobot)

(print ">>> Done building system")