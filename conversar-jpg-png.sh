#!/bin/bash

directory=/Users/barbara/CursoShell/Scripts
cd $directory/imagens-livros
LIST=$(ls -la | awk '{print $9}')
ls -la $directory
if [ ! -e $directory/imagens-livros-png ]; then
    echo "[*] Criando pasta para arquivos PNG"
    mkdir $directory/imagens-livros-png
else
    echo "[*] Pasta já existente para arquivos PNG"
fi
ls -la $directory
echo "**************************************"
echo "[*] Executando conversão dos arquivos"
for VAR in $LIST; do
    echo "Convertido: " $VAR
    #convert $directory/imagens-livros/*.jpg $directory/imagens-livros-png/*.png
done
echo "[*] Conversão Finalizada"
echo "**************************************"
echo "[*] Pasta Base"
ls $directory/imagens-livros
echo "[*]  Pasta Conversão"
ls $directory/imagens-livros-png