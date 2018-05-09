<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_lista_personal.php';
include './modelo/bd_lista_cliente_proveedor.php';
include './modelo/bd_lista_forma_pago.php';
include './modelo/bd_guardar_pagos.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('registrar_pagos.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}

$foto = array(
  "path"        => './upload/pagos',
  "type" 	=> "JPG jpg JPEG jpeg GIF gif PNG png BMP bmp",
  "required"    => false,
  "exists"      => "overwrite"
);
$tipo = array(
'PROVEEDOR' => 'PROVEEDOR',
'CLIENTE' => 'CLIENTE'
);
$f1=new FormHandler('pagos',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$star = '<font color="blue">*</font>';
$f1->borderStart('Agregar Pagos');
$f1->textField($star.'Nro de Factura','nro_factura',FH_DIGIT,15,15, "onkeyup=\"return ValNumero(this);\"");
$f1->selectField($star."Personal", "personal_id",bd_lista_personal(),FH_NOT_EMPTY,true);
$f1->selectField($star."Forma de Pago", "forma_id",bd_lista_forma_pago(),FH_NOT_EMPTY,true);
$f1->selectField($star."Tipo", "tipo",$tipo,FH_NOT_EMPTY,true);
$f1->selectField("Cliente o proveedor", "cli_prov_id",bd_lista_cliente_proveedor(),FH_NOT_EMPTY,true);
$f1->textField('Monto','monto',FH_FLOAT,10,20);
$f1->uploadField('Scaneo', 'pago', $foto);
$f1->addLine($star ." = Campos Requeridos Obligatoriamente");
$f1->setMask(
   " <tr>\n".
   "   <td> </td>\n".
   "   <td> </td>\n".
   "   <td>%field% %field%</td>\n".
   " </tr>\n"
);
$f1->submitButton('Registrar','registrar');
$f1->resetButton();
$f1->borderStop();
$f1->onCorrect("procesar");

function procesar($d)
{
	bd_guardar_pagos($d);
	$_SESSION['mensaje']="PAGO PROCESADO CORRECTAMENTE";
	ir('registrar_pagos.php');
}
$ip->assign('f1',$f1->flush(true));
$ip->disp();
unset($_SESSION['mensaje']);