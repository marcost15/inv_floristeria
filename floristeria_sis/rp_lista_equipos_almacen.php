<?php
session_start();
include './configs/smarty.php';
include './configs/bd.php';
include './configs/fh3.php';
include './configs/funciones.php';
include './modelo/bd_obt_articulosconcat.php';
include './modelo/bd_lista_articulos.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('rp_lista_equipos_almacen.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
if (isset($_REQUEST['pos']))
  $inicio=$_REQUEST['pos'];
else $inicio=0;
$delta=$_SESSION['ini']['global']['delta'];
$n=sql2value("SELECT COUNT(*) FROM articulos_entradas
							WHERE articulo_id >= 1  ORDER BY articulo_id");
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

function bd_buscar_equipos_almacen($li)
{
    $delta=$_SESSION['ini']['global']['delta'];
	if ($li!='')
	{
		$limite=" LIMIT $li, $delta";
	}
	else
	{
		$limite=" LIMIT 0, $delta";
	}	
	if (isset($_REQUEST['accion']))
	{ 
		$limite='';
	}	
$sql = "SELECT articulos.descripcion, art_existencia.cant, tipos_articulos.nombre FROM art_existencia INNER JOIN articulos ON 
        art_existencia.articulo_id = articulos.id INNER JOIN tipos_articulos ON tipos_articulos.id = articulos.tipo_id ORDER BY descripcion ASC "."$limite";
	return sql2array($sql);
}

$almacenados = bd_buscar_equipos_almacen($_REQUEST['li']);

foreach ($almacenados as $i=>$c)
{
	$a = $almacenados[$i][articulo_id];
	$almacenados[$i]['articulo_id'] = bd_obt_articulosconcat($a);
}
$a = '0';
$ip->assign('a',$a);
$ip->assign('n',$n);
$ip->assign('indice',$indice);
$ip->assign('datos',$almacenados);
$ip->disp();