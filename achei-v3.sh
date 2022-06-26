#!/bin/bash

#############################################
#Converter arquivo SYSTEM (arquivo de registro do lixo ruwindows)
#Arquivo em C:\Windows\System32\config\
#Extrair hostname do arquivo
###########################################
#Autor: Mario Medeiros
#Data: 2022-05-19
#Versão: 0.1
#Dependências: libhivex-bin
#Instalar utilizando: apt-get install libhivex-bin
#############################
#Data: 2022-06-11
#Versão: 0.2
#Adicionado verificador de pacotes instalados que procura pelo pacote acima
#Caso exista, inicia o processo de extração dos dados para xml
#Se não estiver instalado, solicita instalação.
##########################################
#Data: 2022-06-16
#Versão: 0.2.1
#Adicionado a opção de escolher o que deve ser pesquisado no arquivo xml
#Esta opção pode não ser a mais adequada, uma vez que é necessário saber a 
#string exata para ter um resultado mais limpo possível.
######################################
#Data: 2022-06-17
#Versão 0.3
#Adicionada função que verifica se arquivo xml já existe, evitando que seja
#feito extração/conversão toda vez que o script for executado.
#
###########################################

##############################################################################
#Abaixo a função/script/algoritmo em shell que verifica se existe o pacote
#instalado.
#Com o pacote instalado, já executa senão solicita instalação.
##############################################################################

pkg=libhivex-bin
status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
  echo "Necessário Instalar Pacote $pkg"
  sudo apt-get install $pkg -y
  else
  echo "Pacote libhivex-bin Instalado, Prosseguindo!"
fi


#Abaixo verifica se arquivo registro.xml já existe para não extrair tudo 
#novamente e ir direto à pesquisa


FILE=registro.xml 
if test -f "$FILE";
then 

#Abaixo o script solicita que seja digitada a palavra/string para pesquisa

echo "Digite a string a ser pesquisada no arquivo registro.xml"
echo ""
read palavra

#Com a palavra escolhida é feita a pesquisa com a saída na tela
cat registro.xml | grep "$palavra" | cut -d: -f7 | uniq 

#Abaixo, o exemplo grava o resultado da pesquisa em um arquivo txt
#cat registro.xml | grep "$palavra" | cut -d: -f7 | uniq | awk '{print $44 $45 $46}' #>> dados-do-registro.txt

else hivexml -d SYSTEM > registro.xml

echo "Digite a string a ser pesquisada no arquivo registro.xml"
echo ""
read palavra

cat registro.xml | grep "$palavra" | cut -d: -f7 | uniq
#Abaixo, o exemplo grava o resultado da pesquisa em um arquivo txt
#cat registro.xml | grep "NV Hostname" | cut -d: -f7 | uniq | awk '{print $44 $45 $46}' >> dados-do-registro.txt
#cat registro.xml | grep "$palavra" | cut -d: -f7 | uniq | awk '{print $44 $45 $46}' #>> dados-do-registro.txt

fi

#Obs 0:
#Copiar o arquivo SYSTEM para um diretório do Linux para extração dos dados é mais apropriado.

#Obs 1: para cada ruwimblows o arquivo SYSYEM muda seu conteúdo sendo que nem sempre os valores dos dados estarão nas mesmas colunas.
#Talvez limitar o tamanho da linha de comando para até antes do awk pode ter melhor resultado.
