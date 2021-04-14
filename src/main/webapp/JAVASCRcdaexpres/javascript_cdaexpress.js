//SLIDER DE IMAGENES AUTOMÁTICO
var slideIndex = 0;

showSlides();

function showSlides() {
       var i;
       var slides = document.getElementsByClassName("mySlides");
       for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";
       }

       slideIndex++;
       if(slideIndex > slides.length) {slideIndex = 1}
       slides[slideIndex-1].style.display = "block";
       setTimeout(showSlides,2000);
}

// MOSTRAR Y OCULTAR TEXTO 
document.write('<style type="text/css">div.cp_oculta{display: none;}</style>'); 
function MostrarOcultar(capa,enlace) 
{ 
    if (document.getElementById) 
    { 
        var aux = document.getElementById(capa).style; 
        aux.display = aux.display? "":"block"; 
    } 
} 
