CLEAR 
PUBLIC privStrConexao, privConexao
SET STEP ON 

privStrConexao="DRIVER=MySQL ODBC 3.51 Driver;" +; 
"SERVER=192.168.1.100;" +; 
"UID=root;" +; 
"PWD=12345;" +; 
"DATABASE=bancodados;" +; 
"WSID="+Substr(Sys(0),1,Atc(Sys(0),"#")-1)+";" 

privConexao = Sqlstringconnect(privStrConexao) 


STORE ALLTRIM("fernanda") TO a_Operadora
STORE 15-LEN(a_Operadora)                  TO NO_1
STORE a_Operadora+SPACE(NO_1)              TO FIN
STORE FIN 							       TO iope
i_sys_data  = "25/04/2008"
i_qtdest    = 3
inov        = 1

*SQLexec(privConexao,'Select * from estorno WHERE operadora = ?iope and data = ?i_sys_data',"estorno")


SQLexec(privConexao,'SELECT * FROM caixa WHERE operadora = ?iope AND tipo_mov = ?inov AND data = ?i_sys_data',"caixa")

SUM vlr_tot TO ifim

? transform(ifim, "99,999,999.99")

brow

