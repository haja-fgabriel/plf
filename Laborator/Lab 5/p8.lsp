(DEFUN parcurgere(L)
	(COND
		((NULL L) NIL)
		((NULL (CDR L)) (LIST (CAR L)))
		(T (APPEND (parcurgere (CADR L)) (LIST (CAR L)) (parcurgere (CADDR L))))
	)
)
