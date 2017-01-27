@echo off

set var1=_
set var2=-
 
xcopy "C:\Users\%username%\Desktop\bkp\*.*" f:\ /I/E/V/F/D/Y/C 


echo.
echo BACK-UP CONCLUIDO!!!
echo.
 
pause

rem XCOPY origem [destino] [/A | /M] [/D[:data]] [/P] [/S [/E]] [/V] [/W] [/C] [/I] [/Q] [/F] [/L] [/G] [/H] [/R] [/T] [/] [/N] [/O] [/X] [/Y] [/-Y] [/Z] [/EXCLUDE:arquivo1[+arquivo2][+arquivo3]...]

rem  origem		Especifica o(s) arquivo(s) a ser(em) copiado(s).
rem  destino	Especifica o local e/ou o nome dos novos arquivos.
rem  /A			Copia somente arquivos com o atributo de arquivamento definido não altera o atributo.
rem  /M			Copia somente arquivos com o atributo de arquivamento definido desativa o atributo de arquivamento.
rem  /D:m-d-y	Copia arquivos alterados durante ou após a data especificada Se nenhuma data for definida, copia somente os arquivos cujos tempo de origem seja mais novo do que o tempo de destino.
rem  /EXCLUDE:arquivo1[+arquivo2][+arquivo3]...
rem    		 	Especifica uma lista de arquivos contendo seqüências de
rem    		 	caracteres. Cada seqüência de caracteres deve estar em uma
rem    		 	linha separada nos arquivos. Quando qualquer seqüência
rem    		 	de caracteres corresponde a qualquer parte do caminho absol
rem    		 	do arquivo a ser copiado, esse arquivo deixa de ser copiado
rem    		 	Por exemplo, especificar uma seqüência de caracteres como
rem    		 	\obj\ ou .obj excluirá todos os arquivos sob a pasta obj ou
rem    		 	todos os arquivos com a extensão .obj, respectivamente.
rem                
rem  /P		Solicita confirmação antes de criar cada arquivo de destino
rem  /S		Copia pastas e subpastas, exceto as vazias.
rem  /E		Copia pastas e subpastas, inclusive as vazias. O mesmo que /S /E. Pode ser usado para modificar /T.
rem  /V		Verifica cada novo arquivo.
rem  /W		Solicita que você pressione uma tecla antes de copiar.
rem  /C		Continua copiando, mesmo que ocorram erros.
rem  /I		Se o destino não existir e estiver copiando mais de um arquivo pressupõe que o destino deva ser uma pasta.
rem  /Q		Não exibe nomes de arquivos ao copiar.
rem  /F		Exibe os nomes de arquivos de origem e de destino completos ao copiar.
rem  /L		Exibe arquivos que seriam copiados.
rem  /G		Permite a cópia de arquivos criptografados para um destino que não tenha suporte para criptografia.
rem  /H		Copia arquivos ocultos e do sistema também.
rem  /R		Substitui arquivos somente leitura.
rem  /T		Cria a estrutura de pastas, mas não copia arquivos. Não inclui pastas ou subpastas vazias. /T /E inclui pastas e subpastas vazias.
rem  /U		Copia apenas os arquivos que já existem no destino.
rem  /K		Copia atributos. Xcopy normal redefinirá os atributos somente leitura.
rem  /N		Copia usando os nomes curtos gerados.
rem  /O		Copia a posse do arquivo e as informações sobre a lista de controle de acesso.
rem  /X		Copia configurações de auditoria de arquivo (implica /O).
rem  /Y		Suprime o prompt para você confirmar se deseja substituir um arquivo de destino existente.
rem  /-Y	Exibe o prompt para você confirmar se deseja substituir um arquivo de destino existente.
rem  /Z		Copia arquivos de rede no modo reiniciável.
rem  A opção /Y pode ser predefinida na variável de ambiente COPYCMD.

exit