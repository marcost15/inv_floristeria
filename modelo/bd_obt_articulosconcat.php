<?php
function bd_obt_articulosconcat($id = null)
{
	if($id==NULL)
	{
		return sql2array("SELECT articulos.id,CONCAT(descripcion,', ',nombre) AS descrip FROM articulos, tipos_articulos WHERE tipos_articulos.id = tipo_id ORDER BY id ASC");
	}
	else
	{
		return sql2value("SELECT CONCAT(descripcion,', ',nombre) AS descrip FROM articulos, tipos_articulos WHERE articulos.id = $id AND tipos_articulos.id = tipo_id LIMIT 1");
	}
}
function bd_obt_articulosconcat2($id = null)
{
	if($id==NULL)
	{
		return sql2array("SELECT articulos.id,CONCAT(descripcion,', ',nombre) AS descrip FROM articulos, tipos_articulos ORDER BY id ASC");
	}
	else
	{
		return sql2value("SELECT CONCAT(descripcion,', ',nombre) AS descrip FROM articulos, tipos_articulos WHERE articulos.id = $id LIMIT 1");
	}
}