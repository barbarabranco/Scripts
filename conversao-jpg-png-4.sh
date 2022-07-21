#!/bin/bash

cd ~/CursoShell/Scripts/imagens-livros
if [ ! -e ~/CursoShell/Scripts/imagens-livros-png ]; then
    echo "[*] Criando pasta PNG"
    mkdir ~/CursoShell/Scripts/imagens-livros-png
fi
echo "[*] Pasta já existe"
for image in *.jpg; do
    image_cut=$(ls $image | awk -F. '{ print $1 }')
    convert $image ~/CursoShell/Scripts/imagens-livros-png/$image_cut.png
done
