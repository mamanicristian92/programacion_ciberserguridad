
# Solicitar las horas trabajadas
$horas = [double](Read-Host "Introduce el numero de horas trabajadas")

# Solicitar el coste por hora
$coste = [double](Read-Host "Introduce el coste por hora")

# Calcular la paga
$paga = $horas * $coste

# Mostrar el resultado
Write-Host "La paga que te corresponde es: $paga"
