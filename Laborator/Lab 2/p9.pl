%  Elimina secventele consecutive dintr-o lista.
%  eliminare_consecutive(list, list) (i, o)

eliminare_consecutive([], []).
eliminare_consecutive([H], [H]).
eliminare_consecutive([H, H2], [])  :-  H+1 =:= H2, !.
eliminare_consecutive([H, H2, H3 | T], Rez)  :-  H+1 =:= H2, H2+1 =:= H3,
											     eliminare_consecutive([H2, H3| T], Rez).
eliminare_consecutive([H, H2, H3 | T], Rez)  :-  H+1 =:= H2,
											     eliminare_consecutive( [H3 | T], Rez).
eliminare_consecutive([H, H2 | T], [H | Rez]) :- H+1 =\= H2,
												 eliminare_consecutive([H2 | T], Rez).



% Elimina secventele consecutive dintr-o lista eterogena, putand contine, 
%     pe langa numere intregi, liste de numere intregi

% obtine_lista_pana_la_sublista(list, list) (i, o)
obtine_lista_pana_la_sublista([], [], []).
obtine_lista_pana_la_sublista([[] | T2], [], [[] | T2]).
obtine_lista_pana_la_sublista([[H | T] | T2], [], [[H | T] | T2]).
obtine_lista_pana_la_sublista([H | T], [H | Rez], Rez2) :- obtine_lista_pana_la_sublista(T, Rez, Rez2).


% eliminare_consecutive_eterogen(list, list) (i,o)
eliminare_consecutive_eterogen([], []).
eliminare_consecutive_eterogen([[] | T], Rez) 				:- eliminare_consecutive_eterogen(T, Rez).
eliminare_consecutive_eterogen([[H | T] | T2], [R2 | Rez]) 	:- eliminare_consecutive([H|T], R2),
																eliminare_consecutive_eterogen( T2, Rez).
eliminare_consecutive_eterogen([H | T], [R4 | Rez]) 		:- obtine_lista_pana_la_sublista([H|T], R2, R3),
															   eliminare_consecutive(R2, R4),
																eliminare_consecutive_eterogen(R3, Rez).