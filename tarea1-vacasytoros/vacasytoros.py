import random

def numero_aleatorio():
    nro1 = random.randint(1,9)
    nro2 = random.randint(0,9)
    nro3 = random.randint(0,9)
    nro4 = random.randint(0,9)

    while (nro2 == nro1):
        nro2 = random.randint(0,9)

    while (nro3 == nro2 or nro3 == nro1):
        nro3 = random.randint(0,9)
    
    while ( nro4 == nro3 or nro4 == nro3 or nro4 == nro1):
        nro4 = random.randint(0,9)

    return str(nro1) + str(nro2) + str(nro3) + str(nro4)
    
def comparar(x, y):
    vacas = 0; toros = 0
    array = []

    for i in range(len(y)):
        if x[i] == y[i]:
            toros +=1
        elif x[i] in y:
            vacas += 1

    print(f"Hay {vacas} vacas y hay {toros} toros")
    return toros      
    
def permitir_input():
    y = numero_aleatorio()
    toros = 0
    intentos = 0

    while (toros < 4):
        if intentos == 0:
            x = input("Adivina el numero, ingresa un numero de 4 digitos que no se repiten, 0 no puede ser el primero: ")
            intentos += 1
        else: 
            x = input("Intente de nuevo: ")
            intentos += 1

        if len(x) != 4 or not x.isdigit:
            print("Ingrese de nuevo")
            continue
        
        toros = comparar(x,y)
        if toros == 4:
            print(f"Acertaste, el numero era {y}; tu numero de intentos fue: {intentos}!")
            break

permitir_input()
