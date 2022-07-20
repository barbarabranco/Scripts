#!/bin/bash

#script que recebe parametro na chamada ex: bash xxxx.sh nomeDoLivro 
directory=/Users/barbara/CursoShell/Scripts
cd $directory/imagens-livros
LIST=$(ls -la | awk '{print $9}')

echo "Inicializando job"
if [ ! -e "$directory/imagens-livros-png" ]; then
    echo "[*] Criando pasta"
    mkdir $directory/imagens-livros-png
fi
echo "[*] Pasta já existe"
if [ -e $directory/imagens-livros-png/$1.png ]; then
    echo "Arquivos já existe"
    exit 0
else
    echo "[*] Convertendo arquivo"
    convert $directory/imagens-livros/$1.jpg $directory/imagens-livros-png/$1.png
fi
echo "[*] Finalizando conversão"
