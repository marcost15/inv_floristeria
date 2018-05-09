<?php /* Smarty version 2.6.26, created on 2014-03-21 22:45:56
         compiled from ficha_proveedores.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cabecera.html", 'smarty_include_vars' => array('title' => 'Ficha Proveedores')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<h3>FICHA DE PROVEEDORES</h3>
<table class = "retiro" align = "center" border="1">
	<tr>
		<th>Rif</th>
		<td><?php echo $this->_tpl_vars['ficha']['rif']; ?>
</td>
	</tr>
	<tr>
		<th>Razón Social</th>
		<td><?php echo $this->_tpl_vars['ficha']['razon_social']; ?>
</td>
	</tr>
	<tr>
		<th>Dirección</th>
		<td><?php echo $this->_tpl_vars['ficha']['direccion']; ?>
</td>
	</tr>
	<?php if ($this->_tpl_vars['ficha']['telf_fijo']): ?>
	<tr>
		<th>Telefono Fijo</th>
		<td><?php echo $this->_tpl_vars['ficha']['telf_fijo']; ?>
</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['ficha']['fax']): ?>
	<tr>
		<th>Fax</th>
		<td><?php echo $this->_tpl_vars['ficha']['fax']; ?>
</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['ficha']['correo']): ?>
	<tr>
		<th>Correo Electronico</th>
		<td><?php echo $this->_tpl_vars['ficha']['correo']; ?>
</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['ficha']['persona_contacto']): ?>
	<tr>
		<th>Persona Contacto</th>
		<td><?php echo $this->_tpl_vars['ficha']['persona_contacto']; ?>
</td>
	</tr>
	<?php endif; ?>
</table>
<hr/>	
<div id="boton" align="center"><a href="consmod_proveedores.php"><img onmouseover='overlib("<strong>Volver</strong>",WIDTH, 70)' src="./imagenes/flecha_izquierda.gif" onmouseout='return nd();'/></a></div>
</p>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pie.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>