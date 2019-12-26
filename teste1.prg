PUBLIC privStrConexao,privConexao,cTitulo

SET DATE BRITISH 
Set Century    On

cTitulo = "ahhhhh"
i_opera_dor  = "LOARD"
i_sys_data = "07/05/2008"
TXT_SOMA   = 0

STORE ALLTRIM(i_opera_dor) TO a_Operadora
STORE 15-LEN(a_Operadora)                  TO NO_1
STORE a_Operadora+SPACE(NO_1)              TO FIN
STORE FIN 							       TO i_opera_dor

privStrConexao="DRIVER=MySQL ODBC 3.51 Driver;" +; 
"SERVER=192.168.1.100;" +; 
"UID=root;" +; 
"PWD=12345;" +; 
"DATABASE=bancodados;" +; 
"WSID="+Substr(Sys(0),1,Atc(Sys(0),"#")-1)+";" 

privConexao = Sqlstringconnect(privStrConexao) 
SET STEP ON 
txtCaixa = 1
ic_ti    = 69
Text78   = "C"
iope     = i_opera_dor
inu      = STR(txtCaixa,10)  && Numero de Caixa         
it_mov   = ic_ti && Codigo do Recebimento
it_m     = Text78 && Tipo de Moeda
idat     = dtoc(date()) && Data
ihora    = Time()
inome    = "Cancelamento"
iVcto    = "  /  /    "
iQtd     = 1
iv_tot   = 5.00

*            SQLexec(privConexao,'SELECT *  FROM caixa WHERE OPERADORA = ?iope  AND NUMERO = ?txtCaixa AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat',"caixa")
			
*			IF !EMPTY(operadora)
* ,cod_ti,nome,Vecto,Qtd,t_moeda,vlr_tot,data  // ,?ic_ti,?inome,?iVcto,?iQtd,?it_m,?iv_tot,?idat
	            cst=[insert into caixa(operadora,hora) values (?i_opera_dor,?ihora)] 
				= sqlsetprop(privConexao,'DispWarnings',.t.) 
				= SQLPREPARE(privConexao,cst,'rscaixa') 


*     			
*            SQLexec(privConexao,'SELECT *  FROM caixa WHERE OPERADORA = ?iope AND NUMERO = ?txtCaixa AND TIPO_MOV = ?Text75 AND T_MOEDA = ?it_m AND DATA = ?idat',"caixa")
			
*			IF !EMPTY(operadora)
*			Thisform.label1.Caption =  STR(vlr_tot)
			
			   ********************************
			   *   Rotina para Cancelamento   *
			   ********************************
 
* 			   iope     = ThisForm.txtOperadora.Value
*			   it_mov   = STR(ThisForm.Text75.Value,16) && Codigo do Recebimento
*			   it_m     = ThisForm.Text78.Value && Tipo de Moeda
*			   idat     = dtoc(date()) && Data
*		       txtCaixa = 1

*              Nqtd     = 1
*               Nvlr_tot = ThisForm.Text76.Value 

*                    update caixa set Qtd=Qtd-1, vlr_tot=vlr_tot-?Nvlr_tot WHERE     OPERADORA = ?iope  AND NUMERO = ?txtCaixa AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat

*			   cst=[update caixa set Qtd=Qtd-1, vlr_tot=vlr_tot-?Nvlr_tot WHERE     OPERADORA = ?iope  AND NUMERO = ?txtCaixa AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat]
*			   = sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
*			   = SQLPREPARE(privConexao,cst,'rscaixa') 
*			   = SQLEXEC(privConexao) 
*		    else
*		       Messagebox("Nao Achei !!!", cTitulo)
*			Endif	



*SQLexec(privConexao,'Select * from caixa WHERE OPERADORA = ?i_opera_dor AND DATA = ?i_sys_data',"caixa")

*		      iope   = i_opera_dor
*			  inu    = 1
*			  it_mov = '1'
*			  it_m   = 'D'
*			  idat   = "25/04/2008"
*			  iVto   = " "
*			  iQtd   = 3
*			  iv_tot = 16.00
*			  ihora  = TIME()   
*operadora = ""


*SQLexec(privConexao,'SELECT *  FROM receb_1 WHERE OPERADORA = ?iope  AND NUMERO = ?inu AND DATA = ?idat',"receb_1")

*? operadora
*? numero
*? data

*If EMPTY(operadora)


*ELSE

*iQtdz   = QTD + iQtd         && Soma Quantidade
*iv_totz = vlr_tot + iv_tot   && Soma Valor Total
*cst=[update receb_1 set Qtd=?iQtdz, vlr_tot=?iv_totz WHERE OPERADORA = ?iope  AND NUMERO = ?inu AND DATA = ?idat]
*= sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
*= SQLPREPARE(privConexao,cst,'rsreceb_1') 
*= SQLEXEC(privConexao) 

*ENDIF 

              
*SQLexec(privConexao,'SELECT *  FROM caixa                        WHERE OPERADORA = ?iope AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat',"caixa")


*idat = dtoc(DATE())
*iVto = "30/04/2011"

*cst=[UPDATE caixa SET DATA=?idat, VECTO=?iVto, HORA=?ihora QTD=+2 WHERE OPERADORA = ?iope AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat] 
* AND NUMERO = ?inu AND TIPO_MOV = ?it_mov  AND T_MOEDA = ?it_m AND DATA = ?idat
* AND HORA=?ihora  AND VLR_UNI=0 AND QTD=0 AND VLR_TOT=0 AND MES=0 AND ANO=0 AND NOME=" " AND COD_TI=" "

*cst=[update caixa set (data = ?idat) WHERE OPERADORA = ?iope] 
*                  (?iope,?inu,?it_mov,?ihora,?ic_ti,?inome,?iVcto,?iQtd,?it_m,?iv_uni,?iv_tot,?idat)
*= sqlsetprop(privConexao,'DispWarnings',.t.)                                                                                        
*= SQLPREPARE(privConexao,cst,'rscaixa') 
*= SQLEXEC(privConexao) 


*IF EMPTY(operadora)
   
*      =Messagebox("Codigo do Recebimento não Cadastrado", cTitulo)
*ENDIF 

*? operadora
*BROW

*SET STEP ON 
   *ThisForm.txtMov.Value = VLR_TOT
*? VLR_TOT
*? OPERADORA

*   do While .T.
*      TXT_SOMA = TXT_SOMA + vlr_tot
*      ? VLR_TOT
*      IF EOF()
*         EXIT DO
*      ELSE    
*         SKIP
*         LOOP
*      ENDIF    
*   Enddo   
   
*? TXT_SOMA   

*mCODIGO = 2
*i_sys_data = Dtoc(Date())
*i_sys_time = Time()

*i_txtqtd   = 10
*i_txtUnit  = 0
*i_txtTotal = 0
*i_txtChec  = "D"
*i_txtRec   = 1
*i_txtmensa = "mensalidade"
*i_mes      = 10
*i_ano      = 2008
*i_cod_ti   = 0
*i_nume_ch  = 0

