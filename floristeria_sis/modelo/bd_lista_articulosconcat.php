<?php
function bd_lista_articulosconcat()
{
	return sql2opciones("SELECT articulos.id,CONCAT(descripcion,',',unidades.nombre) AS descrip  FROM
  articulos  INNER JOIN unidades ON unidades.id = articulos.unidad_id ORDER BY id ASC");
}
