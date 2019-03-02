 /* -- Eventos click en perfil buscar y logo -- */
  //let div1 = document.querySelector('header > div > div:nth-of-type(1) > a');
  
  //Logo que te lleva al home
  let span1 = document.querySelector('header > div > div:nth-of-type(1) > span');
  //Imagen del usuario que te lleva a su perfil
  let span2 = document.querySelector('header > div > div:nth-of-type(3) > span');
  //Icono de cerrar sesion 
  //let span2 = document.querySelector('header > div > div:nth-of-type(4) > span');
  //let input = document.querySelector('header > div > div:nth-of-type(2) > ');
  let biblioteca = document.getElementById('biblioteca')
  //div1.document.addEventListener('click',cambiarIframe1);

  span1.addEventListener('click',cambiarIframe1);
  span2.addEventListener('click',cambiarIframe2);
  biblioteca.addEventListener('click',cambiarIframe3);
  //input.addEventListener('keyup',cambiarIframe4);

  /* Funciones */

 /* function cambiarIframe1(){
   // const iframe = document.querySelector('main > iframe');
    const pagina = "../PHP/home.php";
    document.getElementById('if').src= pagina;

  }*/

   function cambiarIframe1(){

    let iframe = document.getElementById('iframe');

      iframe.src = '/usuario/home/';

  }

   function cambiarIframe2(){

    let iframe = document.getElementById('iframe');

      iframe.src = '/usuario/perfil/';

  }

  function cambiarIframe3(){

     let iframe = document.getElementById('iframe');

       iframe.src = '/usuario/biblioteca/';

   }

    function cambiarIframe4(){

     let iframe = document.getElementById('iframe');
 
       iframe.src = '../php/artista.php';




   }

  /* -- Reproductor ---
    window.onload = function () {
      var audio = document.getElementById("audio");
      audio.volume = document.getElementById("volume").value;
      // Eventos
      document.getElementById("play").onclick = function () { audio.play() }
      document.getElementById("pause").onclick = function () { audio.pause() }
      document.getElementById("stop").onclick = function () { audio.load() }
      document.getElementById("volume").onchange = function (e) { audio.volume = e.target.value }
      audio.ontimeupdate = function () {
        document.getElementById("time").max = audio.duration;
        document.getElementById("time").value = audio.currentTime;
      } 
      // Para poner el nombre de la canción debajo. -- NO FUNCIONA
      // let nombreCancion = audio.currentSrc.substring(lastIndexOf("/", audio.currentSrc), audio.currentSrc.length);
      // document.getElementById("cancion").innerHTML = nombreCancion;
      // document.getElementById("cancion").innerHTML = audio.currentSrc;
    }*/
