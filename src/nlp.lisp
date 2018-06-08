(in-package :nlp)

;;; Get the entity type of each message.
(defun get-entity (entry)
  (cdar (cadadr (cadadr (caadar entry)))))