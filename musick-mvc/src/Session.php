<?php

class Session {

    private static $instance = null;

    // $ses = Session::getInstance();
    public static function getInstance() {
        if (self::$instance == null) {
          self::$instance = new Session();
        }
        return self::$instance;
    }

    // CONSTRUTOR PRIVADO PARA QUE NADIE LO PUEDA INSTANCIAR
    private function __construct()
    {
        session_start();
    }

    public function set($key, $value) {
        $_SESSION[$key] = $value;
    }

    public function get($key) {
        if ( isset($_SESSION[$key]) ) {
            return $_SESSION[$key];
        }
        return null;
    }

    public function delete($key) {
        if ( isset($_SESSION[$key]) ) {
            unset($_SESSION[$key]);
        }
    }

    public function destroy() {
        session_destroy();
    }
}

?>
