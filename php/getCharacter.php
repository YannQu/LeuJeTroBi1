<?php

require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);
//var_dump($character);