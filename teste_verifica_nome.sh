#!/bin/bash

varredura_diretorio() {
    arq=$(egrep -iR '*sonar*' $caminho_arquivo/build.gradle)
    cd $1
    for arquivo in *; do
        local caminho_arquivo=$(find ~/CursoShell/Scripts/imagens-novos-livros/ -name $arquivo)
        if [ -d $caminho_arquivo ]; then
            varredura_diretorio $caminho_arquivo
        else
            echo $arq
        fi
    done
}

echo "Chamando varredura"
varredura_diretorio