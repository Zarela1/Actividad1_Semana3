<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Actividad 1_Registro de Medicamento</title>
</head>
<body>

<div class="container">
<h1>Registra Medicamento</h1>

	<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre del medicamento" maxlength="40">
		 		</div>
		 </div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_precio">Precio</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_precio" name="precio" placeholder="Ingrese el precio del medicamento" maxlength="10">
		 		</div>
			</div>
		</div>
		 <div class="row" style="margin-top: 0%">
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_stock">Stock</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el stock del medicamento" maxlength="5">
		 		</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_laboratorio">Laboratorio</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_laboratorio" name="laboratorio" placeholder="Ingrese el laboratorio" maxlength="100">
		 		</div>
		 	</div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Registrar medicamento</button>
		</div>	
	</form>
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
    //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
    		type: "POST",  
            url: "registraMedicamento", 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE) ;
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(data.MSG_ERROR);
            }
    	});
	}   
    	
	
});


function limpiarFormulario(){
	$('#id_nombre').val('');
	$('#id_stock').val('');
	$('#id_precio').val('');
	$('#id_laboratorio').val('');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
                nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre del medicamento es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max:40,
                            message: 'El nombre del medicamento es de 3 a 40 caracteres'
                        },
                    }
                },
                precio:{
                    selector: "#id_precio",
                    validators:{
                        notEmpty: {
                             message: 'El precio del medicamento es obligatorio'
                        },
                        stringLength: {
                            min: 1,
                            max: 5,
                            message: 'El precio del medicamento es de 1 y 5 caracteres'
                        },
                        regexp: {
                            regexp: /^(\d*\.)?\d+$/, 
                            message: 'Ingrese un valor correcto'
                        }
                    }
                },
                stock:{
                    selector: "#id_stock",
                    validators:{
                        notEmpty: {
                             message: 'El stock del medicamento es obligatorio'
                        },
                        stringLength: {
                            min: 1,
                            max: 5,
                            message: 'El stock del medicamento es como mínimo de un dígito'
                        }, 
                        regexp: {
                            regexp: /^[1-9]\d*$/,
                            message: 'Ingrese un valor correcto'
                        }
                    }
                },
                laboratorio:{
                    selector: "#id_laboratorio",
                    validators:{
                        notEmpty: {
                             message: 'El laboratorio del medicamento es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El laboratorio del medicamento es de 3 a 40 caracteres'
                        },
                    }
                },
        }   
    });

    
});
</script>

</body>
</html>




