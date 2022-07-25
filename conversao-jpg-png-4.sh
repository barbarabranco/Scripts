#!/bin/bash

function convertImage() {
    cd ~/CursoShell/Scripts/imagens-livros
    if [ ! -e ~/CursoShell/Scripts/imagens-livros-png ]; then
        echo "[*] Criando pasta ** png **"
        mkdir ~/CursoShell/Scripts/imagens-livros-png
    fi
    echo "[*] Pasta ** png ** já existe"
    for image in *.jpg; do
        # local deixar claro que a variavel só pode ser acessada dentro da função
        local image_cut=$(ls $image | awk -F. '{ print $1 }')
        convert $image ~/CursoShell/Scripts/imagens-livros-png/$image_cut.png
    done
}
# chamando a função e caso de erro enviar na pasta criada
if [ ! -e ~/CursoShell/Scripts/logs ]; then
    mkdir ~/CursoShell/Scripts/logs
    echo "[*] Pasta ** logs ** já existia"
fi
echo "[*] Chamando função"
convertImage 2>~/CursoShell/Scripts/logs/error.txt

# verificação se a função sem falhas o $? significa pegar o status do ultimo processo 0 sucesso, 1 falha
if [ $? -eq 0 ]; then
    echo "[*] Conversão realizada com sucesso"
else
    echo "[*] Falha no processo"
    echo "*****************************"
fi
size=$(wc -c ~/CursoShell/Scripts/logs/error.txt | awk '{ print $1 }')
if [ $size -eq 0 ] ; then
    rm -rf ~/CursoShell/Scripts/logs/
else
    echo "[*] Verificar pasta logs"
fi
