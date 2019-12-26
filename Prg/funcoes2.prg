***
*  Programador..: Edson de Araujo
*  Programador..: Charles C. Camargo Jr
*  Finalidade...: Rotina de Saida pelo sistema
*  Sistema......: Sindicato dos Empregados de Edificios de São Paulo
*  
*  Inicio Programa.:  15/06/2002
*  Ultima Alteração.: 21/02/2005
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 8.0
*
*  " Deus seja Louvado "
*
***


*  --------------------------------------
*  Esta funcao verifica se o socio esta
*  com o pagamento da mensalidade em dia.
*  --------------------------------------
FUNCTION pg_soc()

pagto = .T.
IF CATEGORIA = "R"
	pagto = .T.
ENDIF
IF CATEGORIA = "F"
	=Messagebox("Socio consta como FALECIDO !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "D"
	=Messagebox("Socio consta como DESLIGADO !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "L"
	=Messagebox("Socio consta como ELIMINADO do Quadro Social !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "V"
	=Messagebox("Socio deve comparecer a DIRETORIA !", cTitulo)
	pagto = .F.
ENDIF

IF CATEGORIA = "O"
	=Messagebox("Socio com Carta de Oposicao !", cTitulo)
	pagto = .F.
ENDIF

IF CATEGORIA = "C" .OR. CATEGORIA = "A"

    store substr(datinsc,7,10) TO ANOSOC
    STORE VAL(ANOSOC)          TO ANOSOC2
    
    *Store (month(datinsc) - month(date())) to qtd_pag
    
    STORE YEAR(Date())  TO Hoje
    
    STORE Hoje - ANOSOC2 TO v_FIM
    
    If v_FIM >= 20
       =Messagebox("Socio consta como REMIDO !", cTitulo)
    Else
 
    STORE DATE()-90     TO PGSOC 

	DO CASE
		CASE MES = 01
			STORE "01/01" TO MDT
		CASE MES = 02
			STORE "01/02" TO MDT
  		CASE MES = 03
			STORE "01/03" TO MDT
		CASE MES = 04
 			STORE "01/04" TO MDT
		CASE MES = 05
			STORE "01/05" TO MDT
		CASE MES = 06
			STORE "01/06" TO MDT
		CASE MES = 07
			STORE "01/07" TO MDT
		CASE MES = 08
 			STORE "01/08" TO MDT
		CASE MES = 09
			STORE "01/09" TO MDT
		CASE MES = 10
			STORE "01/10" TO MDT
		CASE MES = 11
			STORE "01/11" TO MDT
		CASE MES = 12
			STORE "01/12" TO MDT
		OTHERWISE
			STORE "00/00" TO MDT
		ENDCASE
		DO CASE
			CASE ANO = 1999
				STORE "/1999" TO ADT
			CASE ANO = 2000
				STORE "/2000" TO ADT
			CASE ANO = 2001
				STORE "/2001" TO ADT
			CASE ANO = 2002
				STORE "/2002" TO ADT
			CASE ANO = 2003
				STORE "/2003" TO ADT
			CASE ANO = 2004
				STORE "/2004" TO ADT
			CASE ANO = 2005
				STORE "/2005" TO ADT
			CASE ANO = 2006
				STORE "/2006" TO ADT
			CASE ANO = 2007
				STORE "/2007" TO ADT
			CASE ANO = 2008
				STORE "/2008" TO ADT
			CASE ANO = 2009
				STORE "/2009" TO ADT
			CASE ANO = 2010
				STORE "/2010" TO ADT
			OTHERWISE
				STORE "00" TO ADT 
			ENDCASE
			
   STORE MDT + ADT TO DATA
   STORE CTOD(DATA) TO CERTO
   IF PGSOC >= CERTO
      *? pgsoc
      *? certo
      *? MDT
      *? ADT
      *? MONTH(CERTO) - MONTH(PGSOC)
      *? ANOSOC
      *? v_FIM
      *? qtd_pag

	  *=MessageBox("Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !", 16, cMessageTitle1)
      pagto = .F.
      
      qtd_mes()
      
   ENDIF
Endif			
ENDIF

RETURN

ENDFUNC


*****************************
*                           *
*  Calcula quantos meses o  *
*    Socio esta devendo     *
*                           *
*****************************

FUNCTION qtd_mes()

qtd1    = 0
faz     = 0
som_qtd = 0
i_mes1 = mes
i_ano1 = ano

IF ano = 0
   cText = "RECÉM CADASTRADO OU NA CARÊNCIA" + Chr(13) + ;
		   "      VERIFICAR DATA DE INCLUSÃO     "+ Chr(13)

		   =MessageBox(cText, 16+32, cTitulo)
		    	  
		   exit do
		   RETURN
ELSE

DO WHILE i_mes1 <= 12 .and. i_ano1 <= YEAR(DATE())
   i_mes1 = i_mes1 + 1
   qtd1 = qtd1 + 1
   som_qtd = som_qtd + 1
   IF i_mes1 > 12
      i_mes1 = 1
      i_ano1 = i_ano1 + 1
   ENDIF
   IF i_ano1 = YEAR(DATE())
      IF i_mes1 = MONTH(DATE())
      
		STORE (som_qtd * 5.00) TO valor_2
		
		cText = "Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !" + Chr(13) + ;
		        "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrazadas num total de" + Chr(13) + ;
		        "R$"+str(valor_2)+".00 Reais"

		      =MessageBox(cText, 16+32, cTitulo)
		    	  
		      exit do
      
      ENDIF 
   ENDIF
ENDDO
		   
ENDIF 		   

RETURN

ENDFUNC