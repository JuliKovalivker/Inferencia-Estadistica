from socket import *
from sys import argv

if __name__ == '__main__':

    if len(argv) != 2 or argv[1][0] != '-' or len(argv[1]) > 4*4:
        print('Modo de uso:\n   python checkIP.py -{IP a chequear}')
        quit()

    IP = argv[1][1:]

    clientSocket = socket(AF_INET, SOCK_DGRAM)
    clientSocket.settimeout(3) # espero como maximo 3 segundos

    while True:
        #consulta = 'Hola, quien sos (soy juli)?'.encode()
        consulta = input()
        consulta = consulta.encode()

        direccionAChequear = (IP, 10000)

        clientSocket.sendto(consulta, direccionAChequear)

        try:
            respuesta, server = clientSocket.recvfrom(1024)
            print(f'El host {IP} respondio: \'{respuesta.decode()}\'')     

        #If data is not received back from server, print it has timed out  
        except timeout:
            print('No se recibio respuesta del servidor...')