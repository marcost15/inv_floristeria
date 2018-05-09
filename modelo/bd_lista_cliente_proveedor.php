<?php
function bd_lista_cliente_proveedor()
{
	$a = sql2opciones("SELECT id,razon FROM clientes ORDER BY id ASC");
	$b = sql2opciones("SELECT id,razon_social FROM proveedores ORDER BY id ASC");
	$datos = array_merge($a,$b);
	return $datos;
}