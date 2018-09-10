#!/bin/bash

#Script para execução do graphwalker

#verifica se a pasta ja se encontra na máquina. Aqui optou-se por salvar na home do usuario
installdir="$HOME/graphwalker"

#versão do arquivo para liha de comando
clfilename="$installdir/graphwalker-cli-3.4.2.jar"

#versao do arquivo para web
webfilename="$installdir/graphwalker-studio-4.0.0-SNAPSHOT.jar"

if [ ! -d "$installdir" ]; then
    #cria o diretorio na pasta home
    mkdir "$installdir"
    #faz o download do arquivo
    #download do arquivo - versão terminal
    clversion=$(wget --output-document=$clfilename http://graphwalker.github.io/content/archive/graphwalker-cli-3.4.2.jar)
    #donwload do arquivo 0 versão web
    webversion=$(wget --output-document=$webfilename https://bintray.com/graphwalker/graphwalker/download_file?file_path=SNAPSHOTS%2Fgraphwalker-cli-4.0.0-SNAPSHOT.jar)
fi

#Execução do arquivo
iniciarAplicacao()
{
    echo "Qual modo de execução desejado?"
    echo
    echo "Para sair digite 0"
    echo "Para modo linha de comando digite 1"
    echo "Para navegador digite 2"
    echo
    read -p "Modo: " modo
    while [ "$modo" -ge 3 ]; do
        echo "Opção inválida. Tente novamente"
        read -p "Modo: " modo
    done

    case $modo in
        0) exit 1
        ;;
        1) read -p "Arquivos: " arquivos
            java -jar $clfilename offline -m $arquivos "random(edge_coverage(100))" -u
        ;;
        2) java -jar $webfilename
        ;;
    esac
}

#Instalacao do java 8
instalarJava()
{
    #Adicionado ao repositorio
    sudo add-apt-respository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
}

#valida se o java está instalado
if [[ -n $(type -p java) ]]; then
    iniciarAplicacao
else
    instalarJava
    iniciarAplicacao
fi