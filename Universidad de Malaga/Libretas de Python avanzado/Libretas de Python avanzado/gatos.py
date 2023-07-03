class Gato:
    def __init__(self, pelaje, caracter, alimentado):
        self.pelaje = pelaje
        self.caracter = caracter
        self.alimentado = alimentado
        
    def acariciar(self):
        if self.caracter == "amigable":
            print("Acariciando al gato")
        else:
            print("Acariciando con cuidado al gato")
    
    def alimentar(self):
        if not self.alimentado:
            print("Dando de comer al gato")
            self.alimentado = True
        else:
            print("El gato no tiene hambre")