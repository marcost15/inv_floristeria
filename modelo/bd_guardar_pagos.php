<?php
function bd_guardar_pagos($d)
{
	$fecha = date('Y-m-d');
	enviar_sql("INSERT INTO pagos (id,nro_factura,personal_id,cli_prov_id,tipo,forma_id,banco_id,pago,fecha,monto) 
	VALUES ('','$d[nro_factura]','$d[personal_id]','$d[cli_prov_id]','$d[tipo]','$d[forma_id]','$d[banco_id]','$d[pago]',$fecha,'$d[monto]');");
}