(in-package :cryptobot-message)

;;; FB Messenger generic template message
(defun generic-template () 
  `(:obj 
      ("attachment" . (:obj 
                        ("type" . "template")
                        ("payload" . (:obj 
                                       ("template_type" . "generic")
                                       ("elements" . ((:obj 
                                                        ("title" . "I am The Crypto Bot")
                                                        ("image_url" . "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Blockchain_Illustration.jpg/1200px-Blockchain_Illustration.jpg")
                                                        ("subtitle" . "A bot for anything about cryptocurrency and blockchain world.")
                                                        ("buttons" . ((:obj 
                                                                        ("type" . "postback")
                                                                        ("title" . "Check Price Ticker.")
                                                                        ("payload" . "BTN_PRICE_TICKER"))
                                                                      (:obj 
                                                                        ("type" . "web_url")
                                                                        ("url" . "https://github.com/bepitulaz/cryptobot")
                                                                        ("title" . "See Our Github")))))))))))))

;;; FB Messenger list template
(defun list-template (ticker-data)
  (let* ((items (cdar ticker-data))
         (elements (map
                     'list 
                     #'(lambda (x)
                         `(:obj ("title" . ,(format nil "~a (~a)" (cdr (third x)) (cdr (fourth x))))
                                ("subtitle" . ,(format nil "Price (USD): ~a Volume (24H): ~a" (cdr (second (second (tenth x)))) (cdr (third (second (tenth x))))))
                                ("image_url" . ,(format nil "https://s2.coinmarketcap.com/static/img/coins/128x128/~a.png" (cdr (second x))))))
                    items)))
    `(:obj
       ("attachment" . (:obj
                         ("type" . "template")
                         ("payload" . (:obj
                                        ("template_type" . "list")
                                        ("top_element_style" . "compact")
                                        ("elements" . ,elements))))))))