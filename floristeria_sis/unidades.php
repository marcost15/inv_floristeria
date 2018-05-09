<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_verificar_privilegios.php';
include './modelo/bd_obt_unidades.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('unidades.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}

if(isset($_REQUEST))
{
	switch($_REQUEST['func'])
	{
		case 'delete':
			enviar_sql("DELETE FROM unidades WHERE id = '$_REQUEST[id]' LIMIT 1;");
			ir('unidades.php');
			break;
	}
}

$f1=new dbFormHandler('unidades',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->setConnectionResource($link,'unidades','mysql');
$f1->borderStart('Agregar/Modificar Unidades');
$f1->textField('Unidades','nombre',FH_NOT_EMPTY,30,255,"onkeyup=\"unidades.nombre.value=unidades.nombre.value.toUpperCase();\"");
$f1->setHelpText('nombre','Por Favor Introduzca el nombre de la  Unidad de Medida');
$f1->submitButton('Continuar','continuar');
$f1->borderStop();
$f1->onSaved('mensaje');

function mensaje($id,$d)
{
    $_SESSION['mensaje']="UNIDAD DE MEDIDA PROCESADA CORRECTAMENTE";
	ir('unidades.php');
}
$ip->assign('unidades',bd_obt_unidades());
$ip->assign('f1',$f1->flush(true));
$ip->disp();
unset($_SESSION['mensaje']);