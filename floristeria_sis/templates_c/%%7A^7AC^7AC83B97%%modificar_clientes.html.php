<?php /* Smarty version 2.6.26, created on 2014-03-21 22:09:21
         compiled from modificar_clientes.html */ ?>
﻿<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cabecera.html", 'smarty_include_vars' => array('title' => "SS2526 - Modificar Clientes")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo $this->_tpl_vars['f1']; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pie.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo '
<script>
	var f2 = new LiveValidation(\'razon_social\'); f2.add( Validate.Presence ); 
	var f4 = new LiveValidation(\'direccion\'); f4.add( Validate.Presence ); 
	var f6 = new LiveValidation(\'tlf_fijo\'); f6.add( Validate.Length, { minimum: 7 } );
	var f10 = new LiveValidation(\'tlf_movil\'); f10.add( Validate.Length, { minimum: 7 } );
	var f9 = new LiveValidation(\'correo\'); f9.add( Validate.Email );
</script>
'; ?>