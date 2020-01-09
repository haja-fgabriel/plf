% A. Adauga un element E la pozitia N dintr-o lista L. Rezultatul va fi stocat in Rez.
% adauga(list, integer, integer, list) (i,i,i,o)

adauga([], _, _, []).
adauga(L, E, 1, [E|L]) :- !.
adauga([H|T], E, N, [H|Rez]) :- N > 1, !,
								N1 is N-1,
								adauga(T, E, N1, Rez).
								

								
% B. Calculeaza cel mai mare divizor comun al elementelor dintr-o lista.
% cmmdc(integer, integer, integer) (i,i,o)

cmmdc(N, 0, N).
cmmdc(A, B, Rez) :- B =\= 0,
					R is A mod B,
					cmmdc(B, R, Rez).
					
cmmdc_lista([], 0).					
cmmdc_lista([H|T], Rez) :-  cmmdc_lista(T, Rez2),
							cmmdc(H, Rez2, Rez).
						
					