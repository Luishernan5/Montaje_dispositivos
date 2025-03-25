# Archivo de configuracion de main.sh

function salir() {
    exit 0
}
function cdl() {
    if [ -d "$1" ]; then
        cd $1 && ls
    else
        echo "directorio no encontrado: $1"
    fi 
}
function update() {
    sudo apt-get update && sudo apt-get upgrade -y
}
function pinfo() {
    # Verificar si el proceso existe
    if pgrep $1 > /dev/null; then
        echo "Mostrando información de $1..."
        bash ./bin/pinfo.sh $1
    else
        echo "El proceso $1 no se está ejecutando."
    fi
}
function listar_dispositivos() {
    bash /opt/terminal1/bin/listar_dispositivos.sh
}
# Función para ejecutar el menú de dispositivos en Python
function menu_dispositivos() {
    python3 /opt/terminal1/bin/menu_dispositivos.py
}
