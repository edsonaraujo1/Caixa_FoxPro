<<<<<<< HEAD
***
*  Programador..: Edson de Araujo
*  Programador..: Charles C. Camargo Jr
*  Finalidade...: Inicialização dos Eventos e Ambiente
*  Sistema......: Sindicato dos Empregados de Edificios de São Paulo
*  
*  Inicio Programa.:  15/11/1999
*  Ultima Alteração.: 22/11/2011
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 8.0
*
*  " Deus seja Louvado "
*
***

PUBLIC acess_pro, fazer_00, ultialt, contador, cTitulo, Nome_1, nre_us, aSenha, acesso, musuario, msenha, permi_1, ;
cod_mo_1, cod_mo_2, cod_mo_3, cod_mo_4, cod_mo_5, cod_mo_6, cod_mo_7, cod_mo_8, cod_mo_9, cod_mo_10, ;
cod_mo_11, cod_mo_12, cod_mo_13, cod_mo_14, cod_mo_15, cod_mo_16, cod_mo_17, cod_mo_18, cod_mo_19, cod_mo_20, ;
cod_mo_21, cod_mo_22, cod_mo_23, cod_mo_24, cod_mo_25, cod_mo_26, cod_mo_27, cod_mo_28, cod_mo_29, cod_mo_30, ;
cod_mo_31, cod_mo_32, cod_mo_33, cod_mo_34, cod_mo_35, cod_mo_36, cod_mo_37, cod_mo_38, cod_mo_39, cod_mo_40, ;
cod_mo_41, cod_mo_42, cod_mo_43, cod_mo_44, cod_mo_45, cod_mo_46, cod_mo_47, cod_mo_48, cod_mo_49, cod_mo_50, ;
cod_mo_51, cod_mo_52, cod_mo_53, cod_mo_54, cod_mo_55, cod_mo_56, cod_mo_57, cod_mo_58, cod_mo_59, cod_mo_60, ;
cod_mo_61, cod_mo_62, cod_mo_63, cod_mo_64, cod_mo_65, cod_mo_66, cod_mo_67, cod_mo_68, cod_mo_69, cod_mo_70, ;
cod_mo_71, cod_mo_72, cod_mo_73, cod_mo_74, cod_mo_75, cod_mo_76, cod_mo_77, cod_mo_78, cod_mo_79, cod_mo_80, ;
cod_mo_81, cod_mo_82, cod_mo_83, cod_mo_84, cod_mo_85, cod_mo_86, cod_mo_87, cod_mo_88, cod_mo_89, cod_mo_90, ;
cod_mo_91, cod_mo_92, cod_mo_93, cod_mo_94, cod_mo_95, cod_mo_96, cod_mo_97, cod_mo_98, cod_mo_99, cod_mo_100, ;
cod_mo_101, cod_mo_102, cod_mo_103, cod_mo_104, cod_mo_105, cod_mo_106, cod_mo_107, cod_mo_108, cod_mo_109, cod_mo_110, ;
cod_mo_111, cod_mo_112, cod_mo_113, cod_mo_114, cod_mo_115, cod_mo_116, cod_mo_117, cod_mo_118, cod_mo_119, cod_mo_120, ;
cod_mo_121, cod_mo_122, cod_mo_123, cod_mo_124, cod_mo_125, cod_mo_126, cod_mo_127, cod_mo_128, cod_mo_129, cod_mo_130, ;
cod_mo_131, cod_mo_132, cod_mo_133, cod_mo_134, cod_mo_135, cod_mo_136, cod_mo_137, cod_mo_138, cod_mo_139, cod_mo_140, ;
cod_mo_141, cod_mo_142, cod_mo_143, cod_mo_144, cod_mo_145, cod_mo_146, cod_mo_147, cod_mo_148, cod_mo_149, cod_mo_150, ;
cod_mo_151, cod_mo_152, cod_mo_153, cod_mo_154, cod_mo_155, cod_mo_156, cod_mo_157, cod_mo_158, cod_mo_159, cod_mo_160, ;
cod_mo_161, cod_mo_162, cod_mo_163, cod_mo_164, cod_mo_165, cod_mo_166, cod_mo_167, cod_mo_168, cod_mo_169, cod_mo_170, ;
cod_mo_171, cod_mo_172, cod_mo_173, cod_mo_174, cod_mo_175, cod_mo_176, cod_mo_177, cod_mo_178, cod_mo_179, cod_mo_180, ;
cod_mo_181, cod_mo_182, cod_mo_183, cod_mo_184, cod_mo_185, cod_mo_186, cod_mo_187, cod_mo_188, cod_mo_189, cod_mo_190, ;
cod_mo_191, cod_mo_192, cod_mo_193, cod_mo_194, cod_mo_195, cod_mo_196, cod_mo_197, cod_mo_198, cod_mo_199, cod_mo_200, ;
cod_mo_201, cod_mo_202, cod_mo_203, cod_mo_204, cod_mo_205, cod_mo_206, cod_mo_207, cod_mo_208, cod_mo_209, cod_mo_210, ;
cod_mo_211, cod_mo_212, txt_Data, i_Text32, i_Text64, i_Text96, i_Text128, i_Text160, i_Text192, i_Text224, i_Text256, i_Text288, ;
i_Text320, i_Text352, He, Wi, FIN, to_rec_1, to_rec_2, to_rec_3, to_rec_4, to_rec_5, to_rec_6, to_rec_7, to_rec_8, to_rec_9, ;
to_rec_10, to_rec_11, iCheck, rr_soc, rr_cod, rr_nu, ref_x, Cod_Barras, Opcao, titulo_x, Faz, confcod, semana_xfim, i, i_numero, ;
i_operadora, soma_x, txt_data, semana_x0, semana_x1, semana_x2, semana_x3, semana_x4, semana_x5, semana_x6, semana_x0, ass_rg, ;
GPS, ativa_mensagem, q_faz_oque, rr_edif1, ii_edi1, ii_edi2, ii_edi3, ii_Adm1, ii_Adm2, ii_Adm3, ii_soc1, ii_soc2, ii_soc3, ii_permi2, ;
ii_opo1, ii_opo2, ii_opo3, privStrConexao,privConexao,cTitulo,atu_ali_za,iv_totx,iv_uni,i_numero,i_nome,i_tipo,i_mes,i_vencimento, ;
i_apagar,i_pago,ii_cont,iivalor1,ii_tipo, linha12, linha13, i_nome, i_nome_soc, ii_nome_soc, im_numero, im_cnpj, im_nome, im_tipo, ;
im_mes, im_vencimento, im_valor, im_correcao, im_multa, im_juros, im_apagar, im_mensage_1, serv_1, ipserver

nre_us  = " "

atu_ali_za = "Atualizado: 04/02/2019"

*ipserver = "191.255.225.238"

*ipserver = "200.161.185.83"

ipserver = "192.168.1.85"

*ipserver = "localhost"

PUBLIC ipsqlserv
ipsqlserv = "192.168.1.85"

SET STATUS OFF
SET SYSMENU OFF 
SET STATUS BAR OFF
_screen.TitleBar = 0
_screen.AutoCenter = .T.
_screen.Height = 10
_screen.Width  = 10
_screen.BackColor = 9400918

SET PROCEDURE  TO functions.prg
SET TALK       OFF 
SET BRSTATUS   OFF
SET STATUS     OFF   
set console    OFF
set echo       OFF
SET DATE BRITISH 
Set Century    On
Set Lock       OFF
Set Multilocks ON  
Set Ansi       Off
Set Confirm    Off
Set Notify     Off
Set Hours      TO 24
SET REPROCESS  TO AUTOMATIC 
Set Exclusive  Off
Set Safety     Off
SET BELL       off
Set Clock      Off
SET CPDIALOG   Off
SET DELETED    ON   

Nome_1   = "Sys Caixa"
cTitulo  = "Sindificios"

Local lnWinHandle
Declare Integer FindWindow In Win32API Integer, String 
lnWinHandle = FindWindow( 0, Nome_1)
If lnWinHandle # 0
_screen.Caption = "Sys Caixa" 
=Messagebox( "O aplicativo já está sendo executado!", 16, cTitulo)
Cancel
Endif

_screen.Caption = "Sys Caixa"
_screen.TitleBar = 0
_screen.WindowState = 2
_screen.ColorSource = 0
_screen.BackColor = 9400918
_screen.Picture = 'LOGO2.PNG'

ON SHUTDOWN QUIT

DO FORM Caixa.scx
READ events
_screen.BackColor = 9400918
=======
***
*  Programador..: Edson de Araujo
*  Programador..: Charles C. Camargo Jr
*  Finalidade...: InicializaÃ§Ã£o dos Eventos e Ambiente
*  Sistema......: Sindicato dos Empregados de Edificios de SÃ£o Paulo
*  
*  Inicio Programa.:  15/11/1999
*  Ultima AlteraÃ§Ã£o.: 22/11/2011
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 8.0
*
*  " Deus seja Louvado "
*
***

PUBLIC acess_pro, fazer_00, ultialt, contador, cTitulo, Nome_1, nre_us, aSenha, acesso, musuario, msenha, permi_1, ;
cod_mo_1, cod_mo_2, cod_mo_3, cod_mo_4, cod_mo_5, cod_mo_6, cod_mo_7, cod_mo_8, cod_mo_9, cod_mo_10, ;
cod_mo_11, cod_mo_12, cod_mo_13, cod_mo_14, cod_mo_15, cod_mo_16, cod_mo_17, cod_mo_18, cod_mo_19, cod_mo_20, ;
cod_mo_21, cod_mo_22, cod_mo_23, cod_mo_24, cod_mo_25, cod_mo_26, cod_mo_27, cod_mo_28, cod_mo_29, cod_mo_30, ;
cod_mo_31, cod_mo_32, cod_mo_33, cod_mo_34, cod_mo_35, cod_mo_36, cod_mo_37, cod_mo_38, cod_mo_39, cod_mo_40, ;
cod_mo_41, cod_mo_42, cod_mo_43, cod_mo_44, cod_mo_45, cod_mo_46, cod_mo_47, cod_mo_48, cod_mo_49, cod_mo_50, ;
cod_mo_51, cod_mo_52, cod_mo_53, cod_mo_54, cod_mo_55, cod_mo_56, cod_mo_57, cod_mo_58, cod_mo_59, cod_mo_60, ;
cod_mo_61, cod_mo_62, cod_mo_63, cod_mo_64, cod_mo_65, cod_mo_66, cod_mo_67, cod_mo_68, cod_mo_69, cod_mo_70, ;
cod_mo_71, cod_mo_72, cod_mo_73, cod_mo_74, cod_mo_75, cod_mo_76, cod_mo_77, cod_mo_78, cod_mo_79, cod_mo_80, ;
cod_mo_81, cod_mo_82, cod_mo_83, cod_mo_84, cod_mo_85, cod_mo_86, cod_mo_87, cod_mo_88, cod_mo_89, cod_mo_90, ;
cod_mo_91, cod_mo_92, cod_mo_93, cod_mo_94, cod_mo_95, cod_mo_96, cod_mo_97, cod_mo_98, cod_mo_99, cod_mo_100, ;
cod_mo_101, cod_mo_102, cod_mo_103, cod_mo_104, cod_mo_105, cod_mo_106, cod_mo_107, cod_mo_108, cod_mo_109, cod_mo_110, ;
cod_mo_111, cod_mo_112, cod_mo_113, cod_mo_114, cod_mo_115, cod_mo_116, cod_mo_117, cod_mo_118, cod_mo_119, cod_mo_120, ;
cod_mo_121, cod_mo_122, cod_mo_123, cod_mo_124, cod_mo_125, cod_mo_126, cod_mo_127, cod_mo_128, cod_mo_129, cod_mo_130, ;
cod_mo_131, cod_mo_132, cod_mo_133, cod_mo_134, cod_mo_135, cod_mo_136, cod_mo_137, cod_mo_138, cod_mo_139, cod_mo_140, ;
cod_mo_141, cod_mo_142, cod_mo_143, cod_mo_144, cod_mo_145, cod_mo_146, cod_mo_147, cod_mo_148, cod_mo_149, cod_mo_150, ;
cod_mo_151, cod_mo_152, cod_mo_153, cod_mo_154, cod_mo_155, cod_mo_156, cod_mo_157, cod_mo_158, cod_mo_159, cod_mo_160, ;
cod_mo_161, cod_mo_162, cod_mo_163, cod_mo_164, cod_mo_165, cod_mo_166, cod_mo_167, cod_mo_168, cod_mo_169, cod_mo_170, ;
cod_mo_171, cod_mo_172, cod_mo_173, cod_mo_174, cod_mo_175, cod_mo_176, cod_mo_177, cod_mo_178, cod_mo_179, cod_mo_180, ;
cod_mo_181, cod_mo_182, cod_mo_183, cod_mo_184, cod_mo_185, cod_mo_186, cod_mo_187, cod_mo_188, cod_mo_189, cod_mo_190, ;
cod_mo_191, cod_mo_192, cod_mo_193, cod_mo_194, cod_mo_195, cod_mo_196, cod_mo_197, cod_mo_198, cod_mo_199, cod_mo_200, ;
cod_mo_201, cod_mo_202, cod_mo_203, cod_mo_204, cod_mo_205, cod_mo_206, cod_mo_207, cod_mo_208, cod_mo_209, cod_mo_210, ;
cod_mo_211, cod_mo_212, txt_Data, i_Text32, i_Text64, i_Text96, i_Text128, i_Text160, i_Text192, i_Text224, i_Text256, i_Text288, ;
i_Text320, i_Text352, He, Wi, FIN, to_rec_1, to_rec_2, to_rec_3, to_rec_4, to_rec_5, to_rec_6, to_rec_7, to_rec_8, to_rec_9, ;
to_rec_10, to_rec_11, iCheck, rr_soc, rr_cod, rr_nu, ref_x, Cod_Barras, Opcao, titulo_x, Faz, confcod, semana_xfim, i, i_numero, ;
i_operadora, soma_x, txt_data, semana_x0, semana_x1, semana_x2, semana_x3, semana_x4, semana_x5, semana_x6, semana_x0, ass_rg, ;
GPS, ativa_mensagem, q_faz_oque, rr_edif1, ii_edi1, ii_edi2, ii_edi3, ii_Adm1, ii_Adm2, ii_Adm3, ii_soc1, ii_soc2, ii_soc3, ii_permi2, ;
ii_opo1, ii_opo2, ii_opo3, privStrConexao,privConexao,cTitulo,atu_ali_za,iv_totx,iv_uni,i_numero,i_nome,i_tipo,i_mes,i_vencimento, ;
i_apagar,i_pago,ii_cont,iivalor1,ii_tipo, linha12, linha13, i_nome, i_nome_soc, ii_nome_soc, im_numero, im_cnpj, im_nome, im_tipo, ;
im_mes, im_vencimento, im_valor, im_correcao, im_multa, im_juros, im_apagar, im_mensage_1, serv_1, ipserver

nre_us  = " "

atu_ali_za = "Atualizado: 04/02/2019"

*ipserver = "191.255.999.999"

*ipserver = "200.161.999.999"

ipserver = "192.168.000.999"

*ipserver = "localhost"

PUBLIC ipsqlserv
ipsqlserv = "192.168.999.999"

SET STATUS OFF
SET SYSMENU OFF 
SET STATUS BAR OFF
_screen.TitleBar = 0
_screen.AutoCenter = .T.
_screen.Height = 10
_screen.Width  = 10
_screen.BackColor = 9400918

SET PROCEDURE  TO functions.prg
SET TALK       OFF 
SET BRSTATUS   OFF
SET STATUS     OFF   
set console    OFF
set echo       OFF
SET DATE BRITISH 
Set Century    On
Set Lock       OFF
Set Multilocks ON  
Set Ansi       Off
Set Confirm    Off
Set Notify     Off
Set Hours      TO 24
SET REPROCESS  TO AUTOMATIC 
Set Exclusive  Off
Set Safety     Off
SET BELL       off
Set Clock      Off
SET CPDIALOG   Off
SET DELETED    ON   

Nome_1   = "Sys Caixa"
cTitulo  = "Sindificios"

Local lnWinHandle
Declare Integer FindWindow In Win32API Integer, String 
lnWinHandle = FindWindow( 0, Nome_1)
If lnWinHandle # 0
_screen.Caption = "Sys Caixa" 
=Messagebox( "O aplicativo jÃ¡ estÃ¡ sendo executado!", 16, cTitulo)
Cancel
Endif

_screen.Caption = "Sys Caixa"
_screen.TitleBar = 0
_screen.WindowState = 2
_screen.ColorSource = 0
_screen.BackColor = 9400918
_screen.Picture = 'LOGO2.PNG'

ON SHUTDOWN QUIT

DO FORM Caixa.scx
READ events
_screen.BackColor = 9400918
>>>>>>> 0d3b0aeff06732e22189ca204d2d91585a02ea01
