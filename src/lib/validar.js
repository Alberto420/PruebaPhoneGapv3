function validar() {
    var fecha_i,fecha_e, detalle, patente, encargado;
    fecha_i= document.getElementById("fecha_inicio").value;
    fecha_e= document.getElementById("fecha_entrega").value;
    detalle= document.getElementById("detalle").value;
    estado = document.getElementById("estado").value;
    patente= document.getElementById("patente_cli").value;
    encargado= document.getElementById("encargado").value;
    
    if(fecha_i === ""|| fecha_e === ""||detalle ===""|| patente===""||estado===""||encargado===""){
        alert("Todos los campos deben estar llenos");
        return false;
    }
    
}
function validarRepu(){
    var nombre, tipo,categoria, marca,stock,precio_costo,precio_venta;
    nombre= document.getElementsByName("nombre").value;
    tipo= document.getElementsByName("tipo").value;
    categoria= document.getElementsByName("categoria").value;
    marca= document.getElementsByName("marca").value;
    stock= document.getElementsByName("stock").value;
    precio_costo= document.getElementsByName("precio_costo").value;
    precio_venta= document.getElementsByName("precio_venta").value;
    if(nombre === ""|| tipo === ""||categoria ===""|| marca===""||stock===""||precio_costo===""||precio_venta=== ""){
        alert("Todos los campos deben estar llenos");
        return false;
    }

}
function validarTrab(){
    var nombre,rut,edad,fecha_ingr,fecha_egr,salario,area_trabajo;
    nombre=document.getElementsByName("nombre").value;
    rut=document.getElementsByName("rut").value;
    edad=document.getElementsByName("edad").value;
    fecha_ingr=document.getElementsByName("fecha_ingr").value;
    fecha_egr=document.getElementsByName("fecha_egr").value;
    salario=document.getElementsByName("salario").value;
    area_trabajo=document.getElementsByName("area_trabajo").value;
    if(nombre === ""|| rut === ""||edad ===""|| fecha_ingr===""||fecha_egr===""||salario===""||area_trabajo=== ""){
        alert("Todos los campos deben estar llenos");
        return false;
    }

}
function validarCre(){
    var nombre,rut,password;
    nombre=document.getElementsByName("nombre").value;
    rut=document.getElementsByName("rut").value;
    password=document.getElementsByName("password").value;
    if(nombre === ""|| rut === ""||password ===""){
        alert("Todos los campos deben estar llenos");
        return false;
    }
}