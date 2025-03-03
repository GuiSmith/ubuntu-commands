  GNU nano 7.2                   clean_downloads.sh                             
#!/bin/bash

# Caminho para a pasta Downloads
downloads_dir="$HOME/Downloads"

# Verifica se a pasta existe
if [ -d "$downloads_dir" ]; then
    # Remove todos os arquivos e subpastas dentro de Downloads
    rm -rf "${downloads_dir:?}"/*
    echo "A pasta Downloads foi limpa."
else
    echo "A pasta Downloads não existe."
fi







                              [ 13 linhas lidas ]
^G Ajuda     ^O Gravar    ^W Onde está?^K Recortar  ^T Executar  ^C Local
^X Sair      ^R Ler o arq ^\ Substituir^U Colar     ^J Justificar^/ Ir p/ linha
