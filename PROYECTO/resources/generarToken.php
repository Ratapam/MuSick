<?php
    function generateToken($length = 30)
    {
        return bin2hex(random_bytes($length));
        
    }//generateToken

?>