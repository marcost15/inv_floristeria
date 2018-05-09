<?php
session_start();
include './configs/smarty.php';
include './configs/bd.php';
include './configs/fh3.php';
include './configs/funciones.php';
include './modelo/bd_buscar_pedidos.php';
include './modelo/bd_obt_personal_nombre.php';
include './modelo/bd_obt_clientes.php';
include './modelo/bd_obt_articulosconcat.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('rp_cons_pedidos.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
if (isset($_REQUEST['pos']))
  $inicio=$_REQUEST['pos'];
else $inicio=0;
$delta=$_SESSION['ini']['global']['delta'];
$n=sql2value("SELECT COUNT(*) FROM pedidos");
$indice=array();
$li=0;
while($li<$n)
{
	$ls=$li+$delta-1;
	if($ls>$n)
	{
		$ls=$n;
	}
	$indice[]=array('li'=>$li,'ls'=>$ls);
	$li=$ls+1;
}
$pedidos = bd_buscar_pedidos($_REQUEST['li']);
foreach ($pedidos as $i=>$c)
{
	$a = $pedidos[$i]['personal_id'];
	$b = $pedidos[$i]['cliente_id'];
	$pedidos[$i]['personal_id'] = bd_obt_personal_nombre($a);
	$pedidos[$i]['cliente_id'] = bd_obt_clientes($b);
	$pedidos[$i]['fecha'] = f2f($pedidos[$i]['fecha']);
}
$ip->assign('n',$n);
$ip->assign('indice',$indice);
$ip->assign('datos',$pedidos);
$ip->disp();