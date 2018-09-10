#!/bin/bash

#Script para execução do graphwalker

#verifica se a pasta ja se encontra na máquina. Aqui optou-se por salvar na home do usuario
installdir="$HOME/graphwalker"

#versão do arquivo para liha de comando
clfilename="$installdir/graphwalker-cli-3.4.2.jar"

#versao do arquivo para web
webfilename="$installdir/graphwalker-cli-4.0.0-SNAPSHOT.jar"

if [ ! -d "$installdir" ]; then
    #cria o diretorio na pasta home
    mkdir "$installdir"
    #faz o download do arquivo
    #download do arquivo - versão terminal
    clversion=$(wget --output-document=$clfilename http://graphwalker.github.io/content/archive/graphwalker-cli-3.4.2.jar)
    #donwload do arquivo 0 versão web
    webversion=$(wget --output-document=$webfilename --server-response https://bintray.com/graphwalker/graphwalker/download_file?file_path=SNAPSHOTS%2Fgraphwalker-cli-4.0.0-SNAPSHOT.jar)
fi

#Execução do arquivo
echo "Qual modo de execução desejado?"
echo
echo "Para tela digite 1"
echo "Para navegador digite 2"
echo
read -p "Modo: " modo
while [ "$modo" -ge 3 ]; do
    echo "Opção inválida. Tente novamente"
    read -p "Modo: " modo
done

