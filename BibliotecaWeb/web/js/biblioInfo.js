$(document).ready(function(){
    $('#btnUsuario').on('click', getDatosUsuario);
    $('#btnEjemplar').on('click', getDatosEjemplar);
});

function getDatosUsuario(){
    var carnet = $("#txtCarnet").val();
    var dev = $("#btnUsuario").val();
    
    $.ajax({        
        type: "POST",
        data: {'id' : carnet},
        dataType: 'json',
        url: "UsuarioSevlet",
        success: function(datos){
            if (datos.error !== ""){
                $("#msgUsuario").text(datos.error);
                $("#msgUsuario").removeClass("hidden").addClass("visible");
                $("#txtNombre").val("");
                $("#txtCarnetP").val("");
                $("#containerMora").removeClass("list-group-item-danger").addClass("list-group-item-success");
                $("#lblMora").text("$0.00");
                $("#lblPrestamos").text("0");
            } else {
                $("#msgUsuario").removeClass("visible").addClass("hidden");
                $("#txtNombre").val(datos.nombre);
                $("#txtCarnetP").val(datos.carnet);
                
                if (datos.mora > 0){
                    $("#containerMora").removeClass("list-group-item-success").addClass("list-group-item-danger");
                } else {
                    $("#containerMora").removeClass("list-group-item-danger").addClass("list-group-item-success");
                }
                $("#lblMora").text("$" + datos.mora);
                $("#lblPrestamos").text(datos.cantP);
            }
            
            if(dev === "dev"){
                mostrarTablaPrestamos(carnet);
            }
        }
    });
}

function getDatosEjemplar(){
    var id = $("#txtIdEjemplar").val();
    
    $.ajax({
        type: "POST",
        data: {'id' : id},
        dataType: 'json',
        url: "EjemplarServlet",
        success: function(datos){
            if (datos.error !== ""){
                $("#msgEjemplar").text(datos.error);
                $("#msgEjemplar").removeClass("hidden").addClass("visible");
                $("#txtTitulo").val("");
                $("#txtIdEjP").val("");
                $("#contDisp").removeClass("list-group-item-danger").addClass("list-group-item-success");
                $("#iconEjemplar").removeClass("fa-times-circle-o").addClass("fa-check-circle-o");
                $("#lblDisp").text("Disponible");
            } else {
                $("#msgEjemplar").removeClass("visible").addClass("hidden");
                $("#txtTitulo").val(datos.titulo);
                $("#txtIdEjP").val(datos.id);
                
                if (!datos.disp){
                    $("#contDisp").removeClass("list-group-item-success").addClass("list-group-item-danger");
                    $("#iconEjemplar").removeClass("fa-check-circle-o").addClass("fa-times-circle-o");
                    $("#lblDisp").text("No disponible");
                } else {
                    $("#contDisp").removeClass("list-group-item-danger").addClass("list-group-item-success");
                    $("#iconEjemplar").removeClass("fa-times-circle-o").addClass("fa-check-circle-o");
                    $("#lblDisp").text("Disponible");
                }
            }
        }
    });
}

function mostrarTablaPrestamos(id){
    $.ajax({        
        type: "POST",
        data: {'id' : id},
        dataType: 'html',
        url: "PrestamosUsuario",
        success: function(datos){
            $("#tblPrestamos").html(datos);
        }
    });
}