<?php
function bd_obt_clientes($id = null)
{
	if($id==NULL)
	{
		return sql2array("SELECT id,razon,rif FROM clientes ORDER BY id ASC");
	}
	else
	{
		return sql2value("SELECT razon FROM clientes WHERE id = '$id' LIMIT 1");
	}
}