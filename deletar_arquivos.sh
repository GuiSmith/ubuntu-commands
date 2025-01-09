#!/bin/bash

# Caminho da pasta
FOLDER_PATH="/home/ixcsoft/Área de Trabalho/downloads"

# Verifica se a pasta existe
if [ -d "$FOLDER_PATH" ]; then
    echo "Deletando arquivos da pasta: $FOLDER_PATH"
    # Remove todos os arquivos dentro da pasta
    rm -rf "$FOLDER_PATH"/*
    echo "Arquivos deletados com sucesso!"
else
    echo "Erro: A pasta $FOLDER_PATH não existe."
fi
