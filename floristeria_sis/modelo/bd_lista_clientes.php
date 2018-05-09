<?php
function bd_lista_clientes()
{
	return sql2opciones("SELECT id,razon FROM clientes ORDER BY id ASC");
}