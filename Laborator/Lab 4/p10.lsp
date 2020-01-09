
;;; Problema 10

;; punctul a)
(DEFUN produsatomi (L)
    (COND
		((NULL L) 1)
	    ((numberp (CAR L)) (* (CAR L) (produsatomi (CDR L))))
		(T (produsatomi (CDR L)))
	)
)


;; punctul b)
(DEFUN perechi2 (L Col)
	(COND
		(( = (LENGTH Col) 2) (LIST Col))
		((NULL L) NIL)
		(T  (APPEND 
				(perechi2 (CDR L) (APPEND Col (LIST (CAR L))) )
				(perechi2 (CDR L) Col) 
			)
		)
	)
)

(DEFUN perechi (L) (perechi2 L NIL) )


;; punctul d)
(DEFUN adaugare_aparitie(L E)
	(COND 
		( (NULL L) (LIST (LIST E 1)) )
		( (NOT (EQUAL (CAAR L) E)) 
			(APPEND (LIST (CAR L)) (adaugare_aparitie (CDR L) E)) 
		)
		( T (APPEND ( LIST ( LIST (CAAR L) (+ 1 (CADAR L)) ) )
					( CDR L ) 
			)
		)
	)
)

(DEFUN creare_perechi(L)
	(COND 
		((NULL L) NIL)
		(T (adaugare_aparitie (creare_perechi (CDR L)) (CAR L) ))
	)
)


;; punctul c)
(DEFUN evaluare (L) 
	(COND
		((NULL L) NIL)
		(T
			(COND 
				( (NUMBERP (CAR L)) (APPEND (LIST (CAR L)) (evaluare (CDR L))) )
				(T 
					(COND
						( (= 1 (LENGTH (evaluare (CDR L)))) (CAR L))
						( (EQUAL `+ (CAR L)) (APPEND (LIST (+ (CAR (evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) (CDDR (evaluare (CDR L))) ) )
						( (EQUAL `- (CAR L)) (APPEND (LIST (- (CAR (evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) (CDDR (evaluare (CDR L))) ) )
						( (EQUAL `* (CAR L)) (APPEND (LIST (* (CAR (evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) (CDDR (evaluare (CDR L))) ) )
						( (EQUAL `/ (CAR L)) (APPEND (LIST (/ (CAR (evaluare (CDR L)) )  ( CADR (evaluare (CDR L)) ) ) ) (CDDR (evaluare (CDR L))) ) )
					)
				)
			)
		)
	)
)
	