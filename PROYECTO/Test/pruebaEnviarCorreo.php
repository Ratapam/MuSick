<?php
///////Configuración/////
$mail_destinatario = 'fjmoyano07@gmail.com';
///////Fin configuración//

///// Funciones necesarias////
function form_mail($sPara, $sAsunto, $sTexto, $sDe)
{
$bHayFicheros = 0;
$sCabeceraTexto = "";
$sAdjuntos = "";
if ($sDe)$sCabeceras = "From:".$sDe."\n";
else $sCabeceras = "";
$sCabeceras .= "MIME-version: 1.0\n";
foreach ($_POST as $sNombre => $sValor)
$sTexto = $sTexto."\n".$sNombre." = ".$sValor;
foreach ($_FILES as $vAdjunto)
{
if ($bHayFicheros == 0)
{
$bHayFicheros = 1;
$sCabeceras .= "Content-type: multipart/mixed;";
$sCabeceras .= "boundary=\"--_Separador-de-mensajes_--\"\n";
$sCabeceraTexto = "----_Separador-de-mensajes_--\n";
$sCabeceraTexto .= "Content-type: text/plain;charset=iso-8859-1\n";
$sCabeceraTexto .= "Content-transfer-encoding: 7BIT\n";
$sTexto = $sCabeceraTexto.$sTexto;
}
if ($vAdjunto["size"] > 0)
{
$sAdjuntos .= "\n\n----_Separador-de-mensajes_--\n";
$sAdjuntos .= "Content-type: ".$vAdjunto["type"].";name=\"".$vAdjunto["name"]."\"\n";;
$sAdjuntos .= "Content-Transfer-Encoding: BASE64\n";
$sAdjuntos .= "Content-disposition: attachment;filename=\"".$vAdjunto["name"]."\"\n\n";
$oFichero = fopen($vAdjunto["tmp_name"], 'r');
$sContenido = fread($oFichero, filesize($vAdjunto["tmp_name"]));
$sAdjuntos .= chunk_split(base64_encode($sContenido));
fclose($oFichero);
}
}
if ($bHayFicheros)
$sTexto .= $sAdjuntos."\n\n----_Separador-de-mensajes_----\n";
return(mail($sPara, $sAsunto, $sTexto, $sCabeceras));
}

if (isset ($_POST['enviar'])) {
if (form_mail($mail_destinatario, $_POST['asunto'],
"Los datos introducidos en el formulario son:\n\n", $_POST['email']))
echo '

Su mensaje a sido enviado correctamente. Gracias por contactar con nosostros

';
else echo '

Error al enviar el formulario. Por favor, inténtelo de nuevo mas tarde.

'; }


?>
<html>
    <form action="pruebaEnviarCorreo.php" method="post">
        <input type="text" name="asunto">
        <input type="text" name="email">
        <input type="submit" name="Enviar">
    </form>
</html>