<?php
function bd_buscar_pagos($texto)
{
	$sql = "SELECT id,nro_factura,tipo,monto,fecha
					FROM pagos
					WHERE id            LIKE '%$texto%' 
 						OR nro_factura  LIKE '%$texto%'
						OR tipo         LIKE '%$texto%'
						OR monto        LIKE '%$texto%'
					 	ORDER BY nro_factura ASC";
	return sql2array($sql);
}