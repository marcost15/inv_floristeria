<?php
function bd_buscar_articulos($texto)
{
	$sql = "SELECT id,descripcion,tipo_id,unidad_id,precio
					FROM articulos
					WHERE id            LIKE '%$texto%' 
 						OR descripcion  LIKE '%$texto%'
					 	ORDER BY descripcion ASC";
	return sql2array($sql);
}