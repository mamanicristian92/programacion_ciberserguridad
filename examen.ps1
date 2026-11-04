
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

    # Mostrar fecha y hora
    Write-Host "Fecha y hora: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')"

    Write-Host "`nAdaptadores de red activos:"

    # Verificar si estamos en Linux
    if ($IsLinux) {

        # Obtener interfaces de red activas en Linux
        $interfaces = ip -o link show up

        if ($interfaces) {
            $interfaces | ForEach-Object {
                if ($_ -match '^\d+:\s+([^:@]+)') {
                    Write-Host "Adaptador: $($Matches[1]) - Estado: ACTIVO"
                }
            }
        }
        else {
            Write-Host "No se encontraron adaptadores activos."
        }

    }
    elseif ($IsWindows) {

        # Obtener adaptadores activos en Windows
        Get-NetAdapter |
            Where-Object {$_.Status -eq "Up"} |
            Format-Table Name, Status, LinkSpeed

    }

    # Condicional para identificar par o impar
    if ($i % 2 -eq 0) {
        Write-Host "La iteracion $i es PAR."
        Write-Host "Verificacion par de la red."
    }
    else {
        Write-Host "La iteracion $i es IMPAR."
        Write-Host "Verificacion impar de la red."
    }

    Write-Host "================================="
    Write-Host ""
}

# Mensaje final
Write-Host "MONITOREO DE RED CONCLUIDO CON EXITO."
