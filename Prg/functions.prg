***
*  Programador..: Edson de Araujo
*  Programador..: Charles C. Camargo Jr
*  Finalidade...: Rotina de Saida pelo sistema
*  Sistema......: Sindicato dos Empregados de Edificios de S„o Paulo
*  
*  Inicio Programa.:  15/06/2002
*  Ultima AlteraÁ„o.: 21/02/2005
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 8.0
*
*  " Deus seja Louvado "
*
***
cTitulo = "SYSmp"

Func Repo_1()

_Screen.Icon = "sysmp.ico"

DEFINE WINDOW WOUT;
   FROM 1,1 TO 28,75;
   TITLE "Visualiza Impress„o";
   FONT "Courier New", 9 STYLE "B";
   MINIMIZE;
   FLOAT;
   CLOSE;
   ICON FILE "sysmp.ico";
   GROW
EndFun


*  --------------------------------------
*  Esta funcao verifica se o socio esta
*  com o pagamento da mensalidade em dia.
*  --------------------------------------
FUNCTION pg_soc_x()

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


&& pagamento

  STORE ano                    TO ANO_PAG
  STORE substr(datinsc,7,10)   TO ANO_INSC
  STORE ANO - ANO_INSC         TO SITU_1
   
IF SITU_1 >= 20

*	=Messagebox("Socio com CONTRIBUINTE NAO REMIDO !", cTitulo)
	pagto = .F.
    v_FIM = 0
  
ENDIF 


    store substr(datinsc,7,10) TO ANOSOC
    STORE VAL(ANOSOC)          TO ANOSOC2
    
    *Store (month(datinsc) - month(date())) to qtd_pag
    
    STORE YEAR(Date())  TO Hoje
    
    STORE Hoje - ANOSOC2 TO v_FIM
    
    If v_FIM >= 20
*******************************************************************************

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
      
      qtd_mes_x()

    ENDIF    


*******************************************************************************    
    
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
      
      qtd_mes_x()
      
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

FUNCTION qtd_mes_x()

qtd1    = 0
faz     = 0
som_qtd = 0
i_mes1 = mes
i_ano1 = ano

IF ano = 0
   cText = "REC…M CADASTRADO OU NA CAR NCIA" + Chr(13) + ;
		   "      VERIFICAR DATA DE INCLUS√O     "+ Chr(13)

		   =MessageBox(cText, 16+32, cTitulo)
		    	  
		   exit do
		   RETURN
ELSE

DO WHILE i_mes1 <= 12 .and. i_ano1 <= YEAR(DATE()) && antes era 12
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
		
		IF som_qtd >= 6

		cText = "Socio CONSTANDO COMO DESLIGADO !!!!!" + Chr(13) + ;
		        "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrasadas num total de" + Chr(13) + ;
		        "R$"+str(valor_2)+".00 Reais"

		      =MessageBox(cText, 16+32, cTitulo)
		    	  
		      exit do
		
		ELSE 
		
		
		cText = "Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !" + Chr(13) + ;
		        "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrasadas num total de" + Chr(13) + ;
		        "R$"+str(valor_2)+".00 Reais"

		      =MessageBox(cText, 16+32, cTitulo)
		    	  
		      exit do
		ENDIF       
      
      ENDIF 
   ENDIF
ENDDO
		   
ENDIF 		   

RETURN

ENDFUNC

*  -----------------------------------------
*  Esta funcao verifica se o socio esta
*  com o cadastro atualizado para envio de
*  Correspondencia
*  -----------------------------------------

FUNCTION ATUL(cad)          

cad = .F.
IF CAD_SI = "E"
   =MESSAGEBOX("Socio com ENDERECO DESATUALIZADO !!", cTitulo)
   cad = .T.
ENDIF
IF CAD_SI = "G"
   =MESSAGEBOX("Socio com RG DESATUALIZADO !!", cTitulo)
   cad = .T.
ENDIF
IF CAD_SI = "P"
   =MESSAGEBOX("Socio com CEP DESATUALIZADO !!", cTitulo)
   cad = .T.
ENDIF
RETURN(cad)

ENDFUNC

FUNCTION ATUL2(etq)        

cad = .T.
IF CAD_SI = "E"
   cad = .F.
ENDIF
IF CAD_SI = "P"
   cad = .F.
ENDIF

RETURN(cad)

ENDFUNC

Func Repo_1()

_Screen.Icon = "sysmp.ico"

DEFINE WINDOW WOUT;
   FROM 1,1 TO 28,75;
   TITLE "Visualiza Impress„o";
   FONT "Courier New", 9 STYLE "B";
   MINIMIZE;
   FLOAT;
   CLOSE;
   ICON FILE "sysmp.ico";
   GROW
EndFun


PROCEDURE saida
conf=MESSAGEBOX("Confirma saida do Sistema?",4+32,cTitulo)
IF conf=6
   CLOSE DATABASES
   QUIT
ENDIF
ENDPROC

PROCEDURE acesso()
*abri_exclusivo()
*abri_banco()
CLOSE DATABASES 
Open DataBase BancoDados Shared
USE
If File('tt_ser_01.dbf') 
   use tt_ser_01 Shared IN 13
   SELECT 13
   SET ORDER TO LOG_01
   GO top
   SEEK UPPER(ALLTRIM(mUsuario))+UPPER(ALLTRIM(mSenha))
   IF .not. EOF()
      STORE permissao TO permi_1
      STORE permis2   TO ii_permi2
      
      STORE Edi1      TO ii_edi1
      STORE Edi2      TO ii_edi2
      STORE Edi3      TO ii_edi3
      
      STORE Adm1      TO ii_adm1
      STORE Adm2      TO ii_adm2
      STORE Adm3      TO ii_adm3
      
      STORE Soc1      TO ii_soc1
      STORE Soc2      TO ii_soc2
      STORE Soc3      TO ii_soc3
      
      STORE opo1      TO ii_opo1
      STORE opo2      TO ii_opo2
      STORE opo3      TO ii_opo3
      
	  *USE
	  acesso= .t.
	  carrega()
   ELSE
	  acesso =.f.	
	  =MESSAGEBOX("Usu·rio n„o Encontrado ou Senha Invalida!",0+16,cTitulo)
	  CLOSE ALL 
	  QUIT
   ENDIF
ELSE
	acesso =.f.	
	=MESSAGEBOX("Erro Autenticidade do N∫ de Serie !!",cTitulo)
	CLOSE ALL 
	QUIT
Endif

ENDPROC

PROCEDURE carrega
   ON SHUTDOWN do saida
   SET SYSMENU on
   _screen.Visible = .T. 
   _screen.BackColor = 9400918
*   DO MENU1XP.MPR
*   DO FORM formtoolb.scx
   *DO FORM Principal.scx  && Nova tela programa novo !!!!
ENDPROC 

******
*  Funcao senha

PROCEDURE senha_x
*Open DataBase BancoDados Shared
use tt_ser_01 Shared IN 13
SELECT 13
SET ORDER TO LOG_01

STORE UPPER(musuario)  TO log_1
STORE UPPER(msenha)    TO sen_1 
STORE UPPER(acess_pro) TO pro_1
ate   = 0
qua_t = 10
GO top

SEEK alltrim(log_1)+alltrim(sen_1)
IF .not. EOF()
	STORE PROGRAMAS     TO no_pro 
	STORE LEN(no_pro)   TO tam_1
    FOR i=1 TO tam_1
        no_val = "val_"+ALLTRIM(STR(i))
	    STORE ALLTRIM(SUBSTR(no_pro,1,AT(",",no_pro)-1))     TO val_x  
	    STORE ALLTRIM(SUBSTR(no_pro,AT(",",no_pro)+1,tam_1)) TO &no_val
	    STORE &no_val   TO no_pro
        IF val_x = pro_1
           DO form &acess_pro
           ate = 1
           EXIT FOR
        ENDIF
	ENDFOR
    IF ate = 0
       =MESSAGEBOX("Usuario sem Permissao !!!",0+16,cTitulo)
    ENDIF   
ELSE
   =MESSAGEBOX("Usuario nao Autorizado !!!",0+16,cTitulo)
ENDIF

PROCEDURE errhand
PARAMETER merror, mess, mess1, mprog, mlineno

IF merror = 107 .or. merror = 108 .or. merror = 1959
   *=MessageBox(" e Aqui 1")
   RETURN
ENDIF 

IF merror = 2012
   * Deixa pra la !!!!
   RETURN
ENDIF  

IF merror = 38
   * Deixa pra la !!!!
   RETURN
ENDIF  

IF merror = 96
   * Deixa pra la !!!!
   RETURN
ENDIF      

IF merror = 1298

   cText = "Tamanho da Pagina esta incorreta para"  + Chr(13) + Chr(13) + ;
           "impressao do Documento configure para"  + Chr(13) + ;
           "Pagina A4 na sua impressora e tente  "  + Chr(13) + ;
           "imprimir novamente!                  "

   =MessageBox(cText, 64, cTitulo)


   RETURN 
ENDIF    
      
If merror = 202

   cText = "Servidor de Acesso n„o Foi encontrado"  + Chr(13) + Chr(13) + ;
           "A Rede n„o esta acessivel ou caminho "  + Chr(13) + ;
           "PATH n„o est· Correto !!             "  + Chr(13) + ;
           "Tente Reiniciar o Sistema novamente !"

   =MessageBox(cText, 64, cTitulo)
   *QUIT 
   
ENDIF

If merror = 1

   cText = "Servidor de Acesso n„o Foi encontrado"  + Chr(13) + Chr(13) + ;
           "A Rede n„o esta acessivel ou caminho "  + Chr(13) + ;
           "PATH n„o est· Correto !!             "  + Chr(13) + ;
           "Tente Reiniciar o Sistema novamente !"

   =MessageBox(cText, 64, cTitulo)
   *QUIT 
   
ENDIF



IF merror = 1705 .or. merror = 52
   Faz = 0
   cText = "Tabela esta sendo Usada !!!"
   =MessageBox(cText, 64, cTitulo)
   ON SHUTDOWN quit
   QUIT
   RETURN  
ENDIF 


IF merror = 1466
   Faz = 0
   cText = "Servidor de Acesso n„o Foi encontrado"  + Chr(13) + Chr(13) + ;
           "A Rede n„o esta acessivel "  + Chr(13) + ;
           "Tente Reiniciar o Sistema !"
   =MessageBox(cText, 64, cTitulo)
   ON SHUTDOWN quit
   QUIT
   RETURN  
ENDIF 


ENDPROC

*************************************
*                                   *
*  Abilita Janela de Comando do Fox *
*                                   *
*************************************

FUNCTION command1()

  SET CLASSLIB TO controls
  oJanelaDeComando=CREATEOBJECT('Comand1')
  oJanelaDeComando.Show()

ENDFUNC

FUNCTION cabecalho()
	***  
	* Converte data para 2000
	***  
	dat_velha = date()
	STORE DTOC(dat_velha)             TO dat_nov
	STORE SUBSTR(dat_nov,1,6)         TO dat_fim
	STORE year(date())                TO dat_com
	STORE dat_fim+ltrim(str(dat_com)) TO aa_dat

	&& CabeÁalho da Pagina

	@ PROW()+01,00  SAY REPLICATE("=",132)
	@ PROW()+01,01  SAY titulo_x
	@ PROW()+01,00  SAY REPLICATE("-",132)
	@ PROW()+01,01  SAY "Data : "
	@ PROW()+00,08  SAY aa_dat
	@ PROW()+00,63  SAY time()
	@ PROW()+00,120 SAY "Pagina : "
	@ PROW()+00,120 SAY pagina
	@ PROW()+01,00  SAY REPLICATE("-",132)
	@ PROW()+01,00  SAY SPACE(02)
	
ENDFUNC

***
*  FunÁ„o termometro
**

FUNCTION termometro()
LPARAMETERS ativar, percentual, mensagem, incremento

If Parameters()= 4

   If ((percentual % incremento) > 1.0) 
     Return .T.
   Endif

   If ativar
     If not WVisible("TERMOMETRO")
        Define Window TERMOMETRO ;
          At  0.000, 0.000  ;
          Size 4.769,75.600 ;
          Font "MS Sans Serif", 8 ;
          NoFloat ;
          NoClose ;
          NoMinimize ;
          Color RGB(,,,192,192,192)
        Move Window TERMOMETRO Center
        Set Cursor Off
        Activate Window TERMOMETRO Top
        @ 2.692,5.200 To 2.692,65.400 ;
          Pen 1, 8 ;
          Style "1" ;
          Color RGB(128,128,128,128,128,128)
        @ 3.615,5.200 To 3.615,65.400 ;
      	  Pen 1, 8 ;
      	  Style "1" ;
      	  Color RGB(255,255,255,255,255,255)
        @ 2.692,5.200 To 3.692,5.200 ;
      	  Pen 1, 8 ;
      	  Color RGB(128,128,128,128,128,128)
        @ 2.692,65.200 To 3.692,65.200 ;
      	  Pen 1, 8 ;
      	  Color RGB(255,255,255,255,255,255)
        @ 2.769,2.400 Say "0"  ;
      	  Font "MS Sans Serif", 8 ;
      	  Style "BT"
        @ 2.769,66.200 Say "100%"  ;
      	  Font "MS Sans Serif", 8 ;
      	  Style "BT"
        @ 4.538,0.800 To 4.538,75.200 ;
      	  Pen 2, 8 ;
      	  Style "1" ;
      	  Color RGB(128,128,128,128,128,128)
        @ 0.231,0.400 To 4.539,0.400 ;
      	  Pen 2, 8 ;
      	  Color RGB(255,255,255,255,255,255)
        @ 0.231,75.000 To 4.539,75.000 ;
      	  Pen 2, 8 ;
      	  Color RGB(128,128,128,128,128,128)
        @ 0.077,0.600 To 0.077,75.000 ;
      	  Pen 2, 8 ;
      	  Style "1" ;
    	  Color RGB(255,255,255,255,255,255)
     Endif
     Activate Window TERMOMETRO Top
     @ 1.00, 2.500 Say mensagem ;
	 Size 1.000,59.00 ;
	 Font "MS Sans Serif", 8 ;
     Style "B" ;
	 Picture "@I"
     
     If percentual > 0
        @ 2.846,5.800 To 3.538, 5.8+58.8*(percentual/per1); && 5431.0);  && 
          Pattern 1 ;
          Pen 1, 8 ;
          Color RGB(,,,255,128,0)
     Endif
   Endif
Else
   If WExist("TERMOMETRO")
     Release Window TERMOMETRO
     Set Cursor On
   Endif
Endif
Return .T.
ENDFUNC


***
* Tabelas usadas no Sistema
***
PROCEDURE abri_banco_111()

Open DataBase BancoDados shared

USE edif      		IN 1  shared
USE adms      		IN 2  shared     
USE socios    		IN 3  shared     
USE categ     		IN 4  shared     
USE aposent   		IN 5  shared         
USE Resumo3   		IN 6  shared     
USE edif02    		IN 7  shared     
USE curat     		IN 8  shared     
USE caddesc   		IN 9  shared     
USE conf      		IN 10 shared     
USE sindical  		IN 11 shared     
USE leia      		IN 12 shared     
USE tt_ser_01 		IN 13 shared    
USE agora     		IN 14 shared      
USE cobra     		IN 15 shared     
USE vaga      		IN 16 shared     
USE vagapre   		IN 17 shared     
USE cadadv    		IN 18 shared     
USE cadreaj   		IN 19 shared     
USE morto     		IN 20 shared     
USE acompa    		IN 21 shared     
USE acompa2   		IN 22 shared        
USE acompa_2  		IN 23 shared     
USE curat_2   		IN 24 shared     
USE agora2    		IN 25 shared     
USE remed     		IN 26 shared     
USE cadfor    		IN 27 shared     
USE cursos    		IN 28 shared     
USE resumoX   		IN 29 shared     
USE etqAdms   		IN 30 shared     
USE etqEdif   		IN 31 shared     
USE etqSoc    		IN 32 shared     
USE cheque    		IN 33 Shared     
USE cadbanco  		IN 34 Shared     
USE desp_1    		IN 35 Shared     
USE banco     		IN 36 Shared     
USE planil    		IN 37 Shared     
USE histo     		IN 38 Shared     
USE saldo     		IN 39 Shared     
USE dat_1     		IN 40 Shared     
USE cadest    		IN 41 Shared     
USE lanca     		IN 42 Shared     
USE repasa    		IN 43 Shared     
USE cadest2   		IN 44 Shared     
USE gastos    		IN 45 Shared     
USE rec_pes   		IN 46 SHARED 
USE pesqsoc   		IN 47 Shared     
USE agenda    		IN 48 Shared     
USE caixa     		IN 49 Shared     
USE receita   		IN 50 shared  
USE aposent2  		IN 51 shared     
USE aposent3  		IN 52 shared     
USE avul      		IN 53 shared     
*USE fecoesp   		IN 54 shared     
USE lisconj   		IN 55 shared     
USE guiasSind 		IN 56 shared     
USE DrogaR    		IN 57 Shared     
USE depend    		IN 58 Shared     
USE atendi    		IN 59 shared      
USE rel_conf2  		IN 60 shared     
USE Agenda2   		IN 61 shared      
USE Ag_data   		IN 62 shared     
USE Medico    		IN 63 shared     
USE Oposicao2 		IN 64 shared     
USE caixa_mes 		IN 65 shared     
USE aberto    		IN 66 shared     
*USE ETQ_EST   		IN 67 shared     
USE Ruas      		IN 68 shared     
USE bairros   		IN 69 shared     
USE logradou  		IN 70 shared     
USE cidades   		IN 71 shared     
USE codigo    		IN 72 shared     
USE estorno   		IN 73 shared     
USE debito    		IN 74 shared      
USE Receb_2   		IN 75 SHARED 
USE receb_1   		IN 76 shared && antigo 51
*USE receb_2   		IN 77 shared && antigo 52
USE rec_temp  		IN 78 shared
USE PesqAdm   		IN 79 SHARED
USE protocolo 		IN 80 SHARED 
USE guias_sind 		IN 81 SHARED 
USE comanda    		IN 82 SHARED 
USE gasmes     		IN 83 Shared  && 46 
USE mov_est    		IN 84 Shared  && 50 
USE atendi2    		IN 85 shared 
USE CadestOdo  		IN 86 SHARED 
USE lancaodo   		IN 87 SHARED 
USE lorival    		IN 88 SHARED 
USE pe_con_sind   	IN 89 SHARED 
USE pes_conf  		IN 90 SHARED 
USE pes_sind  		IN 91 SHARED 
USE receita_cx 		IN 92 SHARED 
USE CH_1       		IN 93 SHARED 
USE rel_odonto 		IN 94 SHARED 
USE Cobranca   		IN 95 SHARED 
USE Cobranca1  		IN 96 SHARED 
USE prin_cob   		IN 97 SHARED 
USE Treina     		IN 98 SHARED   && 95 SHARED 
USE Treina1    		IN 99 SHARED   && 96 SHARED 
USE prin_trei  		IN 100 SHARED  && 97 SHARED 
USE GPS        		IN 101 SHARED
USE Pes_freq   		IN 102 SHARED 
USE aberto2    		IN 103 SHARED 
USE cobra77    		IN 104 SHARED 
USE BANC_SIND  		IN 105 SHARED 
USE ACORDO     		IN 106 SHARED 
USE VAGASENV   		IN 107 SHARED 
USE ATENDVAG   		IN 108 SHARED 
USE MEGOCIACAO 		IN 109 SHARED 
USE FENATEC    		IN 110 SHARED 
USE lisgeral   		IN 111 SHARED 
USE Farmacia   		IN 112 SHARED 
USE cursos2    		IN 113 SHARED 
USE Update     		IN 114 SHARED 
USE GERA_GUIAS 		IN 115 SHARED 
USE GERA_BOLETOS    IN 116 SHARED 
USE GUIAS_SOC       IN 117 SHARED 
USE MENSALIDADE     IN 118 SHARED 


ENDPROC 

***
* Tabelas usadas no Sistema Exclusivo
***
PROCEDURE abri_exclusivo_111()

Open DataBase BancoDados EXCLUSIVE 

USE edif      IN 1  EXCLUSIVE     
USE adms      IN 2  EXCLUSIVE     
USE socios    IN 3  EXCLUSIVE     
USE categ     IN 4  EXCLUSIVE     
USE aposent   IN 5  EXCLUSIVE     
USE Resumo3   IN 6  EXCLUSIVE     
USE edif02    IN 7  EXCLUSIVE     
USE curat     IN 8  EXCLUSIVE     
USE caddesc   IN 9  EXCLUSIVE     
USE conf      IN 10 EXCLUSIVE     
USE sindical  IN 11 EXCLUSIVE     
USE leia      IN 12 EXCLUSIVE     
USE tt_ser_01 IN 13 EXCLUSIVE    
USE agora     IN 14 EXCLUSIVE      
USE cobra     IN 15 EXCLUSIVE     
USE vaga      IN 16 EXCLUSIVE     
USE vagapre   IN 17 EXCLUSIVE     
USE cadadv    IN 18 EXCLUSIVE     
USE cadreaj   IN 19 EXCLUSIVE     
USE morto     IN 20 EXCLUSIVE     
USE acompa    IN 21 EXCLUSIVE     
USE acompa2   IN 22 EXCLUSIVE        
USE acompa_2  IN 23 EXCLUSIVE     
USE curat_2   IN 24 EXCLUSIVE     
USE agora2    IN 25 EXCLUSIVE     
USE remed     IN 26 EXCLUSIVE     
USE cadfor    IN 27 EXCLUSIVE     
USE cursos    IN 28 EXCLUSIVE     
USE resumoX   IN 29 EXCLUSIVE     
USE etqAdms   IN 30 EXCLUSIVE     
USE etqEdif   IN 31 EXCLUSIVE     
USE etqSoc    IN 32 EXCLUSIVE     
USE cheque    IN 33 EXCLUSIVE     
USE cadbanco  IN 34 EXCLUSIVE     
USE desp_1    IN 35 EXCLUSIVE     
USE banco     IN 36 EXCLUSIVE     
USE planil    IN 37 EXCLUSIVE     
USE histo     IN 38 EXCLUSIVE     
USE saldo     IN 39 EXCLUSIVE     
USE dat_1     IN 40 EXCLUSIVE     
USE cadest    IN 41 EXCLUSIVE     
USE lanca     IN 42 EXCLUSIVE     
USE repasa    IN 43 EXCLUSIVE     
USE cadest2   IN 44 EXCLUSIVE     
USE gastos    IN 45 EXCLUSIVE     
*USE gasmes    IN 46 EXCLUSIVE     
USE rec_pes   IN 46 EXCLUSIVE 
USE pesqsoc   IN 47 EXCLUSIVE     
USE agenda    IN 48 EXCLUSIVE     
USE caixa     IN 49 EXCLUSIVE     
*USE mov_est   IN 50 EXCLUSIVE   
USE receita   IN 50 EXCLUSIVE  
USE aposent2  IN 51 EXCLUSIVE     
USE aposent3  IN 52 EXCLUSIVE     
USE avul      IN 53 EXCLUSIVE     
*USE fecoesp   IN 54 EXCLUSIVE     
USE lisconj   IN 55 EXCLUSIVE     
USE guiasSind IN 56 EXCLUSIVE     
USE DrogaR    IN 57 EXCLUSIVE     
USE depend    IN 58 EXCLUSIVE     
USE atendi    IN 59 EXCLUSIVE      
USE rel_conf2  in 60 EXCLUSIVE     
USE Agenda2   IN 61 EXCLUSIVE      
USE Ag_data   IN 62 EXCLUSIVE     
USE Medico    IN 63 EXCLUSIVE     
USE Oposicao  IN 64 EXCLUSIVE     
USE caixa_mes IN 65 EXCLUSIVE     
USE aberto    IN 66 EXCLUSIVE     
*USE ETQ_EST   IN 67 EXCLUSIVE     
USE Ruas      IN 68 EXCLUSIVE     
USE bairros   IN 69 EXCLUSIVE     
USE logradou  IN 70 EXCLUSIVE     
USE cidades   IN 71 EXCLUSIVE     
USE codigo    IN 72 EXCLUSIVE     
USE estorno   IN 73 EXCLUSIVE     
USE debito    IN 74 EXCLUSIVE      
USE Receb_2   IN 75 EXCLUSIVE 
USE receb_1   IN 76 EXCLUSIVE && antigo 51
*USE receb_2   IN 77 EXCLUSIVE && antigo 52
USE rec_temp  IN 78 EXCLUSIVE
USE PesqAdm   IN 79 SHARED
USE protocolo IN 80  EXCLUSIVE  

CLOSE DATABASES all
*abri_banco()

ENDPROC

************************************************************
*                                                          *    
*  F O R M U L A  C A L C U L O  R E C E I T A  C A I X A  *
*                                                          *
************************************************************
 
FUNCTION faz_delta()

Store substr(txt_data,4,4)                 to Ano_se_1
Store substr(txt_data,1,2)                 to Mes_se_1
Store semana_xfim                          to Sem_ana_1
Store Sem_ana_1+"/"+Mes_se_1+"/"+Ano_se_1  to se_dia
Store ctod(se_dia)                         to i_data

i_numero    = 1
i_operadora = txt_operadora
soma_x = 0

SELECT 9
SET ORDER TO CADDESC   && CODIGO 
GO TOP

DO WHILE .not. EOF()
   STORE codigo    TO cod_desc
   STORE descricao TO dec_desc
   STORE Tipo      TO rel_tipo
   SELECT 49
   SET ORDER TO CAI_IN3
   GO TOP 
   STORE i_operadora+STR(i_numero,10)+STR(cod_desc,16)+DTOC(i_data) TO aa_CAI
   SEEK aa_CAI
   IF .not. EOF()
      DO WHILE aa_CAI = Operadora+STR(numero,10)+STR(tipo_mov,16)+Data
         soma_x = soma_x + vlr_tot
         IF .not. eof()
            SKIP 
         ELSE 
            EXIT   
         ENDIF   
      ENDDO
   ENDIF  
   
   *** PRIMEIRO DEVE INCLUIR NOVO ****
   SELECT 92
   IF rel_Tipo <> "T"
       IF i = 1
	      APPEND BLANK   
	      replace data      WITH txt_Data
	      replace mes       WITH INT(VAL(Mes_se_1))
	      replace operadora WITH i_operadora
	      replace item      WITH cod_desc
	      replace descricao WITH dec_desc
	      replace semana1   WITH INT(VAL(Sem_ana_1))
	      replace a         WITH soma_x
	   ENDIF    
	  && Ja existe
	  DO case  
	     CASE i = 2
	          SET ORDER TO COD2
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana2   WITH INT(VAL(Sem_ana_1))
	             replace b         WITH soma_x
	          ENDIF
	     CASE i = 3
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana3   WITH INT(VAL(Sem_ana_1))
	             replace c         WITH soma_x
	          ENDIF    
	     CASE i = 4
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana4   WITH INT(VAL(Sem_ana_1))
	             replace d         WITH soma_x
	          ENDIF    
	     CASE i = 5
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana5   WITH INT(VAL(Sem_ana_1))
	             replace e         WITH soma_x
	          ENDIF    
	     CASE i = 6
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana6   WITH INT(VAL(Sem_ana_1))
	             replace f         WITH soma_x
	          ENDIF    
	     CASE i = 7
	          SEEK txt_Data+i_operadora+STR(cod_desc)
	          IF .not. EOF()
	             replace semana7   WITH INT(VAL(Sem_ana_1))
	             replace g         WITH soma_x
	          ENDIF    
	  ENDCASE 
   ENDIF 	          
   soma_x = 0	  
   SELECT 9
   SKIP
   LOOP 
ENDDO
   
ENDFUNC


*****************************************************
*   Funcao Codigo de Barras Caixa Economica Federal *
*                                                   *
*   Modulo 10 - 2 por 1                             *
*****************************************************

FUNCTION DIG_VER_1(Numero_yy)

conta1  = 0
soma    = 0
faz     = 1
soma    = 0
FOR i = LEN(ALLTRIM(Numero_yy)) TO 0 STEP -1
    IF i > -1 
	   IF MOD(i,2)=1
		  valor=VAL(SUBSTR(Numero_yy,i,1))
	   ELSE   
		  valor=VAL(SUBSTR(Numero_yy,i,1))*2
	   ENDIF
	   IF valor > 9
	      FOR J = LEN(ALLTRIM(STR(VALOR))) TO 0 STEP -2
	          IF faz = 1
	             desm = SUBSTR(ALLTRIM(STR(valor)),1,1)
	             faz = 0
	          ELSE
	             desm = SUBSTR(ALLTRIM(STR(valor)),2,2)
	          ENDIF   
	          soma = soma + INT(VAL(desm))
	      ENDFOR 
	      faz = 1
	   ELSE
	      soma = soma + valor
	   ENDIF      
	ENDIF    
ENDFOR 

mRESTO=10-MOD(SOMA,10)  

IF mRESTO=10
   RESTO=0
ELSE
   RESTO=mRESTO
ENDIF

RETURN(RESTO)

ENDFUNC 

*****************************************************
*   Funcao Codigo de Barras Caixa Economica Federal *
*                                                   *
*   Modulo 11 - 98765432                             *
*****************************************************

FUNCTION DIG_GER_1(NUMERO_xx)

conta1 = 0
dig    = 0
soma = "98765432"
le_so = LEN(soma)
le_co1 = LEN(NUMERO_xx)

FOR i = 1 TO LEN(NUMERO_xx)
	STORE SUBSTR(NUMERO_xx,le_co1,1)        TO A1
	le_co1 = le_co1 - 1
	STORE SUBSTR(soma,le_so,1)         TO B1 
	le_so = le_so - 1
	IF le_so = 0
	   le_so = LEN(soma)
	ENDIF    
	STORE INT(VAL(A1)) * INT(VAL(B1))  TO fim
	IF fim < 10
	   conta1 = conta1 + fim
	ELSE
	   *STORE ALLTRIM(STR(fim)) TO fim_st
	   *FOR a = 0 TO 2
	   *     STORE SUBSTR(fim_st,a,1) TO fim
	   *     STORE INT(VAL(fim))      TO fim
	        conta1 = conta1 + fim
	   *ENDFOR  
	ENDIF       
ENDFOR     
IF MOD(conta1,11) = 0 .or. MOD(conta1,11) = 10 .or. MOD(conta1,11) = 1
   dig = 1
ELSE
   STORE 11 - MOD(conta1,11) TO dig
ENDIF 

 RETURN(DIG)

ENDFUNC

FUNCTION pes_freq()

ENDFUNC



*********************************************************************************

*  --------------------------------------
*  Esta funcao verifica se o socio esta
*  com o pagamento da mensalidade em dia.
*  --------------------------------------
FUNCTION pg_soc()

SET STEP ON 

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

   IF dat3 <> "  /  /    " .or. dat3 = " "
      STORE datinsc TO dat3
   ENDIF    

    && Verifica se e Remido
    store substr(datinsc,7,10) TO ANOSOC
    STORE VAL(ANOSOC)          TO ANOSOC2
   
    STORE ANO - ANOSOC2 TO v_FIM
    
    If v_FIM >= 20
    
       =Messagebox("Socio consta como REMIDO !!!", cTitulo)
       
   ELSE
   
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
			CASE ANO = 1993
				STORE "/1993" TO ADT
			CASE ANO = 1994
				STORE "/1994" TO ADT
			CASE ANO = 1994
				STORE "/1995" TO ADT
			CASE ANO = 1996
				STORE "/1996" TO ADT
			CASE ANO = 1997
				STORE "/1997" TO ADT
			CASE ANO = 1998
				STORE "/1998" TO ADT
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
		   pagto = .F.
		      
		   qtd_mes()

		ENDIF     
      
   ENDIF   

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
q_faz_oque = .F.

STORE YEAR(DATE())        TO vv_ano
STORE SUBSTR(datinsc,7,4) TO vv_ano2
STORE INT(VAL(vv_ano2))   TO vv_ano3

*IF vv_ano3 = vv_ano
IF i_ano1 = 0
   cText = "REC…M CADASTRADO OU NA CAR NCIA" + Chr(13) + ;
		   "      VERIFICAR DATA DE INCLUS√O     "+ Chr(13)

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
		
		IF som_qtd >= 6 && antes era 6
		
		   
		   IF DAY(DATE()) >= DAY(CTOD(datinsc))
		
               q_faz_oque = .T.		
*		       cText = "Socio consta como Desligado"
*		               "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrazadas num total de" + Chr(13) + ;
		               "R$"+str(valor_2)+".00 Reais"
*
*    		           =MessageBox(cText, 16+32, cTitulo)
	   	    	  
		       exit do
		    ELSE
		    
		       IF som_qtd > 6
		          q_faz_oque = .T.		
		          EXIT do
		       ENDIF    


			   cText = "Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !" + Chr(13) + ;
			           "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrasadas num total de" + Chr(13) + ;
			           "R$"+str(valor_2)+".00 Reais"

     			       =MessageBox(cText, 16+32, cTitulo)
			    	  
    			       exit do
		      
		   ENDIF 
		      
		ELSE

			cText = "Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !" + Chr(13) + ;
			        "Quantidade de "+ alltrim(str(som_qtd))+" Mensalidades atrasadas num total de" + Chr(13) + ;
			        "R$"+str(valor_2)+".00 Reais"

			      =MessageBox(cText, 16+32, cTitulo)
			    	  
			      exit do
		      
		endif
		
      ENDIF 
   ENDIF
ENDDO
		   
ENDIF 		   

RETURN

ENDFUNC



FUNCTION BOTOES_OFF()


******************************************************
*      FunÁ„o Identifica permiss„o de usu·rios       *
******************************************************

** AlteraÁ„o Socios
if UPPER(ii_soc1) = "SIM"
        Thisform.pageframe1.page1.Command4.Enabled = .T. && Incuir
endif
if UPPER(ii_soc2) = "SIM"     
        Thisform.pageframe1.page1.Command5.Enabled = .T. && Excluir
endif        
if UPPER(ii_soc3) = "SIM"     
        Thisform.pageframe1.page1.Command6.Enabled = .T. && Alterar
        Thisform.pageframe1.page2.label46.Enabled  = .T. && alterar 2∫ tela    
endif        

** AlteraÁ„o Edificios
if UPPER(ii_Edif1) = "SIM"
        Thisform.Command4.Enabled = .T. && Incuir
endif
if UPPER(ii_Edif1) = "SIM"     
        Thisform.Command5.Enabled = .T. && Excluir
endif        
if UPPER(ii_Edif1) = "SIM"     
        Thisform.Command6.Enabled = .T. && Alterar
endif        

** AlteraÁ„o Administradora
if UPPER(ii_Adm1) = "SIM"
        Thisform.pageframe1.page1.Command4.Enabled = .T. && Incuir
endif
if UPPER(ii_Adm1) = "SIM"     
        Thisform.pageframe1.page1.Command5.Enabled = .T. && Excluir
endif        
if UPPER(ii_Adm1) = "SIM"     
        Thisform.pageframe1.page1.Command6.Enabled = .T. && Alterar
endif        


ThisForm.pageframe1.page1.Command8.Enabled    = .T.
ThisForm.pageframe1.page1.Command1.Enabled    = .T.
ThisForm.pageframe1.page1.Command2.Enabled    = .T.
ThisForm.pageframe1.page1.Command7.Enabled    = .T.
ThisForm.pageframe1.page1.Command8.Enabled    = .T.
ThisForm.pageframe1.page1.cmdConsulta.Enabled = .T.
ThisForm.pageframe1.page1.Command3.Enabled    = .T.

IF ii_permi2 = 14
   Thisform.pageframe1.page3.command4.Enabled    = .T. 
   Thisform.pageframe1.page3.command5.Enabled    = .T.
   Thisform.pageframe1.page3.command6.Enabled    = .T.
ENDIF    

RETURN

ENDFUNC



* Exemplo : ? _Resolucao() -> "800x600" 
*------------------------------------------- 
FUNCTION _Resolucao() 
 RETURN TRANSFORM(SYSMETRIC(1))+"x"+TRANSFORM(SYSMETRIC(2)) 
ENDFUNC


FUNCTION Shell 
LPARAMETER lcLink, lcAction, lcParms, lcDir 
lcAction = IIF(EMPTY(lcAction), "Open", lcAction) 
lcParms = IIF(EMPTY(lcParms), "", lcParms) 
lcDir=IIF(empty(lcDir),"",lcDir) 
DECLARE INTEGER ShellExecute ; 
    IN SHELL32.dll ; 
    INTEGER nWinHandle, ; 
    STRING cOperation, ; 
    STRING cFileName, ; 
    STRING cParameters, ; 
    STRING cDir, ; 
    INTEGER nShowWindow 

DECLARE INTEGER FindWindow ; 
   IN WIN32API ; 
   STRING cNull,STRING cWinName 

RETURN ShellExecute(FindWindow(0, _SCREEN.caption), ; 
                    @lcAction, @lcLink, ; 
                    @lcParms, @lcDir, 1)



* Fazer checagem de CPF. 

FUNCTION CHKCPF 
PARAMETER num_cpf 
m.d_1 = 0 
m.d_2 = 0 
m.x_x = 1 
FOR m.conta = 1 TO LEN ( num_cpf ) - 2 
    IF AT( SUBS( num_cpf, m.conta, 1 ), "/-." ) = 0 
        m.d_1 = m.d_1 + ( 11 - m.x_x ) * VAL( SUBS( num_cpf, m.conta, 1 )) 
        m.d_2 = m.d_2 + ( 12 - m.x_x ) * VAL( SUBS( num_cpf, m.conta, 1 )) 
        m.x_x = m.x_x + 1 
    ENDIF 
NEXT 
m.resto = m.d_1 - ( INT( m.d_1 / 11 ) * 11 ) 
m.digito = IIF( m.resto < 2, 0, 11 - m.resto ) 
m.d_2 = m.d_2 + 2 * m.digito 
m.resto = m.d_2 - ( INT( m.d_2 / 11) * 11 ) 
m.digito = VAL( STR( m.digito, 1 ) + STR( IIF( m.resto < 2, 0, 11 - m.resto ), 1 )) 
IF m.digito != VAL( SUBS( num_cpf, LEN( num_cpf ) - 1, 2 )) 
    RETURN .F. 
ELSE 
    RETURN .T. 
ENDIF 


*****************************************************
*   Funcao Digito verificador Nosso Numero          *
*                                                   *
*   Modulo 11 - Banco do Brasil                     *
*****************************************************

FUNCTION DIG_Nosso_1(NUMERO_xx)

conta1 = 0
dig    = 0
soma   =    "78923456789"
*STORE VAL(SUBSTR(NUMERO_xx,12,1))*5 TO a_res1
STORE VAL(SUBSTR(NUMERO_xx,11,1))*9 TO a_res2
STORE VAL(SUBSTR(NUMERO_xx,10,1))*8 TO a_res3
STORE VAL(SUBSTR(NUMERO_xx,09,1))*7 TO a_res4
STORE VAL(SUBSTR(NUMERO_xx,08,1))*6 TO a_res5
STORE VAL(SUBSTR(NUMERO_xx,07,1))*5 TO a_res6
STORE VAL(SUBSTR(NUMERO_xx,06,1))*4 TO a_res7
STORE VAL(SUBSTR(NUMERO_xx,05,1))*3 TO a_res8
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res9
STORE VAL(SUBSTR(NUMERO_xx,03,1))*9 TO a_res10
STORE VAL(SUBSTR(NUMERO_xx,02,1))*8 TO a_res11
STORE VAL(SUBSTR(NUMERO_xx,01,1))*7 TO a_res12
STORE a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9+a_res10+a_res11+a_res12 TO a_tor
STORE MOD(a_tor,11) TO dig

IF MOD(a_tor,11) = 10
   STORE "X"           TO dig
ELSE
   STORE STR(MOD(a_tor,11)) TO dig
ENDIF 

RETURN(DIG)

ENDFUNC


FUNCTION DIG_Nosso_2(NUMERO_xx)

conta1 = 0
dig    = 0
soma   =    "23456789234567892345678923456789234567892345678923456789"
STORE VAL(SUBSTR(NUMERO_xx,11,1))*9 TO a_res1
STORE VAL(SUBSTR(NUMERO_xx,10,1))*8 TO a_res2
STORE VAL(SUBSTR(NUMERO_xx,09,1))*7 TO a_res3
STORE VAL(SUBSTR(NUMERO_xx,08,1))*6 TO a_res4
STORE VAL(SUBSTR(NUMERO_xx,07,1))*5 TO a_res5
STORE VAL(SUBSTR(NUMERO_xx,06,1))*4 TO a_res6
STORE VAL(SUBSTR(NUMERO_xx,05,1))*3 TO a_res7
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res8
STORE VAL(SUBSTR(NUMERO_xx,03,1))*9 TO a_res9
STORE a_res1+a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9 TO a_tor
STORE MOD(a_tor,11) TO dig

*IF MOD(a_tor,11) = 10
*   STORE "X"           TO dig
*ELSE
   STORE STR(MOD(a_tor,11)) TO dig
*ENDIF 

RETURN(DIG)

ENDFUNC

*****************************************************
*   Funcao Codigo de Barras Banco do Brasil         *
*                                                   *
*   Modulo 10 - 2 por 1                             *
*****************************************************

FUNCTION DIG_VER_2(Numero_yy)

conta1  = 0
soma    = 0
faz     = 1
soma    = 0
FOR i = LEN(ALLTRIM(Numero_yy)) TO 0 STEP -1
    IF i > -1 
	   IF MOD(i,2)=1
		  valor=VAL(SUBSTR(Numero_yy,i,1))
	   ELSE   
		  valor=VAL(SUBSTR(Numero_yy,i,1))*2
	   ENDIF
	   IF valor > 9
	      FOR J = LEN(ALLTRIM(STR(VALOR))) TO 0 STEP -2
	          IF faz = 1
	             desm = SUBSTR(ALLTRIM(STR(valor)),1,1)
	             faz = 0
	          ELSE
	             desm = SUBSTR(ALLTRIM(STR(valor)),2,2)
	          ENDIF   
	          soma = soma + INT(VAL(desm))
	      ENDFOR 
	      faz = 1
	   ELSE
	      soma = soma + valor
	   ENDIF      
	ENDIF    
ENDFOR 

mRESTO=10-MOD(SOMA,10)  

IF mRESTO=10
   RESTO=0
ELSE
   RESTO=mRESTO
ENDIF

RETURN(RESTO)

ENDFUNC 


FUNCTION DIG_CAMPO1(NUMERO_xx)

STORE VAL(SUBSTR(NUMERO_xx,09,1))*1 TO a_res1
STORE VAL(SUBSTR(NUMERO_xx,08,1))*2 TO a_res2
STORE VAL(SUBSTR(NUMERO_xx,07,1))*1 TO a_res3
STORE VAL(SUBSTR(NUMERO_xx,06,1))*2 TO a_res4
STORE VAL(SUBSTR(NUMERO_xx,05,1))*1 TO a_res5
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res6
STORE VAL(SUBSTR(NUMERO_xx,03,1))*1 TO a_res7
STORE VAL(SUBSTR(NUMERO_xx,02,1))*2 TO a_res8
STORE VAL(SUBSTR(NUMERO_xx,01,1))*1 TO a_res9
STORE a_res1+a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9 TO a_tor
STORE MOD(a_tor,10) TO dig

IF dig > 9

   STORE SUBSTR(STR(dig,2),1,1) TO va_1
   STORE SUBSTR(STR(dig,2),2,1) TO va_2

   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO DIG
   
   IF DIG > 9
	  STORE SUBSTR(STR(dig,2),1,1) TO va_1
	  STORE SUBSTR(STR(dig,2),2,1) TO va_2

	  STORE INT(VAL(va_1))+INT(VAL(va_2)) TO DIG
   
   ENDIF 

ENDIF 

RETURN(DIG)

ENDFUNC


FUNCTION DIG_VER_3(NUMERO_xx)

STORE VAL(SUBSTR(NUMERO_xx,10,1))*2 TO a_res1
IF a_res1 > 9
   STORE SUBSTR(STR(a_res1,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res1,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res1
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,09,1))*1 TO a_res2
IF a_res2 > 9
   STORE SUBSTR(STR(a_res2,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res2,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res2
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,08,1))*2 TO a_res3
IF a_res3 > 9
   STORE SUBSTR(STR(a_res3,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res3,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res3
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,07,1))*1 TO a_res4
IF a_res4 > 9
   STORE SUBSTR(STR(a_res4,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res4,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res4
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,06,1))*2 TO a_res5
IF a_res5 > 9
   STORE SUBSTR(STR(a_res5,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res5,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res5
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,05,1))*1 TO a_res6
IF a_res6 > 9
   STORE SUBSTR(STR(a_res6,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res6,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res6
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res7
IF a_res7 > 9
   STORE SUBSTR(STR(a_res7,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res7,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res7
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,03,1))*1 TO a_res8
IF a_res8 > 9
   STORE SUBSTR(STR(a_res8,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res8,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res8
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,02,1))*2 TO a_res9
IF a_res9 > 9
   STORE SUBSTR(STR(a_res9,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res9,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res9
ENDIF
STORE VAL(SUBSTR(NUMERO_xx,01,1))*1 TO a_res10
IF a_res10 > 9
   STORE SUBSTR(STR(a_res10,2),1,1) TO va_1
   STORE SUBSTR(STR(a_res10,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO a_res10
ENDIF
STORE a_res1+a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9+a_res10 TO a_tor
*STORE MOD(a_tor,10) TO dig
STORE a_tor TO dig

STORE dig - 10*INT(dig/10)-10 TO dig
IF dig < 0
   STORE dig /-1  TO dig
ENDIF
STORE INT(dig) TO dig

IF dig = 10
   STORE 0 TO dig
ENDIF    
   
IF dig > 9

   STORE SUBSTR(STR(dig,2),1,1) TO va_1
   STORE SUBSTR(STR(dig,2),2,1) TO va_2
   STORE INT(VAL(va_1))+INT(VAL(va_2)) TO DIG
   
   IF DIG > 9
	  STORE SUBSTR(STR(dig,2),1,1) TO va_1
	  STORE SUBSTR(STR(dig,2),2,1) TO va_2
	  STORE INT(VAL(va_1))+INT(VAL(va_2)) TO DIG
   ENDIF 

ENDIF 

RETURN(DIG)

ENDFUNC

*****************************************************
*   Funcao Digito verificador Codigo de Barras      *
*                                                   *
*   Modulo 11 - Banco do Brasil                     *
*****************************************************

FUNCTION DIG_GER_1(NUMERO_xx)

conta1 = 0
dig    = 0
soma = "98765432"
le_so = LEN(soma)
le_co1 = LEN(NUMERO_xx)

FOR i = 1 TO LEN(NUMERO_xx)
	STORE SUBSTR(NUMERO_xx,le_co1,1)        TO A1
	le_co1 = le_co1 - 1
	STORE SUBSTR(soma,le_so,1)         TO B1 
	le_so = le_so - 1
	IF le_so = 0
	   le_so = LEN(soma)
	ENDIF    
	STORE INT(VAL(A1)) * INT(VAL(B1))  TO fim
	IF fim < 10
	   conta1 = conta1 + fim
	ELSE
	   *STORE ALLTRIM(STR(fim)) TO fim_st
	   *FOR a = 0 TO 2
	   *     STORE SUBSTR(fim_st,a,1) TO fim
	   *     STORE INT(VAL(fim))      TO fim
	        conta1 = conta1 + fim
	   *ENDFOR  
	ENDIF       
ENDFOR     
IF MOD(conta1,11) = 0 .or. MOD(conta1,11) = 10 .or. MOD(conta1,11) = 1
   dig = 1
ELSE
   STORE 11 - MOD(conta1,11) TO dig
ENDIF 

 RETURN(DIG)

ENDFUNC



FUNCTION arruma_valor(valor_mes)

					mvalorf = ""
					
					P1 = LEN(valor_mes)
					STORE SUBSTR(valor_mes,1,p1) TO vVALOR
					FOR I = 1 TO LEN(ALLTRIM(vVALOR))
					    IF SUBSTR(vVALOR,i,1)<>"." .and. SUBSTR(vVALOR,i,1)<>","
					       mvalorf = mvalorf + SUBSTR(vVALOR,i,1)
					    ENDIF
					ENDFOR
					le_co1 = LEN(mvalorf)
					IF LEN(mvalorf) = 10
					   STORE mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 9
					   STORE "0"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 8
					   STORE "00"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 7
					   STORE "000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 6
					   STORE "0000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 5
					   STORE "00000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 4
					   STORE "000000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 3
					   STORE "0000000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 2
					   STORE "00000000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) = 1
					   STORE "000000000"+mvalorf TO mvalorf
					ENDIF
					IF LEN(mvalorf) > 10
					   STORE "0000000000" TO mvalorf
					ENDIF

RETURN(mvalorf)

ENDFUNC 


*-----------------------------------------------------------------------------* 
FUNCTION TiraAcento(tcStringInput) 
*-----------------------------------------------------------------------------* 
*1) Indexe tirando o acento do campo. Ex.: TiraAcento(nm_empresa) 
*2) Procure tirando, tambÈm, o acento da chave de pesquisa. Ex.: SEEK 
*TiraAcento(lcNomedaEmpresa)

LOCAL lcStringFilterIn, lcStringFilterOut, lcStringOutput 
lcStringFilterIn = "¡…Õ”⁄·ÈÌÛ˙¿»Ã“Ÿ‡ËÏÚ˘¬ Œ‘€‚ÍÓÙ˚ƒÀœ÷‹‰ÎÔˆ¸√’„ı«Á—Ò∫" 
lcStringFilterOut = "AEIOUaeiouAEIOUaeiouAEIOUaeiouAEIOUaeiouAOaoCcNno" 
lcStringOutput = CHRTRAN(tcStringInput, lcStringFilterIn, lcStringFilterOut) 
RETURN (lcStringOutput) 

ENDFUNC
