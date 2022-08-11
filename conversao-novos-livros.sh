#!/bin/bash

converte_imagem() {
    local caminho_imagem=$1
    imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    #convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
    rm -rf $imagem_sem_extensao.png
}

varredura_diretorio() {
    cd $1
    for arquivo in *; do
        local caminho_arquivo=$(find ~/CursoShell/Scripts/imagens-novos-livros/ -name $arquivo)
        if [ -d $caminho_arquivo ]; then
            varredura_diretorio $caminho_arquivo
        else
            converte_imagem $caminho_arquivo
        fi
    done
}

#INICIANDO SCRIPT
echo "[*] Iniciando Conversão de imagens!"
varredura_diretorio ~/CursoShell/Scripts/imagens-novos-livros
if [ $? -eq 0 ]; then
    echo "[*] Conversão realizada com sucesso!"
else
    echo "[*] Conversão com falha!"
fi
