#!/bin/bash

# Função para verificar o status dos arquivos
verificar_status() {
    local arquivo=$1
    if grep -q "bfgs converged" "$arquivo"; then
        echo "$arquivo: Convergido"
    elif grep -q "convergence NOT achieved" "$arquivo"; then
        echo "$arquivo: Convergência NÃO alcançada"
    else
        echo "$arquivo: Calculando ou erro desconhecido"
    fi
}

# Diretório base (pode ser passado como argumento ou configurado aqui)
DIR_BASE="${1:-.}"

# Vasculha todas as pastas do diretório base, procurando apenas arquivos .out que não comecem com "slurm"
find "$DIR_BASE" -type f -name "*.out" ! -name "slurm*.out" -print0 | while IFS= read -r -d '' arquivo; do
    verificar_status "$arquivo"
done
