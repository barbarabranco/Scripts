#!/bin/bash

cd /Users/barbara/CursoShell/Scripts/imagens-livros
LIST=$(ls -la | awk '{print $9}')
extensao=".jpg"

echo $extensao

# for VAR in $LIST
# do
#     echo REALIZANDO A CONVERSÃO DO ARQUIVO: $VAR
# done

VAR="teste"
echo $VAR

