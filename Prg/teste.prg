<<<<<<< HEAD
****FUNCIONES SQL SERVER*****

PUBLIC conectar 
conectar="Driver={SQL Server};";
+"Server=192.168.1.85;";
+"Database=SWAGILEAMPR;";
+"uid=sa;"+"pwd=dx44l09x@;"
nu_conexion=sqlstringconnect(conectar)

WAIT WINDOW nu_conexion NOWAIT 
**** BUSCA SI EXISTE UN VALOR EN LA TABLA****


SQLexec(nu_conexion, "SELECT * FROM SWAT_SGS_MENSALIDADE_ASSOCIADO WHERE SGS_MEAS_UID = '04324352'")
		       
IF EMPTY(SGS_MEAS_UID)

	WAIT WINDOW "Não Achou!!! " NOWAIT 
	
ELSE
	Store "Achou!!!  " + STR(SGS_MEAS_UID)  TO aa_des 
	WAIT WINDOW aa_des NOWAIT
	
ENDIF 

=======
****FUNCIONES SQL SERVER*****

PUBLIC conectar 
conectar="Driver={SQL Server};";
+"Server=192.168.1.85;";
+"Database=SWAGILEAMPR;";
+"uid=sa;"+"pwd=dx44l09x@;"
nu_conexion=sqlstringconnect(conectar)

WAIT WINDOW nu_conexion NOWAIT 
**** BUSCA SI EXISTE UN VALOR EN LA TABLA****


SQLexec(nu_conexion, "SELECT * FROM SWAT_SGS_MENSALIDADE_ASSOCIADO WHERE SGS_MEAS_UID = '04324352'")
		       
IF EMPTY(SGS_MEAS_UID)

	WAIT WINDOW "Não Achou!!! " NOWAIT 
	
ELSE
	Store "Achou!!!  " + STR(SGS_MEAS_UID)  TO aa_des 
	WAIT WINDOW aa_des NOWAIT
	
ENDIF 

>>>>>>> 0d3b0aeff06732e22189ca204d2d91585a02ea01
