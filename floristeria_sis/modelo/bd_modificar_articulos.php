<?php
function bd_modificar_articulos($d)
{
	$id  = $d['id'];
	$sql = "UPDATE articulos
			SET descripcion = '$d[descripcion]',
				unidad_id   = '$d[unidad_id]',
				tipo_id     = '$d[tipo_id]',
				precio      = '$d[precio]'
				WHERE CONVERT(`articulos`.`id` USING utf8 ) = '$id' LIMIT 1 ;";
	enviar_sql($sql);
 }