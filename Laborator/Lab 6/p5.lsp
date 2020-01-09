(DEFUN functie-or(L) 
	(COND
		((NULL L) NIL)
		(T (OR (CAR L) (functie-or (CDR L))))
	)
)

(DEFUN gaseste-nod(L E)
	(COND
		((NULL L) NIL)
		((EQUAL (CAR L) E) T)
		( T (functie-or (MAPCAR #'(LAMBDA (L) (gaseste-nod L E)) (CDR L)) ))
	)
)
