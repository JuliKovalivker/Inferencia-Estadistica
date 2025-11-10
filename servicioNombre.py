from socket import *
from sys import argv

if __name__ == '__main__':

    if len(argv) != 2 or argv[1][0] != '-' or len(argv[1]) > 50:
        print('Modo de uso:\n   python servicioNombre.py -{tu nombre}')
        quit()

    NOMBRE = argv[1][1:]

    serverSocket = socket(AF_INET, SOCK_DGRAM)
    serverPort = 10000

    serverSocket.bind(("", serverPort))

    clientesProcesados = {}

    print('Recibiendo solicitudes...')
    while True:
        paqueteRecibido, direccionSource = serverSocket.recvfrom(1024)

        print(f'Paquete recibido desde {direccionSource[0]}:{direccionSource[1]}' )
        print(f'    Con mensaje: {paqueteRecibido.decode()}' )
        

        respuesta = bytes(f'Hola, soy {NOMBRE}!'.encode())
        
        serverSocket.sendto( respuesta, direccionSource)




