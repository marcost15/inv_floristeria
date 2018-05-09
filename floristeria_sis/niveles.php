<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_obt_niveles.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('niveles.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
if(isset($_REQUEST))
{
	switch($_REQUEST['func'])
	{
		case 'delete':
			enviar_sql("DELETE FROM niveles WHERE id = '$_REQUEST[id]' LIMIT 1;");
			ir('niveles.php');
			break;
	}
}

$f1=new dbFormHandler('accesos',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->setConnectionResource($link,'niveles','mysql');
$f1->borderStart('Agregar/Modificar tipos de Accesos');
$f1->textField('Nivel de Acceso al Sistema','nombre',FH_NOT_EMPTY,30,255,"onkeyup=\"accesos.nombre.value=accesos.nombre.value.toUpperCase();\"");
$f1->setHelpText('nombre','Por Favor Introduzca el Tipo de Acceso al Sistema');
$f1->submitButton('Continuar','continuar');
$f1->borderStop();
$f1->onSaved("mensaje");

function mensaje()
{
   	$_SESSION['mensaje']="EL NIVEL SE REGISTRO CORRECTAMENTE";
	ir("niveles.php");
}
$ip->assign('niveles',bd_obt_niveles());
$ip->assign('f1',$f1->flush(true));
$ip->disp();
unset($_SESSION['mensaje']);