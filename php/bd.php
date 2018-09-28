<?php
//Pour les appelles a la base de données

    $pdo = new PDO('mysql:host=localhost;dbname=miniboys;', 'root', '');
    
    $pdo->exec("set names utf8");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>