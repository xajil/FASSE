<p class="lead">
    
</p>
<ul class="breadcrumb" style="margin-bottom: 5px;">
    <li>
        <a href="configAdmin.php?view=clientes">
            <i class="fa fa-plus-circle" aria-hidden="true"></i> &nbsp; Nuevo Cliente
        </a>
    </li>
    <li>
        <a href="configAdmin.php?view=clienteslist"><i class="fa fa-list-ol" aria-hidden="true"></i> &nbsp; Clientes FASSE</a>
    </li>
	    <li>
        <a href="./report/clientes.php?id=<?php echo $order['NIT'];  ?> "><i class="fa fa-list-ol" aria-hidden="true"></i> &nbsp; Imprimir Clientes FASSE</a>
    </li>
    <li>
	<a href="./report/clientes.php?id=<?php echo $order['NIT'];  ?>" class="btn btn-raised btn-xs btn-primary btn-block" target="_blank">Imprimir</a>
</li>
</ul>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
            <div class="container-form-admin">
                <h3 class="text-primary text-center">Agregar un nuevo cliente</h3>
                <form action="process/regprove.php" method="POST" class="FormCatElec" data-form="save">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group label-floating">
                                    <label class="control-label">NIT/CEDULA</label>
                                    <input class="form-control" type="text" name="prove-nit" pattern="[0-9]{1,20}" maxlength="20" required="">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label">Nombre</label>
                                    <input class="form-control" type="text" name="prove-name" maxlength="30" required="">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label">Dirección</label>
                                    <input class="form-control" type="text" name="prove-dir" required="">
                                </div> 
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label">Teléfono</label>
                                    <input class="form-control" type="tel" name="prove-tel" pattern="[0-9]{1,20}" maxlength="20" required="">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label">Página Web (http://ejemplo.com)</label>
                                    <input class="form-control" type="url" name="prove-web">
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="text-center"><button type="submit" class="btn btn-primary btn-raised">Agregar cliente</button></p>
                </form>
            </div>
        </div>
	</div>
</div>