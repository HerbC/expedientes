<?php
session_start(); //session_start() crea una sesi�n para ser usada mediante una petici�n GET o POST, o pasado por una cookie 
include_once "conexion.php"; //es la sentencia q usaremos para incluir el archivo de conexi�n a la base de datos que creamos anteriormente.
/*Funci�n verificar_login() --> Vamos a crear una funci�n llamada verificar_login, esta se encargara de hacer una consulta a la base de datos para saber si el usuario ingresado es correcto o no.*/

function verificar_login($user,$password,&$result)
    {
        $sql = "SELECT * FROM login WHERE nombre_usuario = '$user' and clave_usuario = '$password'";
        $rec = mysql_query($sql);
        $count = 0;
        while($row = mysql_fetch_object($rec))
        {
            $count++;
            $result = $row;
        }
        if($count == 1)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

/*Luego haremos una serie de condicionales que identificaran el momento en el boton de login es presionado y cuando este sea presionado llamaremos a la funci�n verificar_login() pasandole los par�metros ingresados:*/

if(!isset($_SESSION['userid'])) //para saber si existe o no ya la variable de sesi�n que se va a crear cuando el usuario se logee
{
    if(isset($_POST['login'])) //Si la primera condici�n no pasa, haremos otra preguntando si el boton de login fue presionado
    {
        if(verificar_login($_POST['user'],$_POST['password'],$result) == 1) //Si el boton fue presionado llamamos a la funci�n verificar_login() dentro de otra condici�n preguntando si resulta verdadero y le pasamos los valores ingresados como par�metros.
        {
            /*Si el login fue correcto, registramos la variable de sesi�n y al mismo tiempo refrescamos la pagina index.html.*/
            $_SESSION['userid'] = $result->idusuario;
            header("location:index.html");
        }
        else
        {
            echo '<div class="error">Su usuario es incorrecto, intente nuevamente.</div>'; //Si la funci�n verificar_login() no pasa, que se muestre un mensaje de error.
        }
    }
?>
<form action="" method="post" class="login">
    <div><label>Username</label><input name="user" type="text" ></div>
    <div><label>Password</label><input name="password" type="password"></div>
    <div><input name="login" type="submit" value="login"></div>
</form>
<?php
} else {
    // Si la variable de sesi�n 'userid' ya existe, que muestre el mensaje de saludo.
    echo 'Su usuario ingreso correctamente.';
    echo '<a href="logout.php">Logout</a>';
}
?> 