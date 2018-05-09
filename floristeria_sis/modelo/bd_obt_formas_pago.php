<?php
function bd_obt_formas_pago($id = null)
{
	if($id==NULL)
	{
		return sql2array("SELECT id,nombre FROM formas_pagos ORDER BY id ASC");
	}
	else
	{
		return sql2value("SELECT nombre FROM formas_pagos WHERE id = $id LIMIT 1");
	}
}