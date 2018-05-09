<?php /* Smarty version 2.6.26, created on 2014-03-13 16:29:32
         compiled from registrar_proveedores.html */ ?>
﻿<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cabecera.html", 'smarty_include_vars' => array('title' => 'Registrar Proveedores')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php if ($_SESSION['mensaje']): ?>
</p>
<div class="mensaje"><?php echo $_SESSION['mensaje']; ?>
</div>
<?php endif; ?>
<?php echo $this->_tpl_vars['f1']; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pie.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo '
<script>
	var f1 = new LiveValidation(\'rif\'); f1.add( Validate.Presence ); f1.add( Validate.Length, { minimum: 7 } );
	var f2 = new LiveValidation(\'razon_social\'); f2.add( Validate.Presence ); 
	var f3 = new LiveValidation(\'persona_contacto\'); f3.add( Validate.Presence ); 
	var f4 = new LiveValidation(\'direccion\'); f4.add( Validate.Presence ); 
	var f5 = new LiveValidation(\'fax\'); f5.add( Validate.Length, { minimum: 7 } );
	var f6 = new LiveValidation(\'telf_fijo\'); f6.add( Validate.Presence ); f6.add( Validate.Length, { minimum: 7 } );
	var f9 = new LiveValidation(\'correo\'); f9.add( Validate.Email );
</script>
'; ?>