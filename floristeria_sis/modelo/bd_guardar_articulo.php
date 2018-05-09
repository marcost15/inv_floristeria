<?php
function bd_guardar_articulos($d)
{
	enviar_sql("INSERT INTO articulos (id,descripcion,tipo_id,unidad_id,precio) 
	VALUES ('','$d[descripcion]','$d[tipo_id]','$d[unidad_id]','$d[precio]');");
}