
# ==========================================
# GRUPO 2
# Monitoreo del estado de la red
# Modulo: Programacion para Seguridad Informatica
# Docente: Lic. Carlos Pacheco
# ==========================================

# Ciclo repetitivo de exactamente 3 iteraciones
for ($i = 1; $i -le 3; $i++) {

    Write-Host "================================="
    Write-Host "Verificacion numero: $i"
    
    # Mostrar fecha y hora exacta
    Write-Host "Fecha y hora: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')"

    # Obtener adaptadores de red activos
    Write-Host "`nAdaptadores de red activos:"
    Get-NetAdapter | Where-Object {$_.Status -eq "Up"}

    # Estructura condicional: par o impar
    if ($i % 2 -eq 0) {
        Write-Host "La iteracion $i es PAR."
        Write-Host "Se realiza una verificacion par de la red."
    }
    else {
        Write-Host "La iteracion $i es IMPAR."
        Write-Host "Se realiza una verificacion impar de la red."
    }

    Write-Host "================================="
    Write-Host ""
}

# Mensaje final
Write-Host "MONITOREO DE RED CONCLUIDO CON EXITO."
