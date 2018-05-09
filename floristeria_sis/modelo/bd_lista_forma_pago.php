<?php
function bd_lista_forma_pago()
{
	return sql2opciones("SELECT id,nombre FROM formas_pagos ORDER BY id ASC");
}