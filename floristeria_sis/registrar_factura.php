<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_lista_clientes.php';
include './modelo/bd_lista_articulosconcat.php';
include './modelo/bd_obt_personal.php';
include './modelo/bd_obt_clientes.php';
include './modelo/bd_verificar_privilegios.php';
include './modelo/bd_obt_articulosconcat.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('registrar_factura.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}

if(!isset($_REQUEST))
{
    unset($_SESSION['equipos']);
}
function totalizar()
{
    $total=0;
    foreach($_SESSION['equipos'] as $l)
    {
	$total+=$l['cantidad'];
	$total50+=$l['costo_total'];
    }
    $_SESSION['total']=$total;
	$_SESSION['costo_final']=$total50;
}
switch($_REQUEST['accion'])
{
	case 'eliminar':
		unset($_SESSION['equipos'][$_REQUEST['id']]);
		sort($_SESSION['equipos']);
		totalizar();
		ir('registrar_factura.php');
		break;
}
$condicion = array(
"CONTADO" => "CONTADO",
"CREDITO" => "CREDITO"
);

$f1=new FormHandler('salida',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->borderStart('Agregar Factura');
$f1->textField('Nro de factura','nrofactura',FH_DIGIT,10,10);
$f1->selectField("Cliente","cliente_id",bd_lista_clientes(),FH_NOT_EMPTY,true);
$f1->selectField("Condicion","condicion",$condicion,FH_NOT_EMPTY,true);
$f1->submitButton('Agregar');
$f1->borderStop();
$f1->onCorrect('proc_datos_salida');

$f2=new FormHandler('productos',NULL,'onclick="highlight(event)"');
$f2->setLanguage('es');
$f2->borderStart('Agregar Producto');
$f2->selectField("Articulo","articulo_id",bd_lista_articulosconcat(),FH_NOT_EMPTY,true);
$f2->textField('Cantidad','cantidad',FH_DIGIT,5,6);
$f2->setValue('cantidad',1);
$f2->submitButton('Agregar');
$f2->borderStop();
$f2->onCorrect('proc_datos_equipos');


function proc_datos_salida($d)
{
	$d['cliente_nombre'] = bd_obt_clientes($d['cliente_id']);
	$_SESSION['factura']=$d;
	return false;
 }
function proc_datos_equipos($d)
{
	$bloqueo = false;
	if(isset($_SESSION['equipos']))
	{
		$equipos1 = $_SESSION['equipos'];
		foreach($equipos1 as $i=>$m)
		{
			if($equipos1[$i]['articulo_id'] == $d['articulo_id'])
			{
				$bloqueo = true;
				$_SESSION['mensaje'] = "EL PRODUCTO YA SE ENCUENTRA EN LA LISTA... VERIFIQUE"; 
			}
		}			
	}
	if($bloqueo == false)
    {
		$articulo_id = $d['articulo_id'];
		$c = sql2value("SELECT cant FROM art_existencia WHERE articulo_id = '$articulo_id'");
		$cantidad = $d['cantidad'];
		if ($c < $cantidad)
		{
			$bloqueo = true;
			$_SESSION['mensaje'] = "NO HAY LA CANTIDAD DESEADA DE ESTE PRODUCTO"; 
			return false;
		}
	else
		{
	    $d['articulo_nombre'] = bd_obt_articulosconcat($d['articulo_id']);
		$arti_id50 = $d['articulo_id'];
		$d['costo'] = sql2value("SELECT precio FROM articulos WHERE id = '$arti_id50'");
		$d['costo_total'] = $d['costo'] * $d['cantidad'];
		$_SESSION['equipos'][]=$d;
		totalizar();
		ir('registrar_factura.php');
		}
    }
    return false;
}
$ip->assign('f1',$f1->flush(true));
$ip->assign('f2',$f2->flush(true));
$ip->assign('items',@count($_SESSION['equipos']));
$ip->assign('items1',@count($_SESSION['factura']));
$ip->disp();
unset($_SESSION['mensaje']);