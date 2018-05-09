<?php
function bd_guardar_salida($salida,$equipos)
{
	$fecha = date('Y-m-d');
	$personal_id = $salida['personal_id'];
	$observacion = $salida['observacion'];
	$beneficiario_id = $salida['beneficiario_id'];
	enviar_sql("INSERT INTO salidas (id,personal_id,fecha,beneficiario_id,observacion) 
	VALUES ('','$personal_id','$fecha','$beneficiario_id','$observacion');");
	//Buscar el Utimo registro de entrada
	$salida_id = sql2value("SELECT id FROM salidas ORDER BY id DESC LIMIT 0,1");			
	foreach($equipos as $item)
	{
		$salida_id     = $salida_id;
		$articulo_id    = $item['articulo_id'];
		$cantidad        = $item['cantidad'];
		enviar_sql("
		INSERT INTO articulos_salidas(id,articulo_id,salida_id,cantidad)
		VALUES ('','$articulo_id','$salida_id','$cantidad');");
		$id_exist = sql2value("SELECT id FROM art_existencia WHERE articulo_id = '$articulo_id'");
		if (empty($articulo_id))
		{   enviar_sql("
			INSERT INTO art_existencia(id,articulo_id,cant)
			VALUES ('','$articulo_id','$cantidad');");
		}
		else
		{
			$cant1 = sql2value("SELECT cant FROM art_existencia WHERE articulo_id = '$articulo_id'");
			$cant_nueva = $cant1 - $cantidad;
			$sql = "UPDATE art_existencia
				SET cant = $cant_nueva
				WHERE CONVERT(`art_existencia`.`id` USING utf8 ) = '$id_exist' LIMIT 1;";
			enviar_sql($sql);
		}
	}
}