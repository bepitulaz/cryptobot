(ql:quickload :drakma)
(ql:quickload :cl-json)

(setq drakma:*text-content-types*
    (cons '("application" . "json") drakma:*text-content-types*))

(defun get-currency-list ()
    "Read cryptocurrency list from CoinMarketCap."
    (let ((url "https://api.coinmarketcap.com/v2/listings/"))
         (cl-json:decode-json-from-string (drakma:http-request url))))

(defun get-currency-ticker (currency-id)
    "Get ticker for the specific currency."
    (let ((url (format nil "https://api.coinmarketcap.com/v2/ticker/~a" currency-id)))
         (cl-json:decode-json-from-string (drakma:http-request url))))
