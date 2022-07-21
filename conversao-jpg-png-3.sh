#!/bin/bash

caminho=~/CursoShell/Scripts

# $@ pode ser passado quantas variaveis eu quiser na chamada do script

if [ ! -e $caminho/imagens-livros-png ]; then
    echo "[*] Criando pasta PNG"
    mkdir imagens-livros-png
fi
echo "[*] Pasta já existe"
for image in $@; do
    convert $caminho/imagens-livros/$image.jpg $caminho/imagens-livros-png/$image.png
done
