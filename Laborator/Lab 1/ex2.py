class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None
    
class Lista:
    def __init__(self):
        self.prim = None
        

'''
crearea unei liste din valori citite pana la 0
'''
def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista

def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod

def adauga_inLista(lista, e):
    nod = Nod(e)
    nod.urm = lista.prim
    lista.prim = nod
    return lista

'''
tiparirea elementelor unei liste
'''
def tipar(lista):
    tipar_rec(lista.prim)
    
def tipar_rec(nod):
    if nod != None:
        print (nod.e)
        tipar_rec(nod.urm)

def vida(lista):
    return lista.prim == None

def sublista(lista):
    nou = Lista()
    nou.prim = lista.prim.urm
    return nou

def prim_element(lista):
    if lista.prim == None:
        return None
    return lista.prim.e
        


    
def elimina_e(lista, e):
    if vida(lista):
        return Lista()
    elif prim_element(lista) == e:
        return elimina_e(sublista(lista), e)
    else:
        return adauga_inLista(elimina_e(sublista(lista), e), prim_element(lista))

lista = creareLista()
x = int(input("Element de eliminat: "))
nou = elimina_e(lista, x)
tipar(nou)
