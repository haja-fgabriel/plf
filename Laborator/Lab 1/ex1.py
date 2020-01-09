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
        

    
    
'''
Functie suplimentara care va fi apelata din lista_lungime_para
'''
def calculeaza_paritate(lista, paritate):
    if vida(lista):
        return paritate
    return calculeaza_paritate(sublista(lista), not paritate)

def lista_lungime_para(lista):
    return calculeaza_paritate(lista, True)

lista = creareLista()

print(lista_lungime_para(lista))
