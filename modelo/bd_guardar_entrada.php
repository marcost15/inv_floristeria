<?php
function bd_guardar_entrada($entrada,$equipos)
{
	$fecha = date('Y-m-d');
	$personal_id = $entrada['personal_id'];
	$deposito_id = $entrada['deposito_id'];
	$observacion = $entrada['observacion'];
	$proveedor_id =$entrada['proveedor_id'];
	enviar_sql("INSERT INTO entradas (id,personal_id,fecha,deposito_id,observacion,proveedor_id) 
	VALUES ('','$personal_id','$fecha','$deposito_id','$observacion','$proveedor_id');");
	//Buscar el Utimo registro de entrada
	$entrada_id = sql2value("SELECT id FROM entradas ORDER BY id DESC LIMIT 0,1");			
	
	foreach($equipos as $item)
	{
		$entrada_id     = $entrada_id;
		$articulo_id    = $item['articulo_id'];
		$cantidad        = $item['cantidad'];
		enviar_sql("
		INSERT INTO articulos_entradas(id,articulo_id,entrada_id,cantidad)
		VALUES ('','$articulo_id','$entrada_id','$cantidad');");
		$id_exist = sql2value("SELECT id FROM art_existencia WHERE articulo_id = '$articulo_id'");
		if (empty($id_exist))
		{   enviar_sql("
			INSERT INTO art_existencia(id,articulo_id,cant)
			VALUES ('','$articulo_id','$cantidad');");
		}
		else
		{
			$cant1 = sql2value("SELECT cant FROM art_existencia WHERE articulo_id = '$articulo_id'");
			$cant_nueva = $cant1 + $cantidad;
			$sql = "UPDATE art_existencia
				SET cant = $cant_nueva
				WHERE CONVERT(`art_existencia`.`id` USING utf8 ) = '$id_exist' LIMIT 1;";
			enviar_sql($sql);
		}
	} 
}