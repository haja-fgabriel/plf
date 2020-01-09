(defun numlist-to-string (lst)
  (when lst
    (concatenate 'string
                 (write-to-string (car lst)) (numlist-to-string (cdr lst)))))
 

;; punctul c)
(DEFUN evaluare (L) 
	(COND
		((NULL L) NIL)
		(T
			(COND 
				( (NUMBERP (CAR L)) (APPEND (LIST (CAR L)) (evaluare (CDR L))) )
				(T 
                    (write-line (numlist-to-string (evaluare (CDR L)) ) )
					(COND
						( (EQUAL `+ (CAR L)) (LIST (+ (CAR ( evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) )
						( (EQUAL `- (CAR L)) (LIST (- (CAR ( evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) )
						( (EQUAL `* (CAR L)) (LIST (* (CAR ( evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) )
						( (EQUAL `/ (CAR L)) (LIST (/ (CAR ( evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) )
					)
				)
			)
		)
	)
		
)
