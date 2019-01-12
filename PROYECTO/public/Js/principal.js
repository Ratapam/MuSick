 /* -- Eventos click en perfil buscar y logo -- */
  //let div1 = document.querySelector('header > div > div:nth-of-type(1) > a');

  let span1 = document.querySelector('header > div > div:nth-of-type(1) > span');
  let span2 = document.querySelector('header > div > div:nth-of-type(3) > span');

  //div1.document.addEventListener('click',cambiarIframe1);

  span1.addEventListener('click',cambiarIframe1);
  span2.addEventListener('click',cambiarIframe2);


  /* Funciones */

 /* function cambiarIframe1(){
   // const iframe = document.querySelector('main > iframe');
    const pagina = "../PHP/home.php";
    document.getElementById('if').src= pagina; 
    
  }*/

   function cambiarIframe1(){
   // const iframe = document.querySelector('main > iframe');
    let iframe = document.getElementById('iframe');

      iframe.src = '../PHP/home.php';
    
  }

   function cambiarIframe2(){
   // const iframe = document.querySelector('main > iframe');
    let iframe = document.getElementById('iframe');

      iframe.src = 'perfil.html';
    
  }

  /* -- Reproductor --- */
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
    }