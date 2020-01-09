% candidat(E : integer, L : list) (i, i, o) - nedeterminist
candidat([H|_], H).
candidat([_|T], Rez) :- candidat(T, Rez).	


% apare(L : list, E : integer) (i, i) - determinist
apare([H|_], H) :- !.
apare([_|T], E) :- apare(T, E).

% aranjamente(Li : list, L : list, Lung : integer, K : integer, Rez : list) (i, i, i, i, o) - nedeterminist
aranjamente(_, Col, K, K, Col).
aranjamente(Li, Col, Lung, K, Rez) :- Lung < K, 
								  candidat(Li, H1),
								  \+apare(Col, H1),
								  Lung1 is Lung+1,
								  aranjamente(Li, [H1 | Col], Lung1, K, Rez).

aranjamente(L, K, Rez) :- findall(R, aranjamente(L, [], 0, K, R), Rez).
