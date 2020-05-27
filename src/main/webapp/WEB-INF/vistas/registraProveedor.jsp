<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Proveedor</title>
</head>
<body>

<div class="container">
<h1>Registra Proveedor</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraProveedor" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Razon Social</label>
				<input class="form-control" type="text" id="id_nombre" name="raz_social_proveedor" placeholder="Ingrese la razon social">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">Direccion</label>
				<input class="form-control" id="id_direccion" name="dir_proveedor" placeholder="Ingrese la direccion" type="text"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc">Ruc</label>
				<input class="form-control" id="id_ruc" name="ruc_proveedor" placeholder="Ingrese el ruc" type="number"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_maxima">Fecha Registro</label>
				<input class="form-control" id="id_Fecha" name="fec_reg_proveedor" placeholder="Ingrese la fecha de registro" type="date"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria">Categoria</label>
				<select id="id_categoria" name="categoria.cod_categoria" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Proveedor</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaCategoria", {}, function(data){
	console.log("inicio2");
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.cod_categoria +">"+ item.nom_categoria +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	raz_social_proveedor: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'La razon social es un campo obligatorio'
                },
                stringLength :{
                	message:'La razon social es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        dir_proveedor: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La direccion es un campo obligatorio'
                },
                stringLength :{
                	message:'La direccion es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        ruc_proveedor: {
    		selector : '#id_ruc',
            validators: {
            	notEmpty: {
                    message: 'El ruc es un campo obligatorio'
                },
                stringLength :{
                	message:'El ruc es de 11 caracteres',
                	min : 11,
                	max : 11
                }
            }
        },
       
        cod_categoria: {
    		selector : '#id_categoria',
            validators: {
            	notEmpty: {
                    message: 'La categoria es un campo obligatorio'
                },
            }
        },

        fec_reg_proveedor: {
    		selector : '#id_Fecha',
            validators: {
            	notEmpty: {
                    message: 'La Fecha de registro es un campo obligatorio'
                },
            }
        },

        
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




