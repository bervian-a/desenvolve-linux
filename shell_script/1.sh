#!/bin/bash
#Pratica final Script

echo "Scripts de exercicios finais do modulo de shell script "
exercicio=1

while [ "$exercicio" -ne "0" ]; do
	sleep 1
	echo "MENU DE EXERCICIOS - Digite o numero do exercicio que desejas executar o script: 1 a 10; 0 para sair "
	read exercicio
#11
#1. ola mundo
	if [ "$exercicio" -eq "1" ]; then
		echo "Olá mundo!"
		continue

#2. nome
	elif [ "$exercicio" -eq "2" ]; then
		echo "digite seu nome"
		read nome
		echo "Olá $nome , seja bem vindo. Sinta-se a vontade de usar o programa"
		continue

#3. numero
	elif [ "$exercicio" -eq "3" ]; then
	        echo "digite um numero para verificar se é positivo ou negativo"
        	read numero
		if [ "$numero" -gt 0 ]; then
	        	echo "O número $numero é positivo"
		elif [ "$numero" -lt 0 ]; then
        	        echo "O número $numero  é negativo"
		elif [ "$numero" == "0" ]; then
        	        echo "O número $numero  é ZERO"
		else
			echo "Entrada inválida"
		fi

		continue


#4.solicite um número do usuário e crie essa quantidade de arquivos logs com a extensão “.txt”.
	elif [ "$exercicio" -eq "4" ]; then
		echo "Quantos arquivos desejas criar? Digite um numero"
		read n
		diretorio=$(date +'%Y%m%d%H%M%S')
		mkdir $diretorio
		cd $diretorio

		for i in $(seq $n); do
			touch "log_$i.txt"
		done
		ls
		echo "Diretório atual é (copie-o para o exercicio 5 ):"
		pwd
		continue

#5.Renomear todos os arquivos do exercicio anterior de “.txt” para “.log"
#encontra o diretório no qual os arquivos estao armazenados
        elif [ "$exercicio" -eq "5" ]; then
		echo "Digite o diretorio no qual os arquivos foram criados"
		read direto

		if [ ! -d "$direto" ]; then
			echo "o diretorio nao existe"
			continue
		fi

		cd "$direto" || exit

#Renomear os arquivos de txt para log
                for arqui in *.txt; do
			if [ -e "$arqui" ]; then
                        arq_log=$(echo "$arqui" | sed 's/\.txt$/.log/')
                        mv "$arqui" "$arq_log"
			fi
		done
		echo "Arquivos renomeados:"
		ls
		continue

#6. solicita ao usuário um número e imprime a multiplicação até 10.
	 elif [ "$exercicio" -eq "6" ]; then
		echo "Digite um numero para ver a tabuada até 10."
                read nmulti
		for i in {1..10}; do
			echo "$nmulti X $i = $((nmulti * i))"
		done
		continue

#7. Arquivo, um diretório ou outro tipo
         elif [ "$exercicio" -eq "7" ]; then
                echo "Digite o nome de um arquivo ou diretório"
                read entrada

		if [ -f "$entrada ]; then
			echo " '$entrada' é um ARQUIVO."
                elif [ -d "$entrada ]; then
                        echo " '$entrada' é um DIRETÓRIO."
                else
                        echo " '$entrada' é um OUTRO TIPO"

		fi
		ls -l "$entrada"

#8.ARGUMENTO  Arquivo, um diretório ou outro tipo
         elif [ "$exercicio" -eq "8" ]; then
                echo "Digite o nome de um arquivo ou diretório"
                read entrada

                if [ -f "$entrada ]; then
                        echo " '$entrada' é um ARQUIVO."
                elif [ -d "$entrada ]; then
                        echo " '$entrada' é um DIRETÓRIO."
                else
                        echo " '$entrada' é um OUTRO TIPO"

                fi
                ls -l "$entrada"


#9. Adivinhação
	elif [ "$exercicio" -eq "9" ]; then
        	aleatorio=$((RANDOM % 100 + 1))
	        adivinha=-1

        	echo "Tente adivinhar um número entre 1 e 100!"

	        while [ "$adivinha" -ne "$aleatorio" ]; do
        	    read adivinha
	            if [ "$adivinha" -lt "$aleatorio" ]; then
        	        echo "Tente um número maior!"
	            elif [ "$adivinha" -gt "$aleatorio" ]; then
        	        echo "Tente um número menor!"
	            else
        	        echo "Parabéns! Você acertou!"
	            fi
	        done

#10. Processos em execução
        elif [ "$exercicio" -eq "10" ]; then
                processos=$(ps aux | wc -l)

                echo "$processos processos em execução"


#Mensagem de despedida ao digitar 0
         elif [ "$exercicio" -eq "0" ]; then
                echo "Tu saistes do programa!"

#Caso o usuario digite uma opção invalida, retorna:
	else
		echo "Opção inválida!"
		continue
	fi
done
