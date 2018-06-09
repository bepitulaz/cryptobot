(defvar *sample-response* '((messaging
  ((message
    (nlp
      (entities 
        (sentiment ((value . neutral) (confidence . 0.86883086390391d0)))
        (location
            ((type . value) (value . home) (confidence . 0.88234)
            (suggested . T)))))
    (text . "Anybody home?")
    (seq . 145790)
    (mid . "mid.$cAAIm54q-QxxqDAF5kFj2r0FzMv0o"))
   (timestamp . 1528383156624)
   (recipient (id . 605726583134566))
   (sender (id . 1666237776792864))))
  (time . 1528383156911)
  (id . 605726583134566)))

(defvar *sample-read-response*
  '((messaging
      ((read (seq . 0) (watermark . 1528460713866))
      (timestamp . 1528460750799)
      (recipient (id . "605726583134566"))
      (sender (id . "1666237776792864"))))
    (time . 1528460750815) (id . "605726583134566")))
    