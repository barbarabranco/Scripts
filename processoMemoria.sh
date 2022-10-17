#!/bin/bash


processos=$(ps -e -o pid -m | head -n 11 | grep '[0-9]')

for pid in $processos
do
    nome_processo=$(ps -p $pid -o ucomm=)
    #comando que pega o nome do processo
    echo -n $(date +%F, %H:%M:%S) >> $nome_processo.log
    tamanho_processo=$(ps -p $pid -o vsize | grep '[0-9]')
    #comando que converte o valor do pid em MB
    echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> $nome_processo.log
done


