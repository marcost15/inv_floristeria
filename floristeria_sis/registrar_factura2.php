<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_guardar_factura.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('registrar_factura2.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
bd_guardar_factura($_SESSION['factura'],$_SESSION['equipos'],$_SESSION['costo_final']);
unset($_SESSION['factura']);
unset($_SESSION['equipos']);
unset($_SESSION['total']);
unset($_SESSION['costo_final']);
$ip->disp();