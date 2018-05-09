<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_modificar_articulos.php';
include './modelo/bd_lista_tipos_articulos.php';
include './modelo/bd_lista_unidades.php';
include './modelo/bd_ficha_articulos.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('modificar_articulos.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}


$articulo = bd_ficha_articulos($_REQUEST['id']);
$f1=new FormHandler('articulo',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$f1->borderStart('Modificar Articulos');
$f1->hiddenField('id', $articulo['id']);
$f1->textField('Descripción','descripcion',FH_STRING,30,35,"onkeyup=\"articulo.descripcion.value=articulo.descripcion.value.toUpperCase();\"");
$f1->setValue('descripcion', $articulo['descripcion']);
$f1->selectField("Tipo", "tipo_id",bd_lista_tipos_articulos(),FH_NOT_EMPTY,true);
$f1->setValue('tipo_id', $articulo['tipo_id']);
$f1->selectField("Unidad", "unidad_id",bd_lista_unidades(),FH_NOT_EMPTY,true);
$f1->setValue('unidad_id', $articulo['unidad_id']);
$f1->textField('Precio','precio',FH_FLOAT,10,20);
$f1->setValue('precio', $articulo['precio']);
$f1->setMask(
   " <tr>\n".
   "   <td> </td>\n".
   "   <td> </td>\n".
   "   <td>%field% %field%</td>\n".
   " </tr>\n"
);
$f1->submitButton('Modificar','modificar');
$f1->resetButton();
$f1->borderStop();
$f1->onCorrect("procesar");

function procesar($d)
{
	bd_modificar_articulos($d);
	?>
		<script type="text/javascript">
		window.alert('ARTICULO MODIFICADO CORRECTAMENTE');
		location.href='consmod_articulos.php';
		</script>
	<?php
}
$ip->assign('f1',$f1->flush(true));
$ip->disp();