#!/bin/bash
#
:<<COMENTARIO
Script interativo para fazer a verificação de hash's MD5, SHA256 e SHA512 de arquivos iso's baixados da
internet. Ao executá-lo, será solicitado ao usuário que informe o caminho ABSOLUTO do arquivo ISO cuja
HASH será calculada. Depois será solicitado que seja informada a HASH que será comparada com a HASH
gerada do arquivo ISO. Após informar esses 2 parâmetros, o script vai exibir um menu para ser escolhido
um tipo para que seja realizado o calculo e a comparação dos HASH's. Até o momento o script trabalha com
apenas 3 tipos de HASH's, estes são os mais comumente utilizados para verificação dos arquivos ISO's
em várias distribuições. Se for necessário, futuramente o suporte a outros tipos de HASH's podem ser
incluídos no script. No entanto, se o usuário possuir conhecimentos básicos de shellscript, basta
alterar o script para incluir os HASH's desejados no menu e dentro do bloco CASE.
COMENTARIO
#
read -p "Informe o caminho do arquivo ISO a ser verificado: " arquivoiso
echo -e "${arquivoiso:?Atenção você deve informar a localização da ISO\!} \n"
echo
read -p "Informe a Hash a ser comparada: " hash1
echo -e "${hash1:?Atenção você deve informar a Hash a ser comparada\!}\n"
echo

MENU="
Menu:
1 - md5sum
2 - sha256sum
3 - sha512sum
"

echo "$MENU"
echo
read -p "Escolha uma opção para inicar a comparação dos Hash's: " OPCAO
echo

case "$OPCAO" in

	1)
		# Calculando a soma de verificação de Hash MD5
		hash3=$(md5sum $arquivoiso)
		hash2=$(echo ${hash3:0:32})
		# Realizando a comparação dos Hash's
		[ "$hash1" = "$hash2" ] && echo -e "Os Hash's são iguais! \n" || echo -e "Os Hash's são diferentes! \n"
	;;

	2)
		# Calculando a soma de verificação de Hash SHA256
		hash3=$(sha256sum $arquivoiso)
		hash2=$(echo ${hash3:0:64})
		# Realizando a comparação dos Hash's
		[ "$hash1" = "$hash2" ] && echo -e "Os Hash's são iguais!\n" || echo -e "Os Hash's são diferentes! \n"
	;;

	3)
		# Calculando a soma de verificação de Hash SHA512
		hash3=$(sha512sum $arquivoiso)
		hash2=$(echo ${hash3:0:128})
	 	# Realizando a comparação dos Hash's
		[ "$hash1" = "$hash2" ] && echo -e "Os Hash's são iguais! \n" || echo -e "Os Hash's são diferentes! \n"
	;;
	
	*)	
		echo -e "Opção inválida! \n"
		exit 1
	;;
esac
