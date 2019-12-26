
clear
txtBarras = "00191461800000008000000001449863004609210518"

STORE SUBSTR(txtBarras,10,10) TO txt_Bar_val_1  && Valor da quia
STORE SUBSTR(txtBarras,26,7)  TO txt_Bar_tip_1  && Tipo Cobranca


STORE SUBSTR(txtBarras,34,6)  TO txt_Bar_cod_1  && Codigo do Socio
STORE SUBSTR(txtBarras,40,1)  TO txt_Bar_cnu_1  && Complemento do Codigo

IF txt_Bar_cnu_1 = "1"
   comple_x = "A"
ENDIF 
IF txt_Bar_cnu_1 = "2"
   comple_x = "B"
ENDIF 
IF txt_Bar_cnu_1 = "3"
   comple_x = "C"
ENDIF 
IF txt_Bar_cnu_1 = "4"
   comple_x = "D"
ENDIF 
IF txt_Bar_cnu_1 = "5"
   comple_x = "E"
ENDIF 

STORE SUBSTR(txtBarras,41,2)  TO txt_Bar_mes_1  && mes de pagto
STORE SUBSTR(txtBarras,6,4)   TO txt_Bar_fat_v  && Vencimento

datad = CTOD("07/10/1997") + VAL(txt_Bar_fat_v)
STORE DTOC(datad)                        TO datax 
STORE SUBSTR(datax,4,7)                  TO dataz

? "Valor " + txt_Bar_val_1
? "tipo Conta " + txt_Bar_tip_1
? "Vator " + txt_Bar_fat_v
? "vencimento " + datax
? "mes e ano " + dataz
? "Codigo Socio " + txt_Bar_cod_1 + comple_x
Valor1 = SUBSTR(txt_Bar_val_1,9,2)
Valor2 = SUBSTR(txt_Bar_val_1,1,8)
Valor_f = ALLTRIM(Valor2 + "." + Valor1)
? "Valor Final " + VAL(INT(Valor_f)))