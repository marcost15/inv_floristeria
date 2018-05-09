<?php
session_start();
include './configs/smarty.php';
include './configs/bd.php';
include './configs/fh3.php';
include './configs/funciones.php';
include './modelo/bd_obt_articulosconcat.php';
include './modelo/bd_obt_personal.php';
include './modelo/bd_obt_clientes.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('rp_detalle_pedidos.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
$id = $_REQUEST['id'];
	$pedido= sql2row("SELECT fecha, personal_id, cliente_id,observacion FROM pedidos WHERE id = '$id'");
	$pedido['personal_id'] = bd_obt_personal($pedido['personal_id']);
	$pedido['cliente_id'] = bd_obt_clientes($pedido['cliente_id']);
	$articulo= sql2array("SELECT articulo_id FROM pedidos_articulos WHERE pedido_id = '$id'");
	foreach ($articulo as $i=>$c)
	{
		$articulo[$i]['articulo_id'] = bd_obt_articulosconcat($articulo[$i]['articulo_id']);
	}
$ip->assign('id',$id);
$ip->assign('indice',$indice);
$ip->assign('datos',$articulo);
$ip->assign('pedido',$pedido);
$ip->assign('fondoreporte',$fondo);
$ip->disp();