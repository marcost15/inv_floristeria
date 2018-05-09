<?php
function bd_guardar_factura($factura,$equipos,$costo_final)
{
	$fecha = date('Y-m-d');
	$personal_id = $factura['cliente_id'];
	$condicion = $factura['condicion'];
	$nrofactura = $factura['nrofactura'];
	$monto = $costo_final;
	enviar_sql("INSERT INTO facturas (id,cliente_id,fecha,nrofactura,cond_id,monto) 
	VALUES ('','$personal_id','$fecha','$nrofactura','$condicion','$monto');");
	//Buscar el Utimo registro de entrada
	$factura_id = sql2value("SELECT id FROM facturas ORDER BY id DESC LIMIT 0,1");			
	
	foreach($equipos as $item)
	{
		$factura_id     = $factura_id;
		$articulo_id    = $item['articulo_id'];
		$cantidad        = $item['cantidad'];
		$precio        = $item['costo'];
		enviar_sql("
		INSERT INTO facturas_detail(id,articulo_id,factura_id,cant,precio)
		VALUES ('','$articulo_id','$factura_id','$cantidad','$precio');");
		$id_exist = sql2value("SELECT id FROM art_existencia WHERE articulo_id = '$articulo_id'");
		if (empty($id_exist))
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