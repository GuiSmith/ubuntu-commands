#!/bin/bash

# Detectar qual shell está em uso
current_shell=$(basename "$SHELL")

# Determinar o arquivo de configuração correto
if [ "$current_shell" == "bash" ]; then
    config_file="$HOME/.bashrc"
elif [ "$current_shell" == "zsh" ]; then
    config_file="$HOME/.zshrc"
else
    echo "Shell não suportado."
    exit 1
fi

# Verificar e adicionar o alias no arquivo de configuração
alias_command="alias explorer='xdg-open .'"

if grep -Fxq "$alias_command" "$config_file"; then
    echo "O alias já está presente em $config_file"
else
    echo "$alias_command" >> "$config_file"
    echo "Alias adicionado ao $config_file"
fi

# Aplicar as mudanças
source "$config_file"
echo "Configurações recarregadas."
