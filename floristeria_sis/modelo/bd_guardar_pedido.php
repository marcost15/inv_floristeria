<?php
function bd_guardar_pedido($entrada,$equipos)
{
	$fecha = date('Y-m-d');
	$personal_id = $entrada['personal_id'];
	$observacion = $entrada['observacion'];
	$proveedor_id =$entrada['cliente_id'];
	enviar_sql("INSERT INTO pedidos (id,personal_id,fecha,observacion,cliente_id) 
	VALUES ('','$personal_id','$fecha','$observacion','$proveedor_id');");
	//Buscar el Utimo registro de entrada
	$pedido_id = sql2value("SELECT id FROM pedidos ORDER BY id DESC LIMIT 0,1");			
	
	foreach($equipos as $item)
	{
		$pedido_id     = $pedido_id;
		$articulo_id   = $item['articulo_id'];
		$cantidad   = $item['cantidad'];
		$precio   = $item['precio'];
		enviar_sql("
		INSERT INTO pedidos_articulos(id,articulo_id,pedido_id,cant,id_precio)
		VALUES ('','$articulo_id','$pedido_id','$cantidad','$precio');");
	} 
}