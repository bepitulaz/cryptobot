(in-package :cryptobot-nlp)

;;; Get the entity type of each message.
(defun get-entity (entry)
  (let* ((nlp (car (cdaadr entry)))
         (entities (cadr nlp)))
    (caadr entities)))
