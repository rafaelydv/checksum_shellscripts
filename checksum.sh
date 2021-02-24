#!/bin/bash
#
# Script para fazer a verificação do hash MD5, SHA256 e SHA512 de arquivos iso's baixados da internet

read -p "Informe o arquivo ISO a ser verificado: " arquivoiso
echo "${arquivoiso:?Atenção você deve informar a localização da ISO\!}"
echo
read -p "Informe a Hash a ser comparada: " hash1
echo "${hash1:?Atenção você deve informar a Hash a ser comparada\!}"
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
		[ "$hash1" = "$hash2" ] && echo "Os Hash's são iguais!" || echo "Os Hash's são diferentes!"
	;;

	2)
		# Calculando a soma de verificação de Hash SHA256
		hash3=$(sha256sum $arquivoiso)
		hash2=$(echo ${hash3:0:64})
		# Realizando a comparação dos Hash's
		[ "$hash1" = "$hash2" ] && echo "Os Hash's são iguais!" || echo "Os Hash's são diferentes!"
	;;

	3)
		# Calculando a soma de verificação de Hash SHA512
		hash3=$(sha512sum $arquivoiso)
		hash2=$(echo ${hash3:0:128})
	 	# Realizando a comparação dos Hash's
		[ "$hash1" = "$hash2" ] && echo "Os Hash's são iguais!" || echo "Os Hash's são diferentes!"
	;;
	
	*)	
		echo "Opção inválida!"
		exit 1
	;;
esac
