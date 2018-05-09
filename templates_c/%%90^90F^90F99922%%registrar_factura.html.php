<?php /* Smarty version 2.6.26, created on 2014-03-13 05:20:31
         compiled from registrar_factura.html */ ?>
﻿<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cabecera.html", 'smarty_include_vars' => array('title' => 'Registrar Factura')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php if ($_SESSION['mensaje']): ?>
</p>
<div class="mensaje"><?php echo $_SESSION['mensaje']; ?>
</div>
<?php endif; ?>
<table border="0">
    <tr>
	<td valign="top">
<table border="0">
<tbody>
<th><font size=4>Cliente</font></th> 
 <tr>
      <td>
      
<table border="0">
  <tbody>
	 <tr>
      <th align="right">Nro Factura:</th><td><?php echo $_SESSION['factura']['nrofactura']; ?>
</td>
	</tr>
	<tr>
      <th align="right">Cliente:</th><td><?php echo $_SESSION['factura']['cliente_nombre']; ?>
</td>
	</tr>
	<tr>
      <th align="right">Condicion:</th><td><?php echo $_SESSION['factura']['condicion']; ?>
</td>
	</tr>
	
	<tr>
	  <th>&#160;</th><td><div id = "boton"><a href="#" onClick="flash('forma1','forma2')"><img onmouseover='overlib("<strong>Modificar</strong>",WIDTH, 70)' src="./imagenes/boton_act.gif" onmouseout='return nd();'/></a></div></td>
    </tr>
  </tbody>
</table>
      </td>
    </tr>
    <tr>
      <td>
<table class="enhancedtable" border="1" cellspacing="0" cellpadding = "3">
  <thead>
    <tr>
	  <td colspan="4" align="center"><font size=4><strong>Productos</strong></font></td>
	</tr>
	<tr>
      <th>Nombre</th>
	  <th>Precio Unitario</th>
	  <th>Cantidad</th>
	  <th>Precio Total</th>
	  <th><div id = "boton"><a href="#" onClick="flash('forma2','forma1')"><img onmouseover='overlib("<strong>Agregar &#237;tem</strong>",WIDTH, 70)' src="./imagenes/boton1.png" onmouseout='return nd();'/></a></div></th>
    </tr>
  </thead>
  <tbody>
<?php $this->assign('equipos', $_SESSION['equipos']); ?> 
<?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['equipos']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
    <tr>
      <td><?php echo $this->_tpl_vars['equipos'][$this->_sections['i']['index']]['articulo_nombre']; ?>
</td>
	  <td><?php echo $this->_tpl_vars['equipos'][$this->_sections['i']['index']]['costo']; ?>
</td>
	  <td><?php echo $this->_tpl_vars['equipos'][$this->_sections['i']['index']]['cantidad']; ?>
</td>
	  <td><?php echo $this->_tpl_vars['equipos'][$this->_sections['i']['index']]['costo_total']; ?>
</td>
	  <td><div id = "boton"><a href="?accion=eliminar&amp;id=<?php echo $this->_sections['i']['index']; ?>
"><img onmouseover='overlib("<strong>Eliminar</strong>",WIDTH, 70)' src="./imagenes/eliminar.png" onmouseout='return nd();'/></a></div></td>
    </tr>
<?php endfor; endif; ?>
	<tr>
      <td rowspan="1" align="right" colspan="2" rowspan="1"><strong>Total:</strong></td>
      <td rowspan="1" align="left" colspan="1" rowspan="1"><strong><?php echo $_SESSION['total']; ?>
</strong></td>
	  <td rowspan="1" align="left" colspan="1" rowspan="1"><strong><?php echo $_SESSION['costo_final']; ?>
</strong></td>
    </tr>    
  </tbody>
</table>
<?php if ($this->_tpl_vars['items'] > 0 && $this->_tpl_vars['items1'] > 0): ?>
</p>
<div id = "boton">
<a href='javascript:window.print(); void 0;'><img onmouseover='overlib("<strong>IMPRIMIR</strong>",WIDTH, 70)' src="./imagenes/imprimir.gif" onmouseout='return nd();'/></a>
<font size="3"><strong><a href="registrar_factura2.php" onClick="return confirm('Si los datos est&#225;n correctos pulse OK, de lo contrario Cancele y corrija')">Guardar la Factura<img onmouseover='overlib("<strong>Registrar</strong>",WIDTH, 70)' src="./imagenes/seleccionar.ico" onmouseout='return nd();'/></a></strong></font>
</div>
<?php endif; ?>
      </td>
    </tr>
  </tbody>
</table>
</td>
<td>
<div id="forma1" style="display:none">
<?php echo $this->_tpl_vars['f1']; ?>

</div>
<div id="forma2" style="display:none">
<?php echo $this->_tpl_vars['f2']; ?>

</div>
</td>
    </tr>
</table>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "pie.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo '
<script>
function flash(a,b)
{
    document.getElementById(a).style.setProperty("display","inline","")
	document.getElementById(b).style.setProperty("display","none","")
}
</script>
'; ?>