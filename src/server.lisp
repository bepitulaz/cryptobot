(in-package :cryptobot)

(defvar *app* (make-instance 'ningle:<app>))

(defvar *server* nil)

(defun parse-entry(entries)
  "This function will parse the incoming message from Facebook Page."
  (dolist (entry entries) (format t "~a~%" (cdr (caadar entry)))) ; do something with the message
  '(200 (:content-type "text/plain") ("EVENT_RECEIVED")))

(setf (ningle:route *app* "/")
  "This is Cryptobot")

;;; This is the webhook route to accept incoming messenger message.
(setf (ningle:route *app* "/webhook" :method :POST)
  #'(lambda (params)
      (let ((object (cdr (assoc "object" params :test #'string=)))
            (entries (cdr (assoc "entry" params :test #'string=))))
        (if (string= object "page")
          ;; The event is coming from a page subscription
          (parse-entry entries)
          ;; Otherwise, return not found
          '(404 (:content-type "text/plain") ("Not found"))))))

;;; This is the route to verify the webhook for the messenger bot.
(setf (ningle:route *app* "/webhook")
  #'(lambda (params)
      (let ((token "fbmessengerbot")
            (verify-token (cdr (assoc "hub.verify_token" params :test #'string=)))
            (mode (cdr (assoc "hub.mode" params :test #'string=)))
            (challenge (cdr (assoc "hub.challenge" params :test #'string=))))
        ;; Check if the mode and token is in the query string of the request
        (when (and mode token)
          ;; Checks the mode and token sent is correct
          (if (and (string= mode "subscribe") (string= token verify-token))
            ;; send http 200 and the challenge string, whenever it's verified
            `(200 (:content-type "text/plain") (,challenge))
            ;; send http 403, whenever the webhook is failed to verify
            '(403 (:content-type "text/plain") ("forbidden")))))))

(defun server-start ()
  "Starting the application server."
  (if *server*
    (format t "Server already started")
    (setf *server* (clack:clackup *app*))))

(defun server-start-ssl ()
  "Starting the application server with SSL support."
  (if *server*
    (format t "Server already started")
    (setf *server* (clack:clackup *app* :port 443
                                        :ssl t
                                        :ssl-key-file "/home/ubuntu/ssl/cryptobot.tanibox.com.key"
                                        :ssl-cert-file "/home/ubuntu/ssl/cryptobot.tanibox.com.crt"))))

(defun server-stop ()
  "Stopping the application server."
  (if *server*
    (clack:stop *server*)
    (format t "Server is not running")))
