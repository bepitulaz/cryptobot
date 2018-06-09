(in-package :cryptobot-sendapi)

;;; SEND-MESSAGE is the main function to reply the user message
(defun send-message (messaging-payload)
  (let* ((entity (cryptobot-nlp:get-entity messaging-payload))
         (recipient-id (cdr (cadadr (cddadr messaging-payload)))))
    ;; Send message based on the Facebook build-in NLP entity
    (cond
      ((string= entity "greetings") (show-service recipient-id "it's a greeting"))
      ((string= entity "sentiment") (show-service recipient-id "it's a sentiment"))
      ((string= entity "thanks") (show-service recipient-id "it's a thanks"))
      ((string= entity "bye") (show-service recipient-id "it's a bye"))
      ((string= entity "datetime") (show-service recipient-id "it's a datetime"))
      ((string= entity "amount_of_money") (show-service recipient-id "it's an amount of money"))
      ((string= entity "phone_number") (show-service recipient-id "it's a phone number"))
      ((string= entity "email") (show-service recipient-id "it's an email"))
      ((string= entity "distance") (show-service recipient-id "it's a distance"))
      ((string= entity "quantity") (show-service recipient-id "it's a quantity"))
      ((string= entity "temperature") (show-service recipient-id "it's a temperature"))
      ((string= entity "volume") (show-service recipient-id "it's a volume"))
      ((string= entity "location") (show-service recipient-id "it's a location"))
      ((string= entity "duration") (show-service recipient-id "it's a duration"))
      ((string= entity "url") (show-service recipient-id "it's a url")))))

;;; SHOW-SERVICE will show the choice of CryptoBot service.
;;; Call it when user gives a greeting.
(defun show-service (recipient-id message)
  (let* ((url (format nil "https://graph.facebook.com/v2.6/me/messages?access_token=~a" *page-access-token*))
         (template (cryptobot-message:generic-template message))
         (payload (jsown:to-json
                    `(:obj ("recipient" . (:obj ("id" . ,recipient-id)))
                           ("message" . ,template)))))
    (format t "~a~%" payload)
    (drakma:http-request url :content-type "application/json"
                             :method :post
                             :content payload)))
