
# ==========================================
# Trabajo practico: Informacion de la PC
# Compatible con Windows y Linux
# ==========================================

Clear-Host

Write-Host "=========================================="
Write-Host "       INFORMACION DEL SISTEMA"
Write-Host "=========================================="

# 1. Version y edicion de PowerShell
Write-Host "`n1. VERSION DE POWERSHELL" -ForegroundColor Yellow
$PSVersionTable

# 2. Politica de ejecucion
Write-Host "`n2. POLITICA DE EJECUCION" -ForegroundColor Yellow
Get-ExecutionPolicy -List

Write-Host "`nPolitica efectiva:"
Get-ExecutionPolicy

# 3. Sistema operativo
Write-Host "`n3. EDICION Y VERSION DEL SISTEMA OPERATIVO" -ForegroundColor Yellow

if ($IsWindows -or $env:OS -eq "Windows_NT") {
    Get-ComputerInfo |
        Select-Object WindowsProductName,
                      WindowsEditionId,
                      WindowsVersion,
                      OsVersion,
                      OsBuildNumber,
                      OsArchitecture
}
elseif ($IsLinux) {
    if (Test-Path "/etc/os-release") {
        Get-Content "/etc/os-release"
    }

    Write-Host "`nKernel de Linux:"
    uname -a
}
elseif ($IsMacOS) {
    sw_vers
}

# 4. Informacion general de la computadora
Write-Host "`n4. INFORMACION GENERAL DE LA PC" -ForegroundColor Yellow

if ($IsWindows -or $env:OS -eq "Windows_NT") {
    Get-ComputerInfo |
        Select-Object CsName,
                      CsManufacturer,
                      CsModel,
                      CsSystemType,
                      CsProcessors,
                      CsTotalPhysicalMemory
}
elseif ($IsLinux) {
    Write-Host "Nombre del equipo:"
    hostname

    Write-Host "`nProcesador:"
    lscpu

    Write-Host "`nMemoria RAM:"
    free -h

    Write-Host "`nEspacio en disco:"
    df -h
}
elseif ($IsMacOS) {
    Write-Host "Nombre del equipo:"
    hostname

    Write-Host "`nProcesador:"
    sysctl -n machdep.cpu.brand_string

    Write-Host "`nMemoria y hardware:"
    system_profiler SPHardwareDataType
}

# 5. Informacion completa del sistema
Write-Host "`n5. INFORMACION DEL SISTEMA MEDIANTE CMD O TERMINAL" -ForegroundColor Yellow

if ($IsWindows -or $env:OS -eq "Windows_NT") {
    systeminfo
}
elseif ($IsLinux) {
    hostnamectl
    Write-Host "`nSistema y kernel:"
    uname -a
}
elseif ($IsMacOS) {
    system_profiler SPSoftwareDataType
}

Write-Host "`n=========================================="
Write-Host "             FIN DEL INFORME"
Write-Host "=========================================="
