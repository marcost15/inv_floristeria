<?php
function bd_obt_unidades($id = null)
{
	if($id==NULL)
	{
		return sql2array("SELECT id,nombre FROM unidades ORDER BY nombre ASC");
	}
	else
	{
		return sql2value("SELECT nombre FROM unidades WHERE id = $id LIMIT 1");
	}
}