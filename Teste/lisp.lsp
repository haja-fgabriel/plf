(DEFUN succesorc(l)
	(COND
		((NULL l) (LIST 0 nil))
		((> (LENGTH l) 1) (LIST (FLOOR (/ (+ (CAR l) (CAR (succesorc (CDR l)))) 10)) 
				(CONS (MOD (+ (CAR l) (CAR (succesorc (CDR l)))) 10)
					(CADR (succesorc (CDR l)))
				) 
			)
		)
		(T (LIST (FLOOR (/ (+ (CAR l) 1 ) 10))  (LIST (MOD (+ (CAR l) 1) 10)) ) )
	)
)

(DEFUN succesor(l)
	(COND	
		((= (CAR (succesorc l)) 0) (CADR (succesorc l)))
		(T (CONS (CAR (succesorc l)) (CADR (succesorc l)) ) )
	)
)