<<<<<<< HEAD
IF Thisform.opera_1.Value = "Calcular a contribuição" 

	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
*	i_empr       	= "9000 - GIORGIA" 
*	i_situ         	= "EM ABERTO" 
	i_val_base  	= Thisform.vlbase_1.Value 
	i_func_dec  	= Thisform.nfunc_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* Instrução para monta a URL *

	* 1 - Serviço para calcular a contribuição 

	i_instrucao = "http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+i_tipo+"&servico="+i_servico+;
	"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont+"&base="+i_val_base+"&funcionarios="+i_func_dec 


	* Cria o Objeto para consulta e retormo em xml *
	objsrvxml = CREATEOBJECT("MSXML2.ServerXMLHTTP.3.0")
	objsrvxml.OPEN("GET",i_instrucao,.F.)
	objsrvxml.SEND()

	* Pega retorno do objeto Objsrvxml
	objresulxml  = CREATEOBJECT("MSXML2.DomDocument")
	objresulxml.LOADXML(objsrvxml.responsetext)

	* Variavel com o resultado da entrega *
	i_significado = objresulxml.selectnodes("//SIGNIFICADO").ITEM(0).TEXT


	IF i_significado = "OK"
	
	   i_fez_1 = 'sim'

		* Variavel com o resultado da entrega *
		i_significado   = objresulxml.selectnodes("//SIGNIFICADO").ITEM(0).TEXT
		* i_mensa_xml_01  = objresulxml.selectnodes("//MENSAGEM").ITEM(0).TEXT
		i_numero 		= objresulxml.selectnodes("//NUMERO").ITEM(0).TEXT
		i_cnpj 			= objresulxml.selectnodes("//CNPJ").ITEM(0).TEXT
		i_nome 			= objresulxml.selectnodes("//NOME").ITEM(0).TEXT
		i_tipo 			= objresulxml.selectnodes("//TIPO").ITEM(0).TEXT
		i_mes 			= objresulxml.selectnodes("//MES").ITEM(0).TEXT
		i_vencimento 	= objresulxml.selectnodes("//VENCIMENTO").ITEM(0).TEXT
		i_valor 		= objresulxml.selectnodes("//VALOR").ITEM(0).TEXT
		i_taxa 			= objresulxml.selectnodes("//TAXA").ITEM(0).TEXT
		i_correcao 		= objresulxml.selectnodes("//CORRECAO").ITEM(0).TEXT
		i_multa 		= objresulxml.selectnodes("//MULTA").ITEM(0).TEXT
		i_juro 			= objresulxml.selectnodes("//JURO").ITEM(0).TEXT
		i_apagar		= objresulxml.selectnodes("//APAGAR").ITEM(0).TEXT

        Thisform.valor_1.Value = i_apagar
        Thisform.Text90.Value = i_nome
        
		    
		 cText = "Transação efetuada com sucesso  "+ ALLTRIM(i_significado) + "." + CHR(13) + " 1 - Calcular a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
		 
		* ? i_numero
		*? i_cnpj
		*? (Upper(CHRTRAN(i_nome, "ÁÉÍÓÚáéíóúÀÈÌÒÙàèìòùÂÊÎÔÛâêîôûÄËÏÖÜäëïöüÃÕãõÇçÑñº", "AEIOUaeiouAEIOUaeiouAEIOUaeiouAEIOUaeiouAOaoCcNno")))    
		*? i_tipo
		*? i_mes
		*? i_vencimento
		*? i_valor
		*? i_taxa
		*? i_correcao
	    *? i_multa
		*? i_juro
		*? i_apagar
        
	ELSE
		 
		 cText = "Transação NÃO efetuada.  " + CHR(13) + " 1 - Calcular a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF


IF i_fez_1 = 'sim'

   * OK
   
ELSE

	cText = "URL NÃO encontrada.  " + CHR(13) + " 1 - Calcular a Contribuição"
	cTitu  = "Caixa" 
	=messageBox(cText, cTitu)


ENDIF


ENDIF

IF Thisform.opera_1.Value = "Baixar a contribuição" 


	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
	i_valor1    	= Thisform.valor_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* 2 - Serviço para baixar a contribuição 

	i_instrucao2 = ALLTRIM("http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+;
	i_tipo +"&servico="+i_servico+"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont+"&valor="+i_valor1) 


	Local lc_url_procura2, srvXMLHttp, xmlResult, resultado

	lc_url_procura2 = i_instrucao2


	srvXMLHttp = Createobject("MSXML2.ServerXMLHTTP.3.0")
	srvXMLHttp.Open("GET",lc_url_procura2,.F.)
	srvXMLHttp.Send()
	*!*MESSAGEBOX(srvXMLHttp.responseText)

	Store " " To resultado, i_significado

	*Cria objeto e Adquiri resultado da busca em formato XML
	xmlResult = Createobject("MSXML2.DomDocument")
	xmlResult.LoadXML(srvXMLHttp.ResponseText)

	* Recupera valores do resultado da busca

	resultado = xmlResult.SelectNodes("//SIGNIFICADO" ).Item(0).Text
	mensa  = xmlResult.SelectNodes("//MENSAGEM" ).Item(0).Text

	* Caso ocorra alguma irregularidade os nós abaixo não vão existir
	* portanto para evitar erros pegaremos os valore apenas se o resultado for positivo

	If resultado = 'OK'

	    i_significado   = xmlResult.selectnodes("//SIGNIFICADO").ITEM(0).TEXT
		i_numero 		= xmlResult.selectnodes("//NUMERO").ITEM(0).TEXT
		i_cnpj 			= xmlResult.selectnodes("//CNPJ").ITEM(0).TEXT
		i_nome 			= xmlResult.selectnodes("//NOME").ITEM(0).TEXT
		i_tipo 			= xmlResult.selectnodes("//TIPO").ITEM(0).TEXT
		i_mes 			= xmlResult.selectnodes("//MES").ITEM(0).TEXT
		i_vencimento	= xmlResult.selectnodes("//VENCIMENTO").ITEM(0).TEXT
		i_valor 		= xmlResult.selectnodes("//VALOR").ITEM(0).TEXT
		i_taxa 			= xmlResult.selectnodes("//TAXA").ITEM(0).TEXT
		i_correcao 		= xmlResult.selectnodes("//CORRECAO").ITEM(0).TEXT
		i_multa 		= xmlResult.selectnodes("//MULTA").ITEM(0).TEXT
		i_juro 			= xmlResult.selectnodes("//JURO").ITEM(0).TEXT
		i_apagar 		= xmlResult.selectnodes("//APAGAR").ITEM(0).TEXT
		i_pago 			= xmlResult.selectnodes("//PAGO").ITEM(0).TEXT
		i_saldo 		= xmlResult.selectnodes("//SALDO").ITEM(0).TEXT
		i_lote 			= xmlResult.selectnodes("//LOTE").ITEM(0).TEXT


		* Variavel com o resultado da entrega *

        Thisform.Text90.Value = i_nome
        
			 cText = "Transação efetuada com sucesso  " + i_significado + CHR(13) + " 2 - Baixar a Contribuição"
			 cTitu  = "Caixa" 
			 =messageBox(cText, cTitu)

			       *** Processo de Armazenar
				   linha1 = ThisForm.txtRec.Value
			       linha2 = ThisForm.txtMensagem.Value
			       linha3 = Time()
			       linha4 = dtoc(Date())
			       linha6 = ThisForm.txtQtd.Value
			       linha7 = ThisForm.txtChec.Value
			       linha8 = "    ]1x"+ALLTRIM(agile_tipo)+"  "+i_valor+"="+STR(i_apagar)+ " - "+i_mes
			       linha9 = i_apagar && VAL(TRANSFORM(ThisForm.txtTotal.Value, "9,999,999.99"))
			       linha10 = i_mes
			       linha11 = i_valor
			       linha12 = i_cnpj

	               * Atalizar Banco  
	               SQLexec(privConexao,'Select * from resumo3 ORDER BY cod DESC LIMIT 0,1',"resumo3")
	 
			       GO BOTTOM
			       STORE (COD + 1) TO mCODIGO
			       *
			       *   Rotina para inclusão
			       *
				   i_sy_data = Dtoc(Date())
				   i_sy_time = Time()

				   i_txqtd   = 1
				   i_txUnit  = i_valor
				   i_txTotal = i_apagar
				   i_txChec  = ALLTRIM(Thisform.agile_tipo.Value)
				   i_txRec2   = 21
				   i_txmensa = i_servico
				   i_txRec   = i_servico
				   rr_cod    = i_numero
				   oper_caixa = Thisform.txtOperadora.Value 
				    
	               ThisForm.txtMov.Value = ThisForm.txtMov.Value + VAL(i_txTotal)
	               
	               ThisForm.txtSoma.Value = ThisForm.txtSoma.Value + VAL(i_txTotal)
	  
	   			   cst=[insert into resumo3(COD,DAT1,HORA,T_MOED,T_MOV,DESC_1,Q_MES,VL_UNI,VL_TOT,COD_TI,NU_TI,OBS) values (?mCODIGO,?i_sy_data,?i_sy_time,?i_txChec,?i_txRec2,?i_txmensa,?i_txqtd,?i_txUnit,?i_txTotal,?rr_cod,?rr_nu,?oper_caixa)] 
				   = sqlsetprop(privConexao,'DispWarnings',.t.) 
				   = SQLPREPARE(privConexao,cst,'rsresumo3') 
				   = SQLEXEC(privConexao) 

	   
			       ****** Imprime Recibo

			       SET DEVICE TO PRINTER
	*		       ??? chr(15)+chr(14)
	*		       ??? chr(18)+chr(15)
	               ??? CHR(15)+CHR(13) 

	 	                                        &&   1234567890123456789012345678901234567890    
			                                    &&            10        20        30        40 
			          @ PROW() + 01,03 SAY chr(15) + " SINDICATO DOS EMPREG. DE EDIFICIOS E COND. SP   " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " ZEL.PORT.CAB.FAX.VIG.SERV E OUTROS              " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " R. SETE DE ABRIL, 34 -S.PAULO-SP TEL.11-31233211" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " CNPJ: 43.070.481/0001-14 I.ISENTO               " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "= ============================================= =" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "Data "+DTOC(Date())+" Hora "+time()+" Caixa "+ThisForm.txtOperadora.Value +CHR(13) 
			          @ PROW() + 01,03 SAY chr(15) + "- --------------------------------------------- -" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "COMPROVANTE DE RECEBIMENTO"+" "+STR(mCODIGO)+CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + SUBSTR(i_tipo,1,90)+" "+i_numero+CHR(13)                 
			          @ PROW() + 01,03 SAY chr(15) + "SIND"
			          @ PROW() + 00,03 SAY chr(15) + "    ["
			          @ PROW() + 00,03 SAY chr(15) + "    !"
			          @ PROW() + 00,03 SAY chr(15) + "    ]1x"+ALLTRIM(Thisform.agile_tipo.Value)
			          @ PROW() + 00,14 SAY chr(15) + i_valor
			          @ PROW() + 00,25 SAY chr(15) + "="
			          @ PROW() + 00,28 SAY chr(15) + i_apagar
			          @ PROW() + 00,39 SAY chr(15) + " - " + i_vencimento +CHR(13)                 
	                  @ PROW() + 01,03 SAY chr(15) + Alltrim(linha12)+"  "+Thisform.Text90.Value +CHR(13)
			          @ PROW() + 15,03 SAY chr(15) + "  " +CHR(13)

			          SET PRINTER TO


	              * Atualiza Caixa
			      iope   = ThisForm.txtOperadora.Value
				  inu    = ThisForm.txtCaixa.Value
				  it_mov = 21
				  
				  IF i_tipo = "CONFEDERATIVA"
				     it_mov = 3
				  ENDIF

				  IF i_tipo = "ASSISTENCIAL"
				     it_mov = 13
				  ENDIF

				  IF i_tipo = "MENSALIDADE"
				     it_mov = 1
				  ENDIF
				     
				  
				  ihora  = Time()
				  ic_ti  = i_numero
				  inome  = ThisForm.Text90.Value
				  iVcto  = i_mes
				  iQtd   = 1
				  it_m   = ALLTRIM(ThisForm.agile_tipo.Value)
				  iv_uni = i_valor && VAL(TRANSFORM(ThisForm.txtUnit.Value, "9,999,999.99"))
				  iv_tot = VAL(i_apagar) && VAL(TRANSFORM(ThisForm.txtTotal.Value, "9,999,999.99"))
				  idat   = dtoc(date())

	              SQLexec(privConexao,'SELECT *  FROM caixa WHERE OPERADORA = ?iope  AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat',"caixa")

		           
	              IF EMPTY(operadora) 
			         *************************************
			         *   Rotina para inclusão do Caixa   *
			         *************************************

					 cst=[insert into caixa(operadora,numero,tipo_mov,hora,cod_ti,nome,Vecto,Qtd,t_moeda,vlr_uni,vlr_tot,data) values (?iope,?inu,?it_mov,?ihora,?ic_ti,?inome,?iVcto,?iQtd,?it_m,?iv_uni,?iv_tot,?idat)] 
					 = sqlsetprop(privConexao,'DispWarnings',.t.) 
					 = SQLPREPARE(privConexao,cst,'rscaixa') 
					 = SQLEXEC(privConexao) 

			      ELSE
			          iQtdx   = QTD + iQtd         && Soma Quantidade
			          iv_totx = vlr_tot + iv_tot   && Soma Valor Total
					  cst=[update caixa set data=?idat, Vecto=?iVcto, hora=?ihora, cod_ti=?ic_ti, nome=?inome, Qtd=?iQtdx, vlr_uni=?iv_uni, vlr_tot=?iv_totx WHERE OPERADORA = ?iope AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat]
					  = sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
					  = SQLPREPARE(privConexao,cst,'rscaixa') 
					  = SQLEXEC(privConexao) 

			      Endif


				   ************* Imprime Cupom na Tela   
				   linha1 = 21
				   linha2 = ThisForm.txtMensagem.Value
				   linha3 = Time()
				   linha4 = dtoc(Date())
				   linha5 = mcodigo
				   linha6 = 1
			       linha7 = ALLTRIM(Thisform.agile_tipo.Value)
				   linha8 = i_valor
				   linha9 = VAL(i_apagar)
			       linha7 = ALLTRIM(Thisform.agile_tipo.Value)


	              
				  Store ThisForm.Text10.Value to ThisForm.Text1.Value
			      Store ThisForm.Text19.Value to ThisForm.Text10.Value
			      Store ThisForm.Text28.Value to ThisForm.Text19.Value
			      Store ThisForm.Text37.Value to ThisForm.Text28.Value
			      Store ThisForm.Text46.Value to ThisForm.Text37.Value
			      Store ThisForm.Text55.Value to ThisForm.Text46.Value
	      
			      Store ThisForm.Text17.Value to ThisForm.Text2.Value
			      Store ThisForm.Text26.Value to ThisForm.Text17.Value
			      Store ThisForm.Text35.Value to ThisForm.Text26.Value
			      Store ThisForm.Text44.Value to ThisForm.Text35.Value
			      Store ThisForm.Text53.Value to ThisForm.Text44.Value
			      Store ThisForm.Text62.Value to ThisForm.Text53.Value
	      
			      Store ThisForm.Text11.Value to ThisForm.Text3.Value
			      Store ThisForm.Text20.Value to ThisForm.Text11.Value
			      Store ThisForm.Text29.Value to ThisForm.Text20.Value
			      Store ThisForm.Text38.Value to ThisForm.Text29.Value
			      Store ThisForm.Text47.Value to ThisForm.Text38.Value
			      Store ThisForm.Text56.Value to ThisForm.Text47.Value
	      
			      Store ThisForm.Text12.Value to ThisForm.Text4.Value
			      Store ThisForm.Text21.Value to ThisForm.Text12.Value
			      Store ThisForm.Text30.Value to ThisForm.Text21.Value
			      Store ThisForm.Text39.Value to ThisForm.Text30.Value
			      Store ThisForm.Text48.Value to ThisForm.Text39.Value
			      Store ThisForm.Text57.Value to ThisForm.Text48.Value
	      
			      Store ThisForm.Text18.Value to ThisForm.Text5.Value
			      Store ThisForm.Text27.Value to ThisForm.Text18.Value
			      Store ThisForm.Text36.Value to ThisForm.Text27.Value
			      Store ThisForm.Text45.Value to ThisForm.Text36.Value
			      Store ThisForm.Text54.Value to ThisForm.Text45.Value
			      Store ThisForm.Text63.Value to ThisForm.Text54.Value
	      
			      Store ThisForm.Text13.Value to ThisForm.Text6.Value
			      Store ThisForm.Text22.Value to ThisForm.Text13.Value
			      Store ThisForm.Text31.Value to ThisForm.Text22.Value
			      Store ThisForm.Text40.Value to ThisForm.Text31.Value
			      Store ThisForm.Text49.Value to ThisForm.Text40.Value
			      Store ThisForm.Text58.Value to ThisForm.Text49.Value
	      
			      Store ThisForm.Text14.Value to ThisForm.Text7.Value
			      Store ThisForm.Text23.Value to ThisForm.Text14.Value
			      Store ThisForm.Text32.Value to ThisForm.Text23.Value
			      Store ThisForm.Text41.Value to ThisForm.Text32.Value
			      Store ThisForm.Text50.Value to ThisForm.Text41.Value
			      Store ThisForm.Text59.Value to ThisForm.Text50.Value
	      
			      Store ThisForm.Text15.Value to ThisForm.Text8.Value
			      Store ThisForm.Text24.Value to ThisForm.Text15.Value
			      Store ThisForm.Text33.Value to ThisForm.Text24.Value
			      Store ThisForm.Text42.Value to ThisForm.Text33.Value
			      Store ThisForm.Text51.Value to ThisForm.Text42.Value
			      Store ThisForm.Text60.Value to ThisForm.Text51.Value
	      
			      Store ThisForm.Text16.Value to ThisForm.Text9.Value
			      Store ThisForm.Text25.Value to ThisForm.Text16.Value
			      Store ThisForm.Text34.Value to ThisForm.Text25.Value
			      Store ThisForm.Text43.Value to ThisForm.Text34.Value
			      Store ThisForm.Text52.Value to ThisForm.Text43.Value
			      Store ThisForm.Text61.Value to ThisForm.Text52.Value


			      ThisForm.Text55.Value = linha1
			      ThisForm.Text62.Value = linha2 
			      ThisForm.Text56.Value = linha3
			      ThisForm.Text57.Value = linha4
			      ThisForm.Text63.Value = linha5
			      ThisForm.Text58.Value = linha6
			      ThisForm.Text59.Value = linha7
			      ThisForm.Text60.Value = linha8
			      ThisForm.Text61.Value = VAL(i_apagar)
			      
	   		      ThisForm.txtCampo16.value  = " "
			      ThisForm.txtCampo20.value  = " "
			      Thisform.Text90.Value       = " "
			      ThisForm.txtCampo21.Visible = .F.
			      ThisForm.txtCampo25.value  = "OBRIGADO !!!"
			      
			      ThisForm.txtRec.Value = 0
		      		      
                 
	ELSE
		 
		 cText = "Transação NÃO efetuada.  "+ CHR(13) + "Não e Possível efetuar a Baixa" + CHR(13) + "Contribuição ja esta paga!!" + CHR(13) + " 2 - Baixar a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF

ENDIF

IF Thisform.opera_1.Value = "Cancelar a baixa da contribuição" 


	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* 3 - Serviço para cancelar a baixa da contribuição: 
	i_instrucao3 = "http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+;
	i_tipo+"&servico="+i_servico+"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont 


	Local lc_url_procura3, srvXMLHttp, xmlResult, resultado

	lc_url_procura3 = i_instrucao3


	srvXMLHttp = Createobject("MSXML2.ServerXMLHTTP.3.0")
	srvXMLHttp.Open("GET",lc_url_procura3,.F.)
	srvXMLHttp.Send()
	*!*MESSAGEBOX(srvXMLHttp.responseText)

	Store " " To resultado, i_significado

	*Cria objeto e Adquiri resultado da busca em formato XML
	xmlResult = Createobject("MSXML2.DomDocument")
	xmlResult.LoadXML(srvXMLHttp.ResponseText)

	* Recupera valores do resultado da busca

	resultado = xmlResult.SelectNodes("//SIGNIFICADO" ).Item(0).Text
	mensa  = xmlResult.SelectNodes("//MENSAGEM" ).Item(0).Text

	* Caso ocorra alguma irregularidade os nós abaixo não vão existir
	* portanto para evitar erros pegaremos os valore apenas se o resultado for positivo

	If resultado = 'OK'

		* Variavel com o resultado da entrega *

               * Atalizar Banco  
               SQLexec(privConexao,'Select * from resumo3 ORDER BY cod DESC LIMIT 0,1',"resumo3")
 
		       GO BOTTOM
		       STORE (COD + 1) TO mCODIGO
		       *
		       *   Rotina para inclusão
		       *
			   i_sy_data = Dtoc(Date())
			   i_sy_time = Time()


			   i_txqtd   = 1
			   i_txUnit  = 0
			   i_txTotal = Thisform.valor_1.value
			   i_txChec  = ALLTRIM(Thisform.agile_tipo.Value)
			   i_txRec2   = 21
			   i_txmensa = Thisform.servi_1.Value 
			   i_txRec   = Thisform.servi_1.Value 
			   rr_cod    = Thisform.cod_gui_1.Value
			   oper_caixa = Thisform.txtOperadora.Value  
			   it_m      = ALLTRIM(Thisform.agile_tipo.Value)
               idat      = i_sy_data

               txtCaixa    = 1   
               
               	  it_mov = 3
				  
				  IF i_tipo2 = "CONFEDERATIVA"
				     it_mov = '3'
				  ENDIF

				  IF i_tipo2 = "ASSISTENCIAL"
				     it_mov = '13'
				  ENDIF

				  IF i_tipo2 = "MENSALIDADE"
				     it_mov = '1'
				  ENDIF



               WAIT WINDOW 'Lançamento Efetuada  '+ it_mov
               
                             
   			   cst=[insert into resumo3(COD,DAT1,HORA,T_MOED,T_MOV,DESC_1,Q_MES,VL_UNI,VL_TOT,COD_TI,NU_TI,OBS) values (?mCODIGO,?i_sy_data,?i_sy_time,?i_txChec,?i_txRec2,?i_txmensa,?i_txqtd,?i_txUnit,?i_txTotal,?rr_cod,?rr_nu,?oper_caixa)] 
			   = sqlsetprop(privConexao,'DispWarnings',.t.) 
			   = SQLPREPARE(privConexao,cst,'rsresumo3') 
			   = SQLEXEC(privConexao) 


			   ********************************
			   *   Rotina para Cancelamento   *
			   ********************************

               Nqtd     = 1
               Nvlr_tot = Thisform.valor_1.value 

			   cst=[update caixa set QTD=QTD-1, VLR_TOT=VLR_TOT-?i_txTotal WHERE  OPERADORA = ?oper_caixa  AND NUMERO = ?txtCaixa AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat]
			   = sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
			   = SQLPREPARE(privConexao,cst,'rscaixa') 
			   = SQLEXEC(privConexao) 

		   
		 cText = "Transação efetuada com sucesso  "+   CHR(13) + ALLTRIM(resultado) + "."  + CHR(13) + " 3 - Cancelar a Baixa da Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)



	               ThisForm.txtMov.Value = ThisForm.txtMov.Value - VAL(i_txTotal)
	               
	               ThisForm.txtSoma.Value = ThisForm.txtSoma.Value - VAL(i_txTotal)


			SET DEVICE TO PRINTER

	*		??? chr(15)+chr(14)
	*		??? chr(18)+chr(15)
	        ??? CHR(15)+CHR(13) 


	 
		*    @ PROW() + 01,01 say chr(15) + "Teste para Imprimir em " +CHR(13)

			      		     &&   1234567890123456789012345678901234567890    
					         &&            10        20        30        40 
					         
		    @ PROW() + 01,03 SAY chr(15) + "======================================================" +CHR(14)
		    @ PROW() + 01,03 SAY chr(14) + "  CANCELAMENTO" +CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "======================================================" +CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "Data "+DTOC(Date())+" Hora "+time()+" Caixa "+ThisForm.txtOperadora.Value +CHR(13) 
			@ PROW() + 01,03 SAY chr(15) + "------------------------------------------------------" +CHR(13)
			
			
			@ PROW() + 01,03 SAY chr(15) + "COMPROVANTE DE CANCELAMENTO"+" "+STR(mCODIGO)+CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "SIND"
			@ PROW() + 00,03 SAY chr(15) + "    ["
			@ PROW() + 00,03 SAY chr(15) + "    !"
			@ PROW() + 00,03 SAY chr(15) + "    ]    "+"Valor Cancelado ..."+CHR(13)
			@ PROW() + 00,34 SAY i_txTotal  +CHR(13)
			@ PROW() + 15,03 SAY chr(15) + "  " +CHR(13)

			SET PRINTER TO


				   ************* Imprime Cupom na Tela   
				   linha1 = 21
				   linha2 = "CANCELAMENTO"
				   linha3 = Time()
				   linha4 = dtoc(Date())
				   linha5 = mcodigo
				   linha6 = 1
			       linha7 = " "
				   linha8 = i_txTotal
				   linha9 = " "
			       linha7 = " "


	              
				  Store ThisForm.Text10.Value to ThisForm.Text1.Value
			      Store ThisForm.Text19.Value to ThisForm.Text10.Value
			      Store ThisForm.Text28.Value to ThisForm.Text19.Value
			      Store ThisForm.Text37.Value to ThisForm.Text28.Value
			      Store ThisForm.Text46.Value to ThisForm.Text37.Value
			      Store ThisForm.Text55.Value to ThisForm.Text46.Value
	      
			      Store ThisForm.Text17.Value to ThisForm.Text2.Value
			      Store ThisForm.Text26.Value to ThisForm.Text17.Value
			      Store ThisForm.Text35.Value to ThisForm.Text26.Value
			      Store ThisForm.Text44.Value to ThisForm.Text35.Value
			      Store ThisForm.Text53.Value to ThisForm.Text44.Value
			      Store ThisForm.Text62.Value to ThisForm.Text53.Value
	      
			      Store ThisForm.Text11.Value to ThisForm.Text3.Value
			      Store ThisForm.Text20.Value to ThisForm.Text11.Value
			      Store ThisForm.Text29.Value to ThisForm.Text20.Value
			      Store ThisForm.Text38.Value to ThisForm.Text29.Value
			      Store ThisForm.Text47.Value to ThisForm.Text38.Value
			      Store ThisForm.Text56.Value to ThisForm.Text47.Value
	      
			      Store ThisForm.Text12.Value to ThisForm.Text4.Value
			      Store ThisForm.Text21.Value to ThisForm.Text12.Value
			      Store ThisForm.Text30.Value to ThisForm.Text21.Value
			      Store ThisForm.Text39.Value to ThisForm.Text30.Value
			      Store ThisForm.Text48.Value to ThisForm.Text39.Value
			      Store ThisForm.Text57.Value to ThisForm.Text48.Value
	      
			      Store ThisForm.Text18.Value to ThisForm.Text5.Value
			      Store ThisForm.Text27.Value to ThisForm.Text18.Value
			      Store ThisForm.Text36.Value to ThisForm.Text27.Value
			      Store ThisForm.Text45.Value to ThisForm.Text36.Value
			      Store ThisForm.Text54.Value to ThisForm.Text45.Value
			      Store ThisForm.Text63.Value to ThisForm.Text54.Value
	      
			      Store ThisForm.Text13.Value to ThisForm.Text6.Value
			      Store ThisForm.Text22.Value to ThisForm.Text13.Value
			      Store ThisForm.Text31.Value to ThisForm.Text22.Value
			      Store ThisForm.Text40.Value to ThisForm.Text31.Value
			      Store ThisForm.Text49.Value to ThisForm.Text40.Value
			      Store ThisForm.Text58.Value to ThisForm.Text49.Value
	      
			      Store ThisForm.Text14.Value to ThisForm.Text7.Value
			      Store ThisForm.Text23.Value to ThisForm.Text14.Value
			      Store ThisForm.Text32.Value to ThisForm.Text23.Value
			      Store ThisForm.Text41.Value to ThisForm.Text32.Value
			      Store ThisForm.Text50.Value to ThisForm.Text41.Value
			      Store ThisForm.Text59.Value to ThisForm.Text50.Value
	      
			      Store ThisForm.Text15.Value to ThisForm.Text8.Value
			      Store ThisForm.Text24.Value to ThisForm.Text15.Value
			      Store ThisForm.Text33.Value to ThisForm.Text24.Value
			      Store ThisForm.Text42.Value to ThisForm.Text33.Value
			      Store ThisForm.Text51.Value to ThisForm.Text42.Value
			      Store ThisForm.Text60.Value to ThisForm.Text51.Value
	      
			      Store ThisForm.Text16.Value to ThisForm.Text9.Value
			      Store ThisForm.Text25.Value to ThisForm.Text16.Value
			      Store ThisForm.Text34.Value to ThisForm.Text25.Value
			      Store ThisForm.Text43.Value to ThisForm.Text34.Value
			      Store ThisForm.Text52.Value to ThisForm.Text43.Value
			      Store ThisForm.Text61.Value to ThisForm.Text52.Value


			      ThisForm.Text55.Value = linha1
			      ThisForm.Text62.Value = linha2 
			      ThisForm.Text56.Value = linha3
			      ThisForm.Text57.Value = linha4
			      ThisForm.Text63.Value = linha5
			      ThisForm.Text58.Value = linha6
			      ThisForm.Text59.Value = linha7
			      ThisForm.Text60.Value = linha8
			      ThisForm.Text61.Value = " "
			      
	   		      ThisForm.txtCampo16.value  = " "
			      ThisForm.txtCampo20.value  = " "
			      Thisform.Text90.Value       = " "
			      ThisForm.txtCampo21.Visible = .F.
			      ThisForm.txtCampo25.value  = "OBRIGADO !!!"



	ELSE
		 
		 cText = "Transação NÃO efetuada.  "+  CHR(13) +  "Não é possível a baixa" + CHR(13) + "Contribuição não está Paga !!"+  CHR(13) + " 3 - Cancelar a Baixa da Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF


ENDIF
=======
IF Thisform.opera_1.Value = "Calcular a contribuição" 

	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
*	i_empr       	= "9000 - GIORGIA" 
*	i_situ         	= "EM ABERTO" 
	i_val_base  	= Thisform.vlbase_1.Value 
	i_func_dec  	= Thisform.nfunc_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* Instrução para monta a URL *

	* 1 - Serviço para calcular a contribuição 

	i_instrucao = "http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+i_tipo+"&servico="+i_servico+;
	"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont+"&base="+i_val_base+"&funcionarios="+i_func_dec 


	* Cria o Objeto para consulta e retormo em xml *
	objsrvxml = CREATEOBJECT("MSXML2.ServerXMLHTTP.3.0")
	objsrvxml.OPEN("GET",i_instrucao,.F.)
	objsrvxml.SEND()

	* Pega retorno do objeto Objsrvxml
	objresulxml  = CREATEOBJECT("MSXML2.DomDocument")
	objresulxml.LOADXML(objsrvxml.responsetext)

	* Variavel com o resultado da entrega *
	i_significado = objresulxml.selectnodes("//SIGNIFICADO").ITEM(0).TEXT


	IF i_significado = "OK"
	
	   i_fez_1 = 'sim'

		* Variavel com o resultado da entrega *
		i_significado   = objresulxml.selectnodes("//SIGNIFICADO").ITEM(0).TEXT
		* i_mensa_xml_01  = objresulxml.selectnodes("//MENSAGEM").ITEM(0).TEXT
		i_numero 		= objresulxml.selectnodes("//NUMERO").ITEM(0).TEXT
		i_cnpj 			= objresulxml.selectnodes("//CNPJ").ITEM(0).TEXT
		i_nome 			= objresulxml.selectnodes("//NOME").ITEM(0).TEXT
		i_tipo 			= objresulxml.selectnodes("//TIPO").ITEM(0).TEXT
		i_mes 			= objresulxml.selectnodes("//MES").ITEM(0).TEXT
		i_vencimento 	= objresulxml.selectnodes("//VENCIMENTO").ITEM(0).TEXT
		i_valor 		= objresulxml.selectnodes("//VALOR").ITEM(0).TEXT
		i_taxa 			= objresulxml.selectnodes("//TAXA").ITEM(0).TEXT
		i_correcao 		= objresulxml.selectnodes("//CORRECAO").ITEM(0).TEXT
		i_multa 		= objresulxml.selectnodes("//MULTA").ITEM(0).TEXT
		i_juro 			= objresulxml.selectnodes("//JURO").ITEM(0).TEXT
		i_apagar		= objresulxml.selectnodes("//APAGAR").ITEM(0).TEXT

        Thisform.valor_1.Value = i_apagar
        Thisform.Text90.Value = i_nome
        
		    
		 cText = "Transação efetuada com sucesso  "+ ALLTRIM(i_significado) + "." + CHR(13) + " 1 - Calcular a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
		 
		* ? i_numero
		*? i_cnpj
		*? (Upper(CHRTRAN(i_nome, "ÁÉÍÓÚáéíóúÀÈÌÒÙàèìòùÂÊÎÔÛâêîôûÄËÏÖÜäëïöüÃÕãõÇçÑñº", "AEIOUaeiouAEIOUaeiouAEIOUaeiouAEIOUaeiouAOaoCcNno")))    
		*? i_tipo
		*? i_mes
		*? i_vencimento
		*? i_valor
		*? i_taxa
		*? i_correcao
	    *? i_multa
		*? i_juro
		*? i_apagar
        
	ELSE
		 
		 cText = "Transação NÃO efetuada.  " + CHR(13) + " 1 - Calcular a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF


IF i_fez_1 = 'sim'

   * OK
   
ELSE

	cText = "URL NÃO encontrada.  " + CHR(13) + " 1 - Calcular a Contribuição"
	cTitu  = "Caixa" 
	=messageBox(cText, cTitu)


ENDIF


ENDIF

IF Thisform.opera_1.Value = "Baixar a contribuição" 


	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
	i_valor1    	= Thisform.valor_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* 2 - Serviço para baixar a contribuição 

	i_instrucao2 = ALLTRIM("http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+;
	i_tipo +"&servico="+i_servico+"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont+"&valor="+i_valor1) 


	Local lc_url_procura2, srvXMLHttp, xmlResult, resultado

	lc_url_procura2 = i_instrucao2


	srvXMLHttp = Createobject("MSXML2.ServerXMLHTTP.3.0")
	srvXMLHttp.Open("GET",lc_url_procura2,.F.)
	srvXMLHttp.Send()
	*!*MESSAGEBOX(srvXMLHttp.responseText)

	Store " " To resultado, i_significado

	*Cria objeto e Adquiri resultado da busca em formato XML
	xmlResult = Createobject("MSXML2.DomDocument")
	xmlResult.LoadXML(srvXMLHttp.ResponseText)

	* Recupera valores do resultado da busca

	resultado = xmlResult.SelectNodes("//SIGNIFICADO" ).Item(0).Text
	mensa  = xmlResult.SelectNodes("//MENSAGEM" ).Item(0).Text

	* Caso ocorra alguma irregularidade os nós abaixo não vão existir
	* portanto para evitar erros pegaremos os valore apenas se o resultado for positivo

	If resultado = 'OK'

	    i_significado   = xmlResult.selectnodes("//SIGNIFICADO").ITEM(0).TEXT
		i_numero 		= xmlResult.selectnodes("//NUMERO").ITEM(0).TEXT
		i_cnpj 			= xmlResult.selectnodes("//CNPJ").ITEM(0).TEXT
		i_nome 			= xmlResult.selectnodes("//NOME").ITEM(0).TEXT
		i_tipo 			= xmlResult.selectnodes("//TIPO").ITEM(0).TEXT
		i_mes 			= xmlResult.selectnodes("//MES").ITEM(0).TEXT
		i_vencimento	= xmlResult.selectnodes("//VENCIMENTO").ITEM(0).TEXT
		i_valor 		= xmlResult.selectnodes("//VALOR").ITEM(0).TEXT
		i_taxa 			= xmlResult.selectnodes("//TAXA").ITEM(0).TEXT
		i_correcao 		= xmlResult.selectnodes("//CORRECAO").ITEM(0).TEXT
		i_multa 		= xmlResult.selectnodes("//MULTA").ITEM(0).TEXT
		i_juro 			= xmlResult.selectnodes("//JURO").ITEM(0).TEXT
		i_apagar 		= xmlResult.selectnodes("//APAGAR").ITEM(0).TEXT
		i_pago 			= xmlResult.selectnodes("//PAGO").ITEM(0).TEXT
		i_saldo 		= xmlResult.selectnodes("//SALDO").ITEM(0).TEXT
		i_lote 			= xmlResult.selectnodes("//LOTE").ITEM(0).TEXT


		* Variavel com o resultado da entrega *

        Thisform.Text90.Value = i_nome
        
			 cText = "Transação efetuada com sucesso  " + i_significado + CHR(13) + " 2 - Baixar a Contribuição"
			 cTitu  = "Caixa" 
			 =messageBox(cText, cTitu)

			       *** Processo de Armazenar
				   linha1 = ThisForm.txtRec.Value
			       linha2 = ThisForm.txtMensagem.Value
			       linha3 = Time()
			       linha4 = dtoc(Date())
			       linha6 = ThisForm.txtQtd.Value
			       linha7 = ThisForm.txtChec.Value
			       linha8 = "    ]1x"+ALLTRIM(agile_tipo)+"  "+i_valor+"="+STR(i_apagar)+ " - "+i_mes
			       linha9 = i_apagar && VAL(TRANSFORM(ThisForm.txtTotal.Value, "9,999,999.99"))
			       linha10 = i_mes
			       linha11 = i_valor
			       linha12 = i_cnpj

	               * Atalizar Banco  
	               SQLexec(privConexao,'Select * from resumo3 ORDER BY cod DESC LIMIT 0,1',"resumo3")
	 
			       GO BOTTOM
			       STORE (COD + 1) TO mCODIGO
			       *
			       *   Rotina para inclusão
			       *
				   i_sy_data = Dtoc(Date())
				   i_sy_time = Time()

				   i_txqtd   = 1
				   i_txUnit  = i_valor
				   i_txTotal = i_apagar
				   i_txChec  = ALLTRIM(Thisform.agile_tipo.Value)
				   i_txRec2   = 21
				   i_txmensa = i_servico
				   i_txRec   = i_servico
				   rr_cod    = i_numero
				   oper_caixa = Thisform.txtOperadora.Value 
				    
	               ThisForm.txtMov.Value = ThisForm.txtMov.Value + VAL(i_txTotal)
	               
	               ThisForm.txtSoma.Value = ThisForm.txtSoma.Value + VAL(i_txTotal)
	  
	   			   cst=[insert into resumo3(COD,DAT1,HORA,T_MOED,T_MOV,DESC_1,Q_MES,VL_UNI,VL_TOT,COD_TI,NU_TI,OBS) values (?mCODIGO,?i_sy_data,?i_sy_time,?i_txChec,?i_txRec2,?i_txmensa,?i_txqtd,?i_txUnit,?i_txTotal,?rr_cod,?rr_nu,?oper_caixa)] 
				   = sqlsetprop(privConexao,'DispWarnings',.t.) 
				   = SQLPREPARE(privConexao,cst,'rsresumo3') 
				   = SQLEXEC(privConexao) 

	   
			       ****** Imprime Recibo

			       SET DEVICE TO PRINTER
	*		       ??? chr(15)+chr(14)
	*		       ??? chr(18)+chr(15)
	               ??? CHR(15)+CHR(13) 

	 	                                        &&   1234567890123456789012345678901234567890    
			                                    &&            10        20        30        40 
			          @ PROW() + 01,03 SAY chr(15) + " SINDICATO DOS EMPREG. DE EDIFICIOS E COND. SP   " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " ZEL.PORT.CAB.FAX.VIG.SERV E OUTROS              " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " R. SETE DE ABRIL, 34 -S.PAULO-SP TEL.11-31233211" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + " CNPJ: 43.070.481/0001-14 I.ISENTO               " +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "= ============================================= =" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "Data "+DTOC(Date())+" Hora "+time()+" Caixa "+ThisForm.txtOperadora.Value +CHR(13) 
			          @ PROW() + 01,03 SAY chr(15) + "- --------------------------------------------- -" +CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + "COMPROVANTE DE RECEBIMENTO"+" "+STR(mCODIGO)+CHR(13)
			          @ PROW() + 01,03 SAY chr(15) + SUBSTR(i_tipo,1,90)+" "+i_numero+CHR(13)                 
			          @ PROW() + 01,03 SAY chr(15) + "SIND"
			          @ PROW() + 00,03 SAY chr(15) + "    ["
			          @ PROW() + 00,03 SAY chr(15) + "    !"
			          @ PROW() + 00,03 SAY chr(15) + "    ]1x"+ALLTRIM(Thisform.agile_tipo.Value)
			          @ PROW() + 00,14 SAY chr(15) + i_valor
			          @ PROW() + 00,25 SAY chr(15) + "="
			          @ PROW() + 00,28 SAY chr(15) + i_apagar
			          @ PROW() + 00,39 SAY chr(15) + " - " + i_vencimento +CHR(13)                 
	                  @ PROW() + 01,03 SAY chr(15) + Alltrim(linha12)+"  "+Thisform.Text90.Value +CHR(13)
			          @ PROW() + 15,03 SAY chr(15) + "  " +CHR(13)

			          SET PRINTER TO


	              * Atualiza Caixa
			      iope   = ThisForm.txtOperadora.Value
				  inu    = ThisForm.txtCaixa.Value
				  it_mov = 21
				  
				  IF i_tipo = "CONFEDERATIVA"
				     it_mov = 3
				  ENDIF

				  IF i_tipo = "ASSISTENCIAL"
				     it_mov = 13
				  ENDIF

				  IF i_tipo = "MENSALIDADE"
				     it_mov = 1
				  ENDIF
				     
				  
				  ihora  = Time()
				  ic_ti  = i_numero
				  inome  = ThisForm.Text90.Value
				  iVcto  = i_mes
				  iQtd   = 1
				  it_m   = ALLTRIM(ThisForm.agile_tipo.Value)
				  iv_uni = i_valor && VAL(TRANSFORM(ThisForm.txtUnit.Value, "9,999,999.99"))
				  iv_tot = VAL(i_apagar) && VAL(TRANSFORM(ThisForm.txtTotal.Value, "9,999,999.99"))
				  idat   = dtoc(date())

	              SQLexec(privConexao,'SELECT *  FROM caixa WHERE OPERADORA = ?iope  AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat',"caixa")

		           
	              IF EMPTY(operadora) 
			         *************************************
			         *   Rotina para inclusão do Caixa   *
			         *************************************

					 cst=[insert into caixa(operadora,numero,tipo_mov,hora,cod_ti,nome,Vecto,Qtd,t_moeda,vlr_uni,vlr_tot,data) values (?iope,?inu,?it_mov,?ihora,?ic_ti,?inome,?iVcto,?iQtd,?it_m,?iv_uni,?iv_tot,?idat)] 
					 = sqlsetprop(privConexao,'DispWarnings',.t.) 
					 = SQLPREPARE(privConexao,cst,'rscaixa') 
					 = SQLEXEC(privConexao) 

			      ELSE
			          iQtdx   = QTD + iQtd         && Soma Quantidade
			          iv_totx = vlr_tot + iv_tot   && Soma Valor Total
					  cst=[update caixa set data=?idat, Vecto=?iVcto, hora=?ihora, cod_ti=?ic_ti, nome=?inome, Qtd=?iQtdx, vlr_uni=?iv_uni, vlr_tot=?iv_totx WHERE OPERADORA = ?iope AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat]
					  = sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
					  = SQLPREPARE(privConexao,cst,'rscaixa') 
					  = SQLEXEC(privConexao) 

			      Endif


				   ************* Imprime Cupom na Tela   
				   linha1 = 21
				   linha2 = ThisForm.txtMensagem.Value
				   linha3 = Time()
				   linha4 = dtoc(Date())
				   linha5 = mcodigo
				   linha6 = 1
			       linha7 = ALLTRIM(Thisform.agile_tipo.Value)
				   linha8 = i_valor
				   linha9 = VAL(i_apagar)
			       linha7 = ALLTRIM(Thisform.agile_tipo.Value)


	              
				  Store ThisForm.Text10.Value to ThisForm.Text1.Value
			      Store ThisForm.Text19.Value to ThisForm.Text10.Value
			      Store ThisForm.Text28.Value to ThisForm.Text19.Value
			      Store ThisForm.Text37.Value to ThisForm.Text28.Value
			      Store ThisForm.Text46.Value to ThisForm.Text37.Value
			      Store ThisForm.Text55.Value to ThisForm.Text46.Value
	      
			      Store ThisForm.Text17.Value to ThisForm.Text2.Value
			      Store ThisForm.Text26.Value to ThisForm.Text17.Value
			      Store ThisForm.Text35.Value to ThisForm.Text26.Value
			      Store ThisForm.Text44.Value to ThisForm.Text35.Value
			      Store ThisForm.Text53.Value to ThisForm.Text44.Value
			      Store ThisForm.Text62.Value to ThisForm.Text53.Value
	      
			      Store ThisForm.Text11.Value to ThisForm.Text3.Value
			      Store ThisForm.Text20.Value to ThisForm.Text11.Value
			      Store ThisForm.Text29.Value to ThisForm.Text20.Value
			      Store ThisForm.Text38.Value to ThisForm.Text29.Value
			      Store ThisForm.Text47.Value to ThisForm.Text38.Value
			      Store ThisForm.Text56.Value to ThisForm.Text47.Value
	      
			      Store ThisForm.Text12.Value to ThisForm.Text4.Value
			      Store ThisForm.Text21.Value to ThisForm.Text12.Value
			      Store ThisForm.Text30.Value to ThisForm.Text21.Value
			      Store ThisForm.Text39.Value to ThisForm.Text30.Value
			      Store ThisForm.Text48.Value to ThisForm.Text39.Value
			      Store ThisForm.Text57.Value to ThisForm.Text48.Value
	      
			      Store ThisForm.Text18.Value to ThisForm.Text5.Value
			      Store ThisForm.Text27.Value to ThisForm.Text18.Value
			      Store ThisForm.Text36.Value to ThisForm.Text27.Value
			      Store ThisForm.Text45.Value to ThisForm.Text36.Value
			      Store ThisForm.Text54.Value to ThisForm.Text45.Value
			      Store ThisForm.Text63.Value to ThisForm.Text54.Value
	      
			      Store ThisForm.Text13.Value to ThisForm.Text6.Value
			      Store ThisForm.Text22.Value to ThisForm.Text13.Value
			      Store ThisForm.Text31.Value to ThisForm.Text22.Value
			      Store ThisForm.Text40.Value to ThisForm.Text31.Value
			      Store ThisForm.Text49.Value to ThisForm.Text40.Value
			      Store ThisForm.Text58.Value to ThisForm.Text49.Value
	      
			      Store ThisForm.Text14.Value to ThisForm.Text7.Value
			      Store ThisForm.Text23.Value to ThisForm.Text14.Value
			      Store ThisForm.Text32.Value to ThisForm.Text23.Value
			      Store ThisForm.Text41.Value to ThisForm.Text32.Value
			      Store ThisForm.Text50.Value to ThisForm.Text41.Value
			      Store ThisForm.Text59.Value to ThisForm.Text50.Value
	      
			      Store ThisForm.Text15.Value to ThisForm.Text8.Value
			      Store ThisForm.Text24.Value to ThisForm.Text15.Value
			      Store ThisForm.Text33.Value to ThisForm.Text24.Value
			      Store ThisForm.Text42.Value to ThisForm.Text33.Value
			      Store ThisForm.Text51.Value to ThisForm.Text42.Value
			      Store ThisForm.Text60.Value to ThisForm.Text51.Value
	      
			      Store ThisForm.Text16.Value to ThisForm.Text9.Value
			      Store ThisForm.Text25.Value to ThisForm.Text16.Value
			      Store ThisForm.Text34.Value to ThisForm.Text25.Value
			      Store ThisForm.Text43.Value to ThisForm.Text34.Value
			      Store ThisForm.Text52.Value to ThisForm.Text43.Value
			      Store ThisForm.Text61.Value to ThisForm.Text52.Value


			      ThisForm.Text55.Value = linha1
			      ThisForm.Text62.Value = linha2 
			      ThisForm.Text56.Value = linha3
			      ThisForm.Text57.Value = linha4
			      ThisForm.Text63.Value = linha5
			      ThisForm.Text58.Value = linha6
			      ThisForm.Text59.Value = linha7
			      ThisForm.Text60.Value = linha8
			      ThisForm.Text61.Value = VAL(i_apagar)
			      
	   		      ThisForm.txtCampo16.value  = " "
			      ThisForm.txtCampo20.value  = " "
			      Thisform.Text90.Value       = " "
			      ThisForm.txtCampo21.Visible = .F.
			      ThisForm.txtCampo25.value  = "OBRIGADO !!!"
			      
			      ThisForm.txtRec.Value = 0
		      		      
                 
	ELSE
		 
		 cText = "Transação NÃO efetuada.  "+ CHR(13) + "Não e Possível efetuar a Baixa" + CHR(13) + "Contribuição ja esta paga!!" + CHR(13) + " 2 - Baixar a Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF

ENDIF

IF Thisform.opera_1.Value = "Cancelar a baixa da contribuição" 


	* Variáveis para consulta xml no site 

	i_cont        	= Thisform.cod_gui_1.Value 
	i_tipo      	= Thisform.tipo_1.Value
	i_servico     	= Thisform.servi_1.Value 
	i_usuario    	= "TOLLER"
	i_senha      	= "wz342y"


	* 3 - Serviço para cancelar a baixa da contribuição: 
	i_instrucao3 = "http://"+ i_Str_ip_server +":8080/SWAGILEAMPR/servlet/com.swinf.sgs.aswap_sgs_integracao_caixa?modulo="+;
	i_tipo+"&servico="+i_servico+"&usuario="+i_usuario+"&senha="+i_senha+"&numero="+i_cont 


	Local lc_url_procura3, srvXMLHttp, xmlResult, resultado

	lc_url_procura3 = i_instrucao3


	srvXMLHttp = Createobject("MSXML2.ServerXMLHTTP.3.0")
	srvXMLHttp.Open("GET",lc_url_procura3,.F.)
	srvXMLHttp.Send()
	*!*MESSAGEBOX(srvXMLHttp.responseText)

	Store " " To resultado, i_significado

	*Cria objeto e Adquiri resultado da busca em formato XML
	xmlResult = Createobject("MSXML2.DomDocument")
	xmlResult.LoadXML(srvXMLHttp.ResponseText)

	* Recupera valores do resultado da busca

	resultado = xmlResult.SelectNodes("//SIGNIFICADO" ).Item(0).Text
	mensa  = xmlResult.SelectNodes("//MENSAGEM" ).Item(0).Text

	* Caso ocorra alguma irregularidade os nós abaixo não vão existir
	* portanto para evitar erros pegaremos os valore apenas se o resultado for positivo

	If resultado = 'OK'

		* Variavel com o resultado da entrega *

               * Atalizar Banco  
               SQLexec(privConexao,'Select * from resumo3 ORDER BY cod DESC LIMIT 0,1',"resumo3")
 
		       GO BOTTOM
		       STORE (COD + 1) TO mCODIGO
		       *
		       *   Rotina para inclusão
		       *
			   i_sy_data = Dtoc(Date())
			   i_sy_time = Time()


			   i_txqtd   = 1
			   i_txUnit  = 0
			   i_txTotal = Thisform.valor_1.value
			   i_txChec  = ALLTRIM(Thisform.agile_tipo.Value)
			   i_txRec2   = 21
			   i_txmensa = Thisform.servi_1.Value 
			   i_txRec   = Thisform.servi_1.Value 
			   rr_cod    = Thisform.cod_gui_1.Value
			   oper_caixa = Thisform.txtOperadora.Value  
			   it_m      = ALLTRIM(Thisform.agile_tipo.Value)
               idat      = i_sy_data

               txtCaixa    = 1   
               
               	  it_mov = 3
				  
				  IF i_tipo2 = "CONFEDERATIVA"
				     it_mov = '3'
				  ENDIF

				  IF i_tipo2 = "ASSISTENCIAL"
				     it_mov = '13'
				  ENDIF

				  IF i_tipo2 = "MENSALIDADE"
				     it_mov = '1'
				  ENDIF



               WAIT WINDOW 'Lançamento Efetuada  '+ it_mov
               
                             
   			   cst=[insert into resumo3(COD,DAT1,HORA,T_MOED,T_MOV,DESC_1,Q_MES,VL_UNI,VL_TOT,COD_TI,NU_TI,OBS) values (?mCODIGO,?i_sy_data,?i_sy_time,?i_txChec,?i_txRec2,?i_txmensa,?i_txqtd,?i_txUnit,?i_txTotal,?rr_cod,?rr_nu,?oper_caixa)] 
			   = sqlsetprop(privConexao,'DispWarnings',.t.) 
			   = SQLPREPARE(privConexao,cst,'rsresumo3') 
			   = SQLEXEC(privConexao) 


			   ********************************
			   *   Rotina para Cancelamento   *
			   ********************************

               Nqtd     = 1
               Nvlr_tot = Thisform.valor_1.value 

			   cst=[update caixa set QTD=QTD-1, VLR_TOT=VLR_TOT-?i_txTotal WHERE  OPERADORA = ?oper_caixa  AND NUMERO = ?txtCaixa AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat]
			   = sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
			   = SQLPREPARE(privConexao,cst,'rscaixa') 
			   = SQLEXEC(privConexao) 

		   
		 cText = "Transação efetuada com sucesso  "+   CHR(13) + ALLTRIM(resultado) + "."  + CHR(13) + " 3 - Cancelar a Baixa da Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)



	               ThisForm.txtMov.Value = ThisForm.txtMov.Value - VAL(i_txTotal)
	               
	               ThisForm.txtSoma.Value = ThisForm.txtSoma.Value - VAL(i_txTotal)


			SET DEVICE TO PRINTER

	*		??? chr(15)+chr(14)
	*		??? chr(18)+chr(15)
	        ??? CHR(15)+CHR(13) 


	 
		*    @ PROW() + 01,01 say chr(15) + "Teste para Imprimir em " +CHR(13)

			      		     &&   1234567890123456789012345678901234567890    
					         &&            10        20        30        40 
					         
		    @ PROW() + 01,03 SAY chr(15) + "======================================================" +CHR(14)
		    @ PROW() + 01,03 SAY chr(14) + "  CANCELAMENTO" +CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "======================================================" +CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "Data "+DTOC(Date())+" Hora "+time()+" Caixa "+ThisForm.txtOperadora.Value +CHR(13) 
			@ PROW() + 01,03 SAY chr(15) + "------------------------------------------------------" +CHR(13)
			
			
			@ PROW() + 01,03 SAY chr(15) + "COMPROVANTE DE CANCELAMENTO"+" "+STR(mCODIGO)+CHR(13)
			@ PROW() + 01,03 SAY chr(15) + "SIND"
			@ PROW() + 00,03 SAY chr(15) + "    ["
			@ PROW() + 00,03 SAY chr(15) + "    !"
			@ PROW() + 00,03 SAY chr(15) + "    ]    "+"Valor Cancelado ..."+CHR(13)
			@ PROW() + 00,34 SAY i_txTotal  +CHR(13)
			@ PROW() + 15,03 SAY chr(15) + "  " +CHR(13)

			SET PRINTER TO


				   ************* Imprime Cupom na Tela   
				   linha1 = 21
				   linha2 = "CANCELAMENTO"
				   linha3 = Time()
				   linha4 = dtoc(Date())
				   linha5 = mcodigo
				   linha6 = 1
			       linha7 = " "
				   linha8 = i_txTotal
				   linha9 = " "
			       linha7 = " "


	              
				  Store ThisForm.Text10.Value to ThisForm.Text1.Value
			      Store ThisForm.Text19.Value to ThisForm.Text10.Value
			      Store ThisForm.Text28.Value to ThisForm.Text19.Value
			      Store ThisForm.Text37.Value to ThisForm.Text28.Value
			      Store ThisForm.Text46.Value to ThisForm.Text37.Value
			      Store ThisForm.Text55.Value to ThisForm.Text46.Value
	      
			      Store ThisForm.Text17.Value to ThisForm.Text2.Value
			      Store ThisForm.Text26.Value to ThisForm.Text17.Value
			      Store ThisForm.Text35.Value to ThisForm.Text26.Value
			      Store ThisForm.Text44.Value to ThisForm.Text35.Value
			      Store ThisForm.Text53.Value to ThisForm.Text44.Value
			      Store ThisForm.Text62.Value to ThisForm.Text53.Value
	      
			      Store ThisForm.Text11.Value to ThisForm.Text3.Value
			      Store ThisForm.Text20.Value to ThisForm.Text11.Value
			      Store ThisForm.Text29.Value to ThisForm.Text20.Value
			      Store ThisForm.Text38.Value to ThisForm.Text29.Value
			      Store ThisForm.Text47.Value to ThisForm.Text38.Value
			      Store ThisForm.Text56.Value to ThisForm.Text47.Value
	      
			      Store ThisForm.Text12.Value to ThisForm.Text4.Value
			      Store ThisForm.Text21.Value to ThisForm.Text12.Value
			      Store ThisForm.Text30.Value to ThisForm.Text21.Value
			      Store ThisForm.Text39.Value to ThisForm.Text30.Value
			      Store ThisForm.Text48.Value to ThisForm.Text39.Value
			      Store ThisForm.Text57.Value to ThisForm.Text48.Value
	      
			      Store ThisForm.Text18.Value to ThisForm.Text5.Value
			      Store ThisForm.Text27.Value to ThisForm.Text18.Value
			      Store ThisForm.Text36.Value to ThisForm.Text27.Value
			      Store ThisForm.Text45.Value to ThisForm.Text36.Value
			      Store ThisForm.Text54.Value to ThisForm.Text45.Value
			      Store ThisForm.Text63.Value to ThisForm.Text54.Value
	      
			      Store ThisForm.Text13.Value to ThisForm.Text6.Value
			      Store ThisForm.Text22.Value to ThisForm.Text13.Value
			      Store ThisForm.Text31.Value to ThisForm.Text22.Value
			      Store ThisForm.Text40.Value to ThisForm.Text31.Value
			      Store ThisForm.Text49.Value to ThisForm.Text40.Value
			      Store ThisForm.Text58.Value to ThisForm.Text49.Value
	      
			      Store ThisForm.Text14.Value to ThisForm.Text7.Value
			      Store ThisForm.Text23.Value to ThisForm.Text14.Value
			      Store ThisForm.Text32.Value to ThisForm.Text23.Value
			      Store ThisForm.Text41.Value to ThisForm.Text32.Value
			      Store ThisForm.Text50.Value to ThisForm.Text41.Value
			      Store ThisForm.Text59.Value to ThisForm.Text50.Value
	      
			      Store ThisForm.Text15.Value to ThisForm.Text8.Value
			      Store ThisForm.Text24.Value to ThisForm.Text15.Value
			      Store ThisForm.Text33.Value to ThisForm.Text24.Value
			      Store ThisForm.Text42.Value to ThisForm.Text33.Value
			      Store ThisForm.Text51.Value to ThisForm.Text42.Value
			      Store ThisForm.Text60.Value to ThisForm.Text51.Value
	      
			      Store ThisForm.Text16.Value to ThisForm.Text9.Value
			      Store ThisForm.Text25.Value to ThisForm.Text16.Value
			      Store ThisForm.Text34.Value to ThisForm.Text25.Value
			      Store ThisForm.Text43.Value to ThisForm.Text34.Value
			      Store ThisForm.Text52.Value to ThisForm.Text43.Value
			      Store ThisForm.Text61.Value to ThisForm.Text52.Value


			      ThisForm.Text55.Value = linha1
			      ThisForm.Text62.Value = linha2 
			      ThisForm.Text56.Value = linha3
			      ThisForm.Text57.Value = linha4
			      ThisForm.Text63.Value = linha5
			      ThisForm.Text58.Value = linha6
			      ThisForm.Text59.Value = linha7
			      ThisForm.Text60.Value = linha8
			      ThisForm.Text61.Value = " "
			      
	   		      ThisForm.txtCampo16.value  = " "
			      ThisForm.txtCampo20.value  = " "
			      Thisform.Text90.Value       = " "
			      ThisForm.txtCampo21.Visible = .F.
			      ThisForm.txtCampo25.value  = "OBRIGADO !!!"



	ELSE
		 
		 cText = "Transação NÃO efetuada.  "+  CHR(13) +  "Não é possível a baixa" + CHR(13) + "Contribuição não está Paga !!"+  CHR(13) + " 3 - Cancelar a Baixa da Contribuição"
		 cTitu  = "Caixa" 
		 =messageBox(cText, cTitu)
	   
	ENDIF


ENDIF
>>>>>>> 0d3b0aeff06732e22189ca204d2d91585a02ea01
