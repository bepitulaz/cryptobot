(in-package :cryptobot)

;;; SHOW-SERVICE will show the choice of CryptoBot service.
;;; Call it when user gives a greeting.
(defun show-service ()
  (let* ((url (format nil "https://graph.facebook.com/v2.6/me/messages?access_token=~a" *page-access-token*))
         (payload (jsown:to-json '(:obj ("recipient" . (:obj ("id" . "1064295034"))) ("message" . (:obj ("text" . "hello world")))))))
    (drakma:http-request url :content-type "application/json"
                             :method :post
                             :content payload)))