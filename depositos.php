<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_verificar_privilegios.php';
include './modelo/bd_obt_depositos.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('depositos.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
if(isset($_REQUEST))
{
	switch($_REQUEST['func'])
	{
		case 'delete':
			enviar_sql("DELETE FROM depositos WHERE id = '$_REQUEST[id]' LIMIT 1;");
			ir('depositos.php');
			break;
	}
}
$f1=new dbFormHandler('depositos',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->setConnectionResource($link,'depositos','mysql');
$f1->borderStart('Agregar/Modificar Depositos');
$f1->textField('Deposito','nombre',FH_NOT_EMPTY,30,255,"onkeyup=\"depositos.nombre.value=depositos.nombre.value.toUpperCase();\"");
$f1->setHelpText('nombre','Por Favor Introduzca el nombre del deposito');
$f1->submitButton('Continuar','continuar');
$f1->borderStop();
$f1->onSaved('mensaje');

function mensaje($id,$d)
{
    $_SESSION['mensaje']="DEPOSITO PROCESADO CORRECTAMENTE";
	ir('depositos.php');
}
$ip->assign('depositos',bd_obt_depositos());
$ip->assign('f1',$f1->flush(true));
$ip->disp();
unset($_SESSION['mensaje']);