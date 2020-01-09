% cautare_numar(L : list, E : integer) (i, i)
cautare_numar([[H|_] | T2], E) :- H < E, !, 
								  cautare_numar(T2, E).
cautare_numar([[H|_] | _], E) :- H =:= E, !.

% adaugare_nou(L : list, Rez : list, E : integer) (i, o, i) [(o, i, i)]
adaugare_nou([], [[E, 1]], E) :- !.
adaugare_nou([ [H | X] | T2], [ [H | X] | Rez], E) :- H < E, !, 
													  adaugare_nou(T2, Rez, E).
adaugare_nou([ [H | X] | T2], [ [E, 1], [H | X] | T2], E) :- H > E, !.
										 

% incrementare_existent(L : list, Rez : list, E : integer) (i, o, i) [(o, i, i)]
incrementare_existent([ [H | X] | T2], [ [H | X] | Rez], E) :- H < E, !, 
																  incrementare_existent(T2, Rez, E).
incrementare_existent([ [H, H2 | X] | T2], [ [H, New | X] | T2], E) :- H =:= E, !,
																	   New is H2+1.
														
% modificare_lista_aparitii(L : list, E : integer, Rez : list) 
modificare_lista_aparitii(L, E, Rez) :- incrementare_existent(L, Rez, E) ; adaugare_nou(L, Rez, E).
														
% creare_perechi(L : list, Rez : list)
creare_perechi([], []).
creare_perechi([H | T], New) :- creare_perechi(T, Rez), 
								modificare_lista_aparitii(Rez, H, New).