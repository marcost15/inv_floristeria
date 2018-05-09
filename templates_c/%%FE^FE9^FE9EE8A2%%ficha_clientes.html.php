<?php /* Smarty version 2.6.26, created on 2014-05-08 20:47:52
         compiled from ficha_clientes.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cabecera.html", 'smarty_include_vars' => array('title' => 'Ficha Clientes')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<h3>FICHA DE CLIENTES</h3>
<table class = "retiro" align = "center" border="1">
	<tr>
		<th>Rif</th>
		<td><?php echo $this->_tpl_vars['ficha']['id']; ?>
</td>
	</tr>
	<tr>
		<th>Nombre</th>
		<td><?php echo $this->_tpl_vars['ficha']['razon']; ?>
</td>
	</tr>
	<tr>
		<th>Dirección</th>
		<td><?php echo $this->_tpl_vars['ficha']['direccion']; ?>
</td>
	</tr>
	<?php if ($this->_tpl_vars['ficha']['tlf_fijo']): ?>
	<tr>
		<th>Telefono Fijo</th>
		<td><?php echo $this->_tpl_vars['ficha']['tlf_fijo']; ?>
</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['ficha']['tlf_movil']): ?>
	<tr>
		<th>Telefono Movil</th>
		<td><?php echo $this->_tpl_vars['ficha']['tlf_movil']; ?>
</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['ficha']['correo']): ?>
	<tr>
		<th>Correo electronico</th>
		<td><?php echo $this->_tpl_vars['ficha']['correo']; ?>
</td>
	</tr>
	<?php endif; ?>
</table>
<hr/>	
<div id="boton" align="center"><a href="consmod_clientes.php"><img onmouseover='overlib("<strong>Volver</strong>",WIDTH, 70)' src="./imagenes/flecha_izquierda.gif" onmouseout='return nd();'/></a></div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pie.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>