#!/bin/bash
# Autores: Eduardo Medeiros e Fabricio Prado
function fn_cabecalho {

	clear
	echo "Script de File Manager"
	echo "Autores: Eduardo Medeiros e Fabricio Prado"
	echo
}

function fn_mostra_localizacao { # Mostra o caminho atual do usuario

	clear
	echo Seu caminho atual é "`pwd`"
	echo
	echo Pressione ENTER para continuar...
	read pause

}

function fn_mostra_tipo_arquivo { # Mostra o tipo de arquivo

	clear
	echo -n "Digite o nome do arquivo: "
	read FILE
	echo
	ls -lah $FILE
	echo
	echo Pressione ENTER para continuar...
	read pause

}

function fn_cria_diretorio { # Cria um diretorio

	clear
	echo -n "Digite o nome do diretorio: "
        read DIR
        echo
        mkdir -vp $DIR
        echo
        echo Pressione ENTER para continuar...
        read pause	
}

function fn_apaga_diretorio { # Apaga um diretorio não vazio 

	clear
	echo -n "Digite o nome do diretorio a ser apagado: "
        read DIR
	echo
        rm -rfv $DIR
        echo
        echo Pressione ENTER para continuar...
        read pause	
}

function fn_mostra_maior_e_menor { # Compara 2 numeros e mostra qual o maior e o menor

	clear
	echo -n "Digite um numero: "
	read NUM1
	echo -n "Digite outro numero: "
	read NUM2
	echo
	if test $NUM1 -gt $NUM2
	then
		echo "Maior = $NUM1, Menor = $NUM2"
	elif test $NUM1 -lt $NUM2
	then
		echo "Maior = $NUM2, Menor = $NUM1"
	else
		echo "Iguais! $NUM1 = $NUM2"
	fi
	echo
	echo Pressione ENTER para continuar...
	read pause
}

function fn_exibe_ultimas_linhas { # Exibe ultimas linhas do arquivo

	clear
	echo -n "Digite o nome do arquivo: "
	read FILE
	echo -n "Digite o número de linhas a serem exibidas: "
	read LINES
	echo
	echo "--- Inicio ---"
	tail -n $LINES $FILE
	echo "--- Fim ---"
	echo
	echo Pressione ENTER para continuar...
	read pause	
}

function fn_exibe_primeiras_linhas { # Exibe primeiras linhas do arquivo

	clear
	echo -n "Digite o nome do arquivo: "
	read FILE
	echo -n "Digite o número de linhas a serem exibidas: "
	read LINES
	echo
	echo "--- Inicio ---"
	head -n $LINES $FILE
	echo "--- Fim ---"
	echo
	echo Pressione ENTER para continuar...
	read pause	

}

function fn_exibe_loc_comando { # Exibe o local do comando

        clear
        echo -n "Digite o comando: "
        read COMANDO
        echo
        which $COMANDO
        echo
        echo Pressione ENTER para continuar...
        read pause

}

function fn_mostra_arvore { # Exibe diretorios em arvore

        clear
        echo "Exibindo a Arvore do diretorio atual"
        echo
        tree
        echo
        echo Pressione ENTER para continuar...
        read pause

}

function fn_copia_arquivo { # copia arquivo
	
	clear
	echo -n "Digite o nome do arquivo: "
	read FILE
	echo -n "Digite o caminho de destino: "
	read DEST
	echo
	cp -v $FILE $DEST	
	echo
	echo Pressione ENTER para continuar...
	read pause	

}

function fn_move_arquivo { # Move arquivo

	clear
	echo -n "Digite o nome do arquivo: "
	read FILE
	echo -n "Digite o caminho de destino: "
	read DEST
	echo
	cp -v $FILE $DEST	
	echo
	echo Pressione ENTER para continuar...
	read pause	

}

function fn_show_menu { # Menu

	fn_cabecalho
	echo
	echo "-- Menu Principal --"
	PS3='Escolha uma das opções: '
	options=("Mostrar a Localização Atual" "Mostrar o Tipo de um Arquivo" "Criar um Diretorio" "Apagar um Diretorio Recursivamente" "Qual é o Maior e o Menor Número?" "Exibir as Últimas Linhas do Arquivo" "Exibir as Primeiras Linhas do Arquivo" "Exibir Localização de um Comando" "Mostrar a Arvore do Diretório" "Copiar um Arquivo para Outro Diretório" "Mover um Arquivo para Outro Diretório" "Sair do Script")
	select opt in "${options[@]}"
	do
		case $opt in	#opções do menu
			"Mostrar a Localização Atual")
				fn_mostra_localizacao
				fn_show_menu
				;;
			"Mostrar o Tipo de um Arquivo")
				fn_mostra_tipo_arquivo
				fn_show_menu
				;;
			"Criar um Diretorio")
				fn_cria_diretorio
				fn_show_menu
				;;
			"Apagar um Diretorio Recursivamente")
				fn_apaga_diretorio
				fn_show_menu
				;;
			"Qual é o Maior e o Menor Número?")
				fn_mostra_maior_e_menor
				fn_show_menu
				;;
			"Exibir as Últimas Linhas do Arquivo")
				fn_exibe_ultimas_linhas
				fn_show_menu
				;;
			"Exibir as Primeiras Linhas do Arquivo")
				fn_exibe_primeiras_linhas
				fn_show_menu
				;;
			"Exibir Localização de um Comando")
                                fn_exibe_loc_comando
                                fn_show_menu
                                ;;
			"Mostrar a Arvore do Diretório")
                                fn_mostra_arvore
                                fn_show_menu
                                ;;
			"Copiar um Arquivo para Outro Diretório")
				fn_copia_arquivo
				fn_show_menu
				;;
			"Mover um Arquivo para Outro Diretório")
				fn_move_arquivo
				fn_show_menu
				;;
			"Sair do Script")
				clear
				echo "Script Encerrado."
				exit
				;;
			*) echo Opção Inválida!!!;; # opção invalida
		esac
	done

}
fn_show_menu
