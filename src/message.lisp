(in-package :cryptobot-message)

;;; FB Messenger generic template message
(defun generic-template (greetings) 
  `(:obj 
      ("attachment" . (:obj 
                        ("type" . "template")
                        ("payload" . (:obj 
                                       ("template_type" . "generic")
                                       ("elements" . ((:obj 
                                                        ("title" . "I'm The Crypto Bot")
                                                        ("image_url" . "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Blockchain_Illustration.jpg/1200px-Blockchain_Illustration.jpg")
                                                        ("subtitle" . "A bot for anything about cryptocurrency and blockchain world.")
                                                        ("buttons" . ((:obj 
                                                                        ("type" . "postback")
                                                                        ("title" . "Check Price Ticker")
                                                                        ("payload" . "BTN_PRICE_TICKER"))
                                                                      (:obj 
                                                                        ("type" . "web_url")
                                                                        ("url" . "https://github.com/bepitulaz/cryptobot")
                                                                        ("title" . "The Bot's Github")
                                                                        ("webview_height_ratio" . "full")
                                                                        ("messenger_extensions" . "false")
                                                                        ("fallback_url" . "https://github.com/bepitulaz/cryptobot")))))))))))))
