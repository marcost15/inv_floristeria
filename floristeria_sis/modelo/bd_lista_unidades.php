<?php
function bd_lista_unidades()
{
	return sql2opciones("SELECT id,nombre FROM unidades ORDER BY id ASC");
}