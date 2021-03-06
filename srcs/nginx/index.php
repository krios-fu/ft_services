
<?php
session_name('jugador');
session_start();

$posicion=array(1,2,3,4,5,6,7,8,9);

    if(isset($_POST['boton'])){
        var_dump("boton");
        foreach ($posicion as $i){
            if($i==$_POST['boton']){
                if($_SESSION['jugador']%2!=0){
                    $i="X";
                }else{
                    $i="O";
                }
            }
        }
        var_dump($posicion);
        var_dump($jugador);
        $_SESSION['jugador']++;

        if($_SESSION['jugador']%2!=0){
            $jugador="Jugador 1";
        }else{
            $jugador="Jugador 2";
        }

    }elseif (isset($_POST['reset'])) {
        session_destroy();
        }
?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tres en raya</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <h1>Bienvenido al juego del tres en raya</h1>
    <div>
        <?php
        if(isset($_SESSION['jugador'])){
            echo "<h3>Le toca el turno al " . $jugador . "</h3>";
        }else{
            echo "<h3>Pulse el boton comenzar partida</h3>";
        }
        ?>
        <form method="post">
                <input value="Comenzar partida" name="boton" type="submit" class="especial">
            <br/>
            <br/>
                <button name="boton" type="submit" value="0"></button>
                <button name="boton" type="submit" value="1"></button>
                <button name="boton" type="submit" value="2"></button>
            <br/>
                <button name="boton" type="submit" value="3"></button>
                <button name="boton" type="submit" value="4"></button>
                <button name="boton" type="submit" value="5"></button>
            <br/>
                <button name="boton" type="submit" value="6"></button>
                <button name="boton" type="submit" value="7"></button>
                <button name="boton" type="submit" value="8"></button>
            <br/>
            <br/>
            <input class="especial" name="reset" type="submit" value="Reiniciar partida">
        </form>
    </div>
</body>
</html>