<?php

class ControllerUsuario extends BaseController{

    function principal(){

       $this->data=  ModelUsuario::principal();
    }

    function home(){
        $this -> data['ultimo_escuchado'] = ModelUsuario::ultimasEscuchadas();
        $this -> data['estilo'] = ModelEstilo::cuatroEstilos();
        $this -> data['recomendado'] = ModelEscuchadoRecientemente::masEscuchados();
     }

     function perfil(){

      $this->data=  ModelUsuario::perfil();
      }

     function biblioteca(){
      //$this-> data['css'] = "<link href='/css/artista.css' rel='stylesheet'>"; 
      $this-> data['lista'] =  ModelListaReproduccion::getCancionesLista();
      $this-> data['css'] = "<link href='/css/artista.css' rel='stylesheet'>"; 
     }

     public function login(){
      $form = new ModelUsuarioForm($_POST);
      if(count($_POST)>0 && $form->datosValidos()){
          // Aquí debéis preguntar a los modelos
          // Yo siempre que me envíen algo lo pongo a true
          $nombre = $_POST['nombre'];
          $pass = $_POST['contrasena'];
          $this -> data = ModelUsuarioForm::procesalogin($nombre,$pass);
          
          
          if($this->data['id_usuario']){
              Session::getInstance()->set('AUTH', true);
              Session::getInstance()->set('usuario', $this->data['id_usuario']);
              
              if($nombre = $_POST['recuerdame']){
                
                $id = $this->data['id_usuario'];
                $nombre = $this->data['nombre'];
                $token = ModelUsuario::generateToken();
                $retorno = ModelUsuarioForm::tokenRecuerdame($id,$token);
               
                $arrLogin = [
                    'id' => $id,
                    "token" => $token,
                ];

                $arrLogin = serialize($arrLogin);
                setcookie('session',$arrLogin,time() +999999,"/");
             }
              App::getRouter()->redirect('/usuario/principal/');
          }

          
          App::getRouter()->redirect('/usuario/login/');
      }
      $this->data['form'] = $form->pintar();
  }

  public function registrate(){
    $form = new ModelUsuarioFormRegistro($_POST);
    if(count($_POST)>0 && $form->datosValidos()){
        // Aquí debéis preguntar a los modelos
        // Yo siempre que me envíen algo lo pongo a true
        $nombre = $_POST['nombre'];
        $pass = $_POST['contrasena'];
        $pass  = password_hash($pass,2);
        $correo = $_POST['correo'];
        $this -> data = ModelUsuarioFormRegistro::crearRegistro($nombre,$pass,$correo);
        
        
        

        
        App::getRouter()->redirect('/usuario/login/');
    }
    $this->data['form'] = $form->pintar();
}

  public function compruebaCookie(){
    $arrCokie = $_COOKIE['session'];
    $arrCokie = unserialize($arrCokie);
    $id = $arrCokie['id'];
    $token  = $arrCokie['token'];
    
    $respuesta = ModelUsuarioForm::verificaCookie($id,$token);
    if($respuesta){
        Session::getInstance()->set('AUTH', true);
        Session::getInstance()->set('usuario', $id);
        App::getRouter()->redirect('/usuario/principal/');
    }else{
        setcookie('session', " ",time() -9999999,"/");
        App::getRouter()->redirect('/usuario/login/');
    }
    
} 

public function salir(){
    $arrCokie = $_COOKIE['session'];
    $arrCokie = unserialize($arrCokie);
    $id = $arrCokie['id'];
    $token  = $arrCokie['token'];

    ModelUsuarioForm::borrarTokenRecuerdame($id,$token);
    Session::getInstance()->set('AUTH', false);
    session_destroy();
    setcookie('session',' ',time() -99999,"/");
    App::getRouter()->redirect('/usuario/login/');
}


     

}



?>