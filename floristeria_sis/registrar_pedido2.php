<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_guardar_pedido.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('registrar_pedido2.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
bd_guardar_pedido($_SESSION['entrada1'],$_SESSION['equipos1']);
unset($_SESSION['entrada1']);
unset($_SESSION['equipos1']);
unset($_SESSION['total']);
$ip->disp();