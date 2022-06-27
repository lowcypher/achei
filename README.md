# Ler Registro Windows Com Linux
Extrair Dados Registro Windows

Problema:

Ler dados/informações do registro do ruwindows de um sistema que não inicia, mas ainda se tem acesso ao disco.

Uma das soluções: copiar o arquivo de registro, o SYSTEM, extrair dados deste arquivo binário para um formato em texto plano ou similar, como por exemplo, XML.

O script está na versão 0.3. Estão mencionados os ajustes feitos no script durante os testes.

Pesquisar no arquivo gerado com os dados por uma string, por exemplo, Hostname da máquina.

Dependende do pacote libehivex-bin

Link Youtube: https://youtu.be/QJDe_q3lEBw

Links utilizados para este script

Verificar se existe programa instalado
https://stackoverflow.com/questions/1298066/how-can-i-check-if-a-package-is-installed-and-install-it-if-not

Verificar se existe arquivo no diretório
#Fonte: https://pt.joecomp.com/how-check-if-file

Pacote libehivex-bin
https://www.kali.org/tools/hivex/
