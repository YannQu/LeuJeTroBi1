<?php
//Pour les appelles a la base de données
    $pdo = new PDO('mysql:host=localhost;dbname=miniboys;', 'root', 'root');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);