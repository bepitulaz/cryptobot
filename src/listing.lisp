(in-package :coinmarketcap)

(setq drakma:*text-content-types*
  (cons '("application" . "json") drakma:*text-content-types*))

;;; Read cryptocurrency list from CoinMarketCap.
(defun get-currency-list ()
  (let ((url "https://api.coinmarketcap.com/v2/listings/"))
    (cl-json:decode-json-from-string (drakma:http-request url))))

;;; Get ticker for the specific currency.
(defun get-currency-specific-ticker (currency-id)
  (let ((url (format nil "https://api.coinmarketcap.com/v2/ticker/~a" currency-id)))
    (cl-json:decode-json-from-string (drakma:http-request url))))

;;; Get ticker for active currencies.
(defun get-currency-ticker ()
  (let ((url "https://api.coinmarketcap.com/v2/ticker/?limit=4&sort=rank"))
    (cl-json:decode-json-from-string (drakma:http-request url))))
