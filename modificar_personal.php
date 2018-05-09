<?php
session_start();
include './configs/funciones.php';
include './configs/smarty.php';
include './configs/bd.php';
include './configs/bdfh3.php';
include './modelo/bd_ficha_personal.php';
include './modelo/bd_modificar_personal.php';
include './modelo/bd_lista_niveles.php';
include './modelo/bd_verificar_privilegios.php';
$_SESSION['ini']=parse_ini_file('./configs/config.ini',true);
if (bd_verificar_privilegios('modificar_personal.php',$_SESSION['usuario']['nivel_id'])!='CONCEDER')
{
	ir('negacion_usuario.php');
}
$estado = array (
"ACTIVO" => "ACTIVO",
"INACTIVO" => "INACTIVO"
);
$personal = bd_ficha_personal($_REQUEST['id']);

$f1=new dbFormHandler('personal',NULL,'onclick="highlight(event)"');
$f1->setLanguage('es');
$star = ' <font color="blue">*</font>';
$f1->borderStart('Modificar Personal');
$f1->hiddenField('id', $personal['id']);
$f1->textField($star.'Nombre','nombre',FH_STRING,30,35,"onkeyup=\"personal.nombre.value=personal.nombre.value.toUpperCase();\"");
$f1->setValue('nombre', $personal['nombre']);
$f1->textField($star.'Apellido','apellido',FH_STRING,30,35,"onkeyup=\"personal.apellido.value=personal.apellido.value.toUpperCase();\"");
$f1->setValue('apellido', $personal['apellido']);
$f1->textArea($star.'Direccion','direccion',FH_STRING,30,3,"onkeyup=\"personal.direccion.value=personal.direccion.value.toUpperCase();\"");
$f1->setValue('direccion', $personal['direccion']);
$f1->textField('Teléfono Fijo','tlf_fijo',_FH_DIGIT,15,11,"onkeyup=\"return ValNumero(this);\"");
$f1->setValue('tlf_fijo', $personal['tlf_fijo']);
$f1->textField('Teléfono Movil','tlf_movil',_FH_DIGIT,15,11,"onkeyup=\"return ValNumero(this);\"");
$f1->setValue('tlf_movil', $personal['tlf_movil']);
$f1->selectField($star."Nivel de Acceso", "nivel_id", bd_lista_niveles(),FH_NOT_EMPTY,true);
$f1->setValue('nivel_id', $personal['nivel_id']);
$f1->textField('Correo Electronico','correo',_FH_EMAIL,30,50);
$f1->setValue('correo', $personal['correo']);
$f1->selectField($star.'Estado', 'estado',$estado,FH_NOT_EMPTY,true);
$f1->setValue('estado', $personal['estado']);
$f1->selectField($star."Nivel de Acceso", "nivel_id",bd_lista_niveles(),FH_NOT_EMPTY,true);
$f1->setValue('nivel_id', $personal['nivel_id']);
$f1->addLine($star ." = Campos Requeridos Obligatoriamente");
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
		bd_modificar_personal($d);
		?>
				<script type="text/javascript">
				window.alert('PERSONAL MODIFICADO CORRECTAMENTE');
				location.href='consmod_personal.php';
				</script>
		<?php	
		ir('consmod_personal.php');
}
$ip->assign('f1',$f1->flush(true));
$ip->disp();