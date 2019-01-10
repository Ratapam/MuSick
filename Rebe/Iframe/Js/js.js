$(document).ready(function() {
  var longitud = false,
    minuscula = false,
    numero = false,
    mayuscula = false;
    otros = false;
  /*$('input[type=text]').keyup(function() {
    var email = $(this).val();
    if (email.length < 1) {
      $('#mono1').src = "img/mono2.png";
      //$('#mono1').id = 'mono2';

    } else {
      $('#length').removeClass('invalid').addClass('valid');
      longitud = true;
    }
  });*/
  $('input[type=password]').keyup(function() {
    var pswd = $(this).val();
    //validar longitud
    if (pswd.length < 8) {
      $('#length').removeClass('valid').addClass('invalid');
      longitud = false;
    } else {
      $('#length').removeClass('invalid').addClass('valid');
      longitud = true;
    }

    //validar letra
    if (pswd.match(/[A-z]/)) {
      $('#letter').removeClass('invalid').addClass('valid');
      minuscula = true;
    } else {
      $('#letter').removeClass('valid').addClass('invalid');
      minuscula = false;
    }

    //validar letra mayuscula
    if (pswd.match(/[A-Z]/)) {
      $('#capital').removeClass('invalid').addClass('valid');
      mayuscula = true;
    } else {
      $('#capital').removeClass('valid').addClass('invalid');
      mayuscula = false;
    }

    //validar numero
    if (pswd.match(/\d/)) {
      $('#number').removeClass('invalid').addClass('valid');
      numero = true;
    } else {
      $('#number').removeClass('valid').addClass('invalid');
      numero = false;
    }
//falta validar otros
    //otros
    if (pswd.match(/[\^$.*+?=!:|\\/()\[\]{}_-]/)) {
      $('#otros').removeClass('invalid').addClass('valid');
      otros = true;
    } else {
      $('#otros').removeClass('valid').addClass('invalid');
      otros = false;
    }

    
  }).focus(function() {
    $('#pswd_info').show();
  }).blur(function() {
    $('#pswd_info').hide();
  });

  $("#registro").submit(function(event) {
    alert("hola");
    if(longitud && minuscula && numero && mayuscula){
      alert("password correcto");
      $("#registro").submit();
     
    }else{
      alert("Password invalido.");
      event.preventDefault();
    }
    
  });
});