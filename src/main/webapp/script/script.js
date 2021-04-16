/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        var numClientes = document.getElementsByClassName("cliente");
        var numDatos = document.getElementsByClassName("datos");
        var numForm = document.getElementsByClassName("actualizar");
        var numPedidos = document.getElementsByClassName("pedidos");
        var numPag = 0;
        
        function ocultar() {
            for (var i = 0; i < numForm.length; i++) {
                numForm[i].style.display = 'none';
            }
            for (var i = 0; i < numPedidos.length; i++) {
                numPedidos[i].style.display = "none";
            }
        }
        
        function verCliente(cliente, id) {
            for (var i = 0; i < numClientes.length; i++) {
                numClientes[i].style.backgroundColor = '#f1f1f1';
            }
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            ocultar();
            document.getElementById(id).style.display = "block";
            cliente.style.backgroundColor = 'lightblue';
            document.getElementById("form").style.display = "none";
        }
        
        function verPedido(pedido, id) {
            for (var i = 0; i < numClientes.length; i++) {
                numClientes[i].style.backgroundColor = '#f1f1f1';
            }
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            ocultar();
            document.getElementById(id).style.display = "block";
            pedido.style.backgroundColor = 'lightblue';
            document.getElementById("form").style.display = "none";
        }
        
        function modificar(x) {
            ocultar();
            var formulario = document.getElementById("form" + x);
            formulario.style.display = "flex";
        }
        
        function nuevo() {
            ocultar();
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            for (var i = 0; i < numClientes.length; i++) {
                numClientes[i].style.backgroundColor = '#f1f1f1';
            }
            document.getElementById("form").style.display = "flex";
        }
        
        function buscar() {
            var buscador = document.getElementById("buscador").value;
            ocultar();
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            for (var i = 0; i < numClientes.length; i++) {
                if (numClientes[i].innerHTML.indexOf(buscador) !== -1) {
                    numClientes[i].style.display = 'block';
                    numClientes[i].style.backgroundColor = '#f1f1f1';
                } else {
                    numClientes[i].style.display = 'none';
                } 
            }
            document.getElementById("form").style.display = "none";
        }
        function buscarPedido() {
            var buscador = document.getElementById("buscador2").value;
            ocultar();
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            for (var i = 0; i < numClientes.length; i++) {
                if (numClientes[i].innerHTML.indexOf(buscador) !== -1) {
                    numClientes[i].style.display = 'block';
                    numClientes[i].style.backgroundColor = '#f1f1f1';
                } else {
                    numClientes[i].style.display = 'none';
                } 
            }
            document.getElementById("form").style.display = "none";
        }
        
        
        function pagina(pag) {
            ocultar();
            if (pag === 1) {
                numPag = numPag-10;
            }
            if (pag === 2) {
                numPag = numPag+10;
            }
            if (numPag === 0) {
                document.getElementById("anterior").style.display = "none";
            } else {
                document.getElementById("anterior").style.display = "inline-block";
            }
            for (var i = 0; i < numClientes.length; i++) {
                    numClientes[i].style.display = "none";
            }
            if ((numPag+10) > numClientes.length-1) {
                document.getElementById("siguiente").style.display = "none";
            } else {
                document.getElementById("siguiente").style.display = "inline-block";
            }
            if (numClientes.length > 10) {
                for (var i = 0; i < 10; i++) {
                    numClientes[i+numPag].style.backgroundColor = '#f1f1f1';
                    numClientes[i+numPag].style.display = "block";
                }
            } else {
                for (var i = 0; i < numClientes.length; i++) {
                    numClientes[i].style.backgroundColor = '#f1f1f1';
                    numClientes[i].style.display = "block";
                }
            }
        }
        
        function mostrarPedidos(id) {
            var mostrar = document.getElementsByClassName("mostrar" + id);
            ocultar();
            for (var i = 0; i < mostrar.length; i++) {
                mostrar[i].style.display = 'grid';
            }
        }