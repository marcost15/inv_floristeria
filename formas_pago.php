<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_obt_formas_pago.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('formas_pago.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}

if(isset($_REQUEST))
{
	switch($_REQUEST['func'])
	{
		case 'delete':
			enviar_sql("DELETE FROM formas_pagos WHERE id = '$_REQUEST[id]' LIMIT 1;");
			ir('formas_pago.php');
			break;
	}
}


$f1=new dbFormHandler('bancos',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->setConnectionResource($link,'formas_pagos','mysql');
$f1->borderStart('Agregar/Modificar Formas de Pago');
$f1->textField('Nombre','nombre',FH_NOT_EMPTY,30,255,"onkeyup=\"bancos.nombre.value=bancos.nombre.value.toUpperCase();\"");
$f1->setHelpText('nombre','Por Favor Introduzca la forma de pago');
$f1->submitButton('Continuar','continuar');
$f1->borderStop();
$f1->onSaved('mensaje');

function mensaje($id,$d)
{
    $_SESSION['mensaje']="FORMA DE PAGO PROCESADA CORRECTAMENTE";
	ir('formas_pago.php');
}
$ip->assign('formas_pagos',bd_obt_formas_pago());
$ip->assign('f1',$f1->flush(true));
$ip->disp();
unset($_SESSION['mensaje']);