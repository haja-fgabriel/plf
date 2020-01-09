mama(a,b). 
mama(e,b). 
tata(c,d). 
tata(a,d). 
parinte(X,Y) :-tata(X,Y). 
parinte(X,Y) :-mama(X,Y). 
frate(X,Y) :-parinte(X,Z),parinte(Y,Z),X\=Y.


a(1).
a(2).
a(3).
b(1).
b(2).
b(3).
c(1).
c(2).
c(3).
go(X,Y,Z) :- a(X), !, b(Y), c(Z).

data(2, "februarie", 1998).
