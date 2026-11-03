
# Trabajo Practico 3 - PowerShell

# Solicitar al usuario un numero limite
$limite = Read-Host "Ingrese un numero limite"

# Convertir el valor ingresado a entero
$limite = [int]$limite

# Ciclo FOR desde 1 hasta el numero limite
for ($i = 1; $i -le $limite; $i++) {

    # Obtener la hora exacta
    $hora = Get-Date -Format "HH:mm:ss"

    # Verificar si el numero es par o impar
    if ($i % 2 -eq 0) {
        Write-Host "Numero ${i}: PAR - Hora: ${hora}" -ForegroundColor Green
    }
    else {
        Write-Host "Numero ${i}: IMPAR - Hora: ${hora}" -ForegroundColor Yellow
    }
}
