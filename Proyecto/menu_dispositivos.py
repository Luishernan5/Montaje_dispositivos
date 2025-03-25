import subprocess

# funcion para montar un dispositivo :
def montar_dispositivo():
    dispositivo = input("Ingrese el nombre del dispositivo (sda1): ")
    punto_montaje = input("Ingrese el punto de montaje (/mnt/usb): ")
    try:
        subprocess.run(['sudo', 'mount', f'/dev/{dispositivo}', punto_montaje])
        print(f"Dispositivo /dev/{dispositivo} montado en {punto_montaje}")
    except Exception as e:
        print(f"Error al montar el dispositivo: {e}")

# funcion para desmontar un dispositivo:
def desmontar_dispositivo():
    dispositivo = input("Ingrese el nombre del dispositivo (sda1): ")
    try:
        subprocess.run(['sudo', 'umount', f'/dev/{dispositivo}'])
        print(f"Dispositivo /dev/{dispositivo} desmontado correctamente.")
    except Exception as e:
        print(f"Error al desmontar el dispositivo: {e}")

# funcion del menú:
def menu():
    while True:
        print("\nSeleccione una opcion:")
        print("1) Montar dispositivo")
        print("2) Desmontar dispositivo")
        print("3) Salir")
        
        try:
            option = int(input("Opcion: "))
            if option == 1:
                montar_dispositivo()
            elif option == 2:
                desmontar_dispositivo()
            elif option == 3:
                break
            else:
                print("Opción invAlida. Por favor, intente de nuevo.")
        except ValueError:
            print("Entrada no vAlida. Por favor, ingrese un nUmero.")
            
if __name__ == "__main__":
    menu()