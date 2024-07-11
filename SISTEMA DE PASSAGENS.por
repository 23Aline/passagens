programa {     
            inclua biblioteca Util

            const inteiro tfi = 30, tcol = 10                            
                                                          
            cadeia nome[tfi][tcol], enter, busca      //FILA       //COLUNA
            inteiro idade[tfi][tcol], coluna, fila, x = 0, b = 0, a = 0, y = 0, crianca = 0, jovem = 0, adulto = 0, idoso = 0  
            caracter opcao
            logico encontrado 

  funcao inicio() 
  {       //Direcionamento para o menu principal
          escreva("-------------------------------------------\n")
          escreva("|               SWEET FLIGHT              |\n")
          escreva("-------------------------------------------\n\n") 
          escreva("Seja bem-vindo(a)!\n\n")
          escreva("-------------------------------------------\n")
          escreva("Presione [ENTER] para acessar o menu principal.")      
          leia(enter) 
          menu_principal()
  }

  funcao menu_principal()
  {
          limpa() //Menu principal apresentando as opcoes disponiveis de acordo com as funcoes presentes no programa
          escreva("-------------------------------------------\n")
          escreva("|               SWEET FLIGHT              |\n")
          escreva("-------------------------------------------\n\n") 
          escreva(" 1 - Cadastrar/Editar o total de poltronas da aeronave.\n")      
          escreva(" 2 - Realizar reserva de poltrona.\n")
          escreva(" 3 - Visualizar poltronas disponiveis.\n")
          escreva(" 4 - Visualizar poltronas reservadas.\n")
          escreva(" 5 - Cosultar passageiro pelo nome.\n")
          escreva(" 6 - Visualizar o total de poltronas reservadas e poltronas disponiveis.\n")
          escreva(" 7 - Sair do sistema.\n\n")
          escreva("-------------------------------------------\n")
          escreva("Digite a opcao desejada: ")
          leia(opcao)  

          //Direcionamento para a opcao escolhida
          escolha (opcao) 
          {
                  caso '1':
                  {
                         cadastrar()
                         pare
                  }

                  caso '2':
                  {
                         reserva()
                         pare
                  }

                  caso '3':
                  {
                         polt_disp()
                         pare
                  }  

                  caso '4':
                  {
                         polt_reser()
                         pare
                  }               

                  caso '5':
                  {
                         consultar()
                         pare
                  }

                  caso '6':
                  {
                         listar()
                         pare
                  }

                  caso '7':
                  {
                         sair()
                         pare
                  }

                  caso contrario:
                  {
                  	     escreva("-------------------------------------------\n")
                         escreva("|               SWEET FLIGHT              |\n")
                         escreva("-------------------------------------------\n\n") 
                         escreva("ATENCAO: OPCAO INVALIDA!")
                         Util.aguarde(2000)
                         menu_principal()
                         pare
                  }
          }    
  }

  funcao cadastrar()
  {
          limpa() //Informar/editar a quantidade de poltronas disponiveis
          escreva("-------------------------------------------\n")
          escreva("|         CADASTRO - SWEET FLIGHT         |\n")
          escreva("-------------------------------------------\n\n")  
          
          //Realizar teste par saber se x e y sao iguais a 0
          se(x == 0 e y == 0) 
          {     
          	   //FILA = X 
          	   //COLUNA = Y                       
                  escreva("Qual a quantidade de fileiras? [MAX:", tfi, "]\n")   
                  leia(x)      

                  escreva("Qual a quantidade de colunas? [MAX: ", tcol, "]\n")
                  leia(y)  

                  //Verifica se o valor da quantidade esta dentro do permitido.
                  se(x < 1 ou x > tfi e y < 1 ou y > tcol)
                  {
                          limpa()
                          escreva("-------------------------------------------\n")
                          escreva("|         CADASTRO - SWEET FLIGHT         |\n")
                          escreva("-------------------------------------------\n\n") 
           	           escreva("ATENCAO: Valor nao permitido!")
           	           x = 0 //estaurando o valor padrao
                          y = 0     
           	           Util.aguarde(2000)
           	           menu_principal()
                  }  

                  //Se o valor estiver dentro do permitido, confirmar a quantidade de fila e coluna adicionadas
                  senao
                  {
                          limpa()
                          escreva("-------------------------------------------\n")
                          escreva("|         CADASTRO - SWEET FLIGHT         |\n")
                          escreva("-------------------------------------------\n\n")  
                          escreva("Quantidade de fileiras: ", x, ",\n")
                          escreva("Quantidade de colunas: ", y, ".\n\n")
                          escreva("-----------------------------------\n")
                          escreva("Pressione [ENTER] para retornar ao menu principal!")
                          leia(enter)
                          menu_principal()
                  }
          }
          //Editar a quantidade de poltronas, com base naquelas ja cadastradas
          senao
          {       
          	   // FILA = X e b 
          	   //COLUNA = Y e a
                  escreva("Qual a quantidade de fileiras que deseja adicionar? [MAX: ", tfi-x-b, "]\n")
                  leia(b)

                  escreva("Qual a quantidade de colunas que deseja adicionar? [MAX: ", tcol-y-a, "]\n")
                  leia(a)

                  //Verifica se a quantidade esta dentro do permitido
                  se(a < 1 ou a < y e b < 1 ou b < x)
                  {
                          limpa()
                          escreva("-------------------------------------------\n")
                          escreva("|         CADASTRO - SWEET FLIGHT         |\n")
                          escreva("-------------------------------------------\n\n")  
           	           escreva("ATENCAO: Valor nao permitido!")    
           	           Util.aguarde(2000)
           	           menu_principal()                         
                  }

                  //Confirmar o valor novo de fila e colunas
                  senao
                  {
                          limpa() 
                          escreva("-------------------------------------------\n")
                          escreva("|         CADASTRO - SWEET FLIGHT         |\n")
                          escreva("-------------------------------------------\n\n") 
                          escreva("Alterada a quantidade de fileiras para ", b, ",\n")
                          escreva("Alterada a quantidade de colunas para ", a, ".\n\n")
                          escreva("-------------------------------------------\n")
                          escreva("Pressione [ENTER] para retornar ao menu principal!")
                          leia(enter)
                          x = a  //Atualizar o valor atual
                          y = b 
                          menu_principal()
                  }
          }
  }

  funcao reserva()
  {
          limpa() //Reservar uma poltrona, utilizando a variavel nome e idade do passageiro
          escreva("-------------------------------------------\n")
          escreva("|          RESERVA - SWEET FLIGHT         |\n")
          escreva("-------------------------------------------\n\n")   

          //Se for excolhida antes de decretar a fila e a coluna
          se( x == 0 ou y == 0)
          {
                   escreva("Defina a quantidade de filas e colunas da aeronave primeiro.\n")
                   Util.aguarde(2000)
                   cadastrar()
          }

          escreva("       FILA - COLUNA     \n")
	          	                     
	 	//laco de repeticao para apresentar todas as poltronas disponiveis
	     para(fila = 0; fila < x; fila++)
	     {
		         para(coluna = 0; coluna < y; coluna++)
		         {
		                  //Se a fila e coluna da matriz estiver vazia
		                  se(idade[fila][coluna] == 0)
		                  {
                                                escreva("-------------------------------------------\n")
		                                      escreva("POLTRONA: ", fila, " - ", coluna, ".\n")
		                  }
		         }
	     }

          se( x != 0 ou y != 0)
          {      
          	//Fila e coluna desejada pelo passageiro
                  escreva("\nFila: ")
                  leia(fila)
                  //Checar se a fileira nﾃ｣o ultrapassa o valor permitido
                  se(fila >= x)
                  {
                  	      escreva("\n-------------------------------------------")
                  	      escreva("\nFileira nao encontrada!")
                  	      Util.aguarde(2000)
                  	      reserva()
                  }

                  escreva("Coluna: ")     
                  leia(coluna)
                  //Checar se a coluna nﾃ｣o ultrapassa o valor permitido
                  se(coluna >= y)
                  {
                          escreva("\n-------------------------------------------")
                  	      escreva("\nColuna nao encontrada!")
                  	      Util.aguarde(2000)
                  	      reserva()
                  }

                  //Se a poltrona ainda nao estiver reservada, seguir adiante com o cadastro
                  se(idade[fila][coluna] == 0)
                  {
                          escreva("Nome do passageiro: ")
                          leia(nome[fila][coluna])

                          escreva("Idade do passageiro: ")
                          leia(idade[fila][coluna])
                  }   
    
                  senao
                  {       //Caso a poltrona esteja reservada
                  	      escreva("ATENCAO: POLTRONA INDISPONIVEL!\n")
                  	      Util.aguarde(2000)
                  	      menu_principal()
                  	          
                  }
                  limpa()  //Se a reserva for confirmada, mostrar o nome, a idade e a poltrona escolhida
                  escreva("-------------------------------------------\n")
                  escreva("|          RESERVA - SWEET FLIGHT         |\n")
                  escreva("-------------------------------------------\n\n") 
                  escreva("Reserva realizada com sucesso!\n")
                  escreva("Passageiro: ", nome[fila][coluna], ".\n")
                  escreva("Idade: ", idade[fila][coluna], ".\n")
                  escreva("Poltrona: ", fila, " - ", coluna, ".\n")
                  escreva("-------------------------------------------\n\n")
                  escreva("Pressione [ENTER] para retornar ao menu principal!")
                  leia(enter)
                  fila++
                  coluna++
                  menu_principal()  
          }
  }

  funcao polt_disp()
  {

          //Se for excolhida antes de decretar a fila e a coluna
          se( x == 0 ou y == 0)
          {
          	    limpa() //Se a opcao for excolhida antes de decretar a fila e a coluna
                   escreva("-------------------------------------------\n")
                   escreva("|         DISPONIVEL - SWEET FLIGHT        |\n")
                   escreva("-------------------------------------------\n\n") 
                   escreva("Defina a quantidade de filas e colunas da aeronave primeiro.\n")
                   Util.aguarde(2000)
                   cadastrar()
          }

          senao
          {
  	              limpa() //Mostrar poltronas disponiveis
                   escreva("-------------------------------------------\n")
                   escreva("|         DISPONIVEL - SWEET FLIGHT        |\n")
                   escreva("-------------------------------------------\n\n")
                   escreva("       FILA - COLUNA     \n")
	          	                     
	 	          //laco de repeticao para apresentar todas as passagens disponiveis
	              para(fila = 0; fila < x; fila++)
		         {
		                  para(coluna = 0; coluna < y; coluna++)
		                  {
		                  	        //Se a fila e coluna da matriz estiver vazia
		                        	   se(idade[fila][coluna] == 0)
		                        	   {
                                                escreva("-------------------------------------------\n")
		                                      escreva("POLTRONA: ", fila, " - ", coluna, "   |DISPONIVEL.\n")
		                        	   }
		                  }
	              }
                  
          }
          escreva("-------------------------------------------\n\n")
          escreva("Pressione [ENTER] para retornar ao menu principal.")
		leia(enter)
	     menu_principal() 
         
  }

  funcao polt_reser()
  {
          se( x == 0 ou y == 0)
          {
          	    limpa() //Se for excolhida antes de decretar a fila e a coluna
                   escreva("-------------------------------------------\n")
                   escreva("|        PASSAGEIROS - SWEET FLIGHT       |\n")
                   escreva("-------------------------------------------\n\n")  
                   escreva("Defina a quantidade de filas e colunas da aeronave primeiro.\n")
                   Util.aguarde(2000)
                   cadastrar()
          }

          senao
          {
  	              limpa() //Mostrar todas as poltronas reservadas, revelando o nome, idade, fila e coluna ocupada
                   escreva("-------------------------------------------\n")
                   escreva("|        PASSAGEIROS - SWEET FLIGHT       |\n")
                   escreva("-------------------------------------------\n\n")  
                   escreva("Passagens reservadas: \n")

                  //Se nenhuma passagem tiver sido reservada 
		       se(fila == 0 e coluna == 0)
                 {
          	            limpa()
                           escreva("-------------------------------------------\n")
                           escreva("|        PASSAGEIROS - SWEET FLIGHT       |\n")
                           escreva("-------------------------------------------\n\n")  
		                 escreva("ATENCAO: Nenhuma passagem reservada!")
		                 Util.aguarde(2000)
		                 menu_principal()			          		          	
		       }
		  
		       senao
		       {
		                 //laco de repeticao para apresentar todos os passageiros
		                 para(fila = 0; fila < x; fila++)
		                 { 
		         	                para(coluna = 0; coluna < y; coluna++)
		         	                {
		         	                	    se(idade[fila][coluna] != 0)
		         	                	    {
                                                    escreva("-------------------------------------------\n") 
		                                          escreva("NOME: ", nome[fila][coluna], " | IDADE: ", idade[fila][coluna], " | POLTRONA: ", fila, " - ", coluna, ".\n")
		         	                	    }
		         	                }
		                 }    
		                 escreva("\n-------------------------------------------\n") 
                           escreva("Pressione [ENTER] para retornar ao menu principal.")
		                 leia(enter)
		                 menu_principal()
	         	}   
          }   	
  } 

  funcao consultar()
  {
          se( x == 0 ou y == 0)
          {
          	    limpa() //Se for excolhida antes de decretar a fila e a coluna
                   escreva("-------------------------------------------\n")
                   escreva("|          RESERVAS - SWEET FLIGHT        |\n")
                   escreva("-------------------------------------------\n\n")
                   escreva("Defina a quantidade de filas e colunas da aeronave primeiro.\n")
                   Util.aguarde(2000)
                   cadastrar()
          }

          se( x != 0 ou y != 0)
          {
                   limpa() //Para encontrar a passagem de um determinado passageiro
                   escreva("-------------------------------------------\n")
                   escreva("|          RESERVAS - SWEET FLIGHT        |\n")
                   escreva("-------------------------------------------\n\n")
                   escreva("Informe o nome do passageiro que gostaria de buscar: \n")
                   leia(busca)

                   //Para encontrar o passageiro usando o nome
                  para(fila = 0; fila < x; fila++)
                  {
          	          para(coluna = 0; coluna < y; coluna++)
          	          {
                                  se(busca == nome[fila][coluna])
                                  {
          	                           limpa()
                                          escreva("-------------------------------------------\n")
                                          escreva("|          RESERVAS - SWEET FLIGHT        |\n")
                                          escreva("-------------------------------------------\n\n")
                                          escreva("NOME: ", nome[fila][coluna], " - IDADE: ", idade[fila][coluna], " anos.\n")
                                          escreva("POLTRONA: ", fila, " - ", coluna, ".\n")
                                          encontrado = verdadeiro
                                          escreva("-------------------------------------------\n")
                                          escreva("Pressione [ENTER] para retornar ao menu principal!")
                                          leia(enter)
                                          menu_principal()                                          
                                  }
                                  
                                  se(encontrado == falso)
                                  {
          	                           limpa() //Se nenhum passageiro for encontrado com esse nome
                                          escreva("-------------------------------------------\n")
                                          escreva("|          RESERVAS - SWEET FLIGHT        |\n")
                                          escreva("-------------------------------------------\n\n")
                                          escreva("Nao ha reservas para este passageiro!\n\n")
                                          Util.aguarde(2000)
                                          menu_principal()
                                  }                                 
          	         }
                 }
          }
  }
  
  funcao listar()
  { 
          se( x == 0 ou y == 0)
          {
          	    limpa() //Se for excolhida antes de decretar a fila e a coluna
                   escreva("-------------------------------------------\n")
                   escreva("|               SWEET FLIGHT              |\n")
                   escreva("-------------------------------------------\n\n")
                   escreva("Defina a quantidade de filas e colunas da aeronave primeiro.\n")
                   Util.aguarde(2000)
                   cadastrar()
          }
          
          se( x != 0 ou y != 0 )
          {
                  inteiro val, val2, val3
  	
                  limpa() //Mostrar o total de poltronas, aquelas que estao disponiveis e as que estao reservadas
                  escreva("-------------------------------------------\n")
                  escreva("|               SWEET FLIGHT              |\n")
                  escreva("-------------------------------------------\n\n")
                  escreva("Quantitativo de poltronas: \n\n")

                  //Calculos para encontrar o valor e a porcentagem desejada de cada item                 
                  escreva("Quantidade total de poltronas: ", x*y, ".\n") 
                  val = x*y        
                  escreva("Percentual: ", 100, "%\n")
                  escreva("-------------------------------------------\n")
                 
                  escreva("Quantidade disponivel para reserva: ", x*y-fila*coluna, ".\n")
                  val2 = x*y-fila*coluna
                  escreva("Percentual: ", val2*100/val, "%\n")
                  escreva("-------------------------------------------\n")
                 
                  escreva("Quantidade de poltrona reservadas: ", fila*coluna, ".\n")
                  val3 = fila*coluna
                  escreva("Percentual: ", val3*100/val, "%\n")
              
                  escreva("\n-------------------------------------------\n")
                  escreva("Quantitativo de passajeiros por idade: \n\n")                
                  } 
          }                
  }

  funcao sair()
  {
          limpa() //Para finalizacao do programa
          escreva("-------------------------------------------\n")
          escreva("|      SAIR DO SISTEMA - SWEET FLIGHT     |\n")
          escreva("-------------------------------------------\n\n")   
          escreva("Finalizando programa em 05 segundos...")
          Util.aguarde(1000)

          limpa()
          escreva("-------------------------------------------\n")
          escreva("|      SAIR DO SISTEMA - SWEET FLIGHT     |\n")
          escreva("-------------------------------------------\n\n")   
          escreva("Finalizando programa em 04 segundos...")
          Util.aguarde(1000)

          limpa()
          escreva("-------------------------------------------\n")
          escreva("|      SAIR DO SISTEMA - SWEET FLIGHT     |\n")
          escreva("-------------------------------------------\n\n")   
          escreva("Finalizando programa em 03 segundos...")
          Util.aguarde(1000)
  
          limpa()
          escreva("-------------------------------------------\n")
          escreva("|      SAIR DO SISTEMA - SWEET FLIGHT     |\n")
          escreva("-------------------------------------------\n\n")   
          escreva("Finalizando programa em 02 segundos...")
          Util.aguarde(1000)

          limpa()
          escreva("-------------------------------------------\n")
          escreva("|      SAIR DO SISTEMA - SWEET FLIGHT     |\n")
          escreva("-------------------------------------------\n\n")   
          escreva("Finalizando programa em 01 segundos...")
          Util.aguarde(1000)

          limpa()
          escreva("-------------------------------------------\n")
          escreva("|               SWEET FLIGHT              |\n")
          escreva("-------------------------------------------\n\n")  
          escreva("Programa finalizado!")
  }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 16138; 
 * @DOBRAMENTO-CODIGO = [10, 22, 97, 186, 276, 321, 376, 510];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nome, 6, 19, 4}-{idade, 7, 20, 5}-{x, 7, 52, 1}-{b, 7, 59, 1}-{a, 7, 66, 1}-{y, 7, 73, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
