(in-package :cryptobot-sendapi)

;;; GET-STARTED is to set the get started button postback
(defun get-started ()
  (let* ((url (format nil "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=~a" *page-access-token*))
         (payload (jsown:to-json
                    `(:obj ("get_started" . (:obj ("payload" . "GET_STARTED")))))))
    (drakma:http-request url :content-type "application/json"
                             :method :post
                             :content payload)))

;;; SEND-MESSAGE is the main function to reply the user message
(defun send-message (messaging-payload)
  (let* ((entity (cryptobot-nlp:get-entity messaging-payload))
         (recipient-id (cdr (cadadr (cddadr messaging-payload)))))
    ;; Send message based on the Facebook build-in NLP entity
    (cond
      ((string= entity "greetings") (show-service recipient-id))
      ((string= entity "sentiment") (show-service recipient-id))
      ((string= entity "thanks") (show-service recipient-id))
      ((string= entity "bye") (show-service recipient-id))
      ((string= entity "datetime") (show-service recipient-id))
      ((string= entity "amount_of_money") (show-service recipient-id))
      ((string= entity "phone_number") (show-service recipient-id))
      ((string= entity "email") (show-service recipient-id))
      ((string= entity "distance") (show-service recipient-id))
      ((string= entity "quantity") (show-service recipient-id))
      ((string= entity "temperature") (show-service recipient-id))
      ((string= entity "volume") (show-service recipient-id))
      ((string= entity "location") (show-service recipient-id))
      ((string= entity "duration") (show-service recipient-id))
      ((string= entity "url") (show-service recipient-id)))))

;;; POSTBACK-REPLY is the function to respond the postback webhook event
(defun postback-reply (messaging-payload)
  (let* ((postback-payload (cdadr (cdaadr messaging-payload)))
         (recipient-id (cdadr (cadadr messaging-payload))))
    (cond
      ((string= postback-payload "BTN_PRICE_TICKER") (show-cryptocurrency-list recipient-id))
      ((string= postback-payload "GET_STARTED") (show-service recipient-id)))))

;;; SHOW-SERVICE will show the choice of CryptoBot service.
;;; Call it when user gives a greeting.
(defun show-service (recipient-id)
  (let* ((url (format nil "https://graph.facebook.com/v2.6/me/messages?access_token=~a" *page-access-token*))
         (template (cryptobot-message:generic-template))
         (payload (jsown:to-json
                    `(:obj ("recipient" . (:obj ("id" . ,recipient-id)))
                           ("message" . ,template)))))
    (drakma:http-request url :content-type "application/json"
                             :method :post
                             :content payload)))

;;; SHOW-CRYPTOCURRENCY-LIST will show the available type of cryptocurrencies
;;; It is called by POSTBACK-REPLY.
(defun show-cryptocurrency-list (recipient-id)
  (let* ((url (format nil "https://graph.facebook.com/v2.6/me/messages?access_token=~a" *page-access-token*))
         (ticker-data (coinmarketcap:get-currency-ticker))
         (template (cryptobot-message:list-template ticker-data))
         (payload (jsown:to-json
                    `(:obj ("recipient" . (:obj ("id" . ,recipient-id)))
                           ("message" . ,template)))))
    (drakma:http-request url :content-type "application/json"
                             :method :post
                             :content payload)))
