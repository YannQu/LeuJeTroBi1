<?php

require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);
//var_dump($character);

$req = $pdo->prepare('SELECT * FROM inventaire AS i INNER JOIN equipement AS e ON i.id_equipement = e.id_equipement WHERE i.id_personnage = :id_user');
$req->execute(['id_user' => $character->id_personnage]);
$detailsInv = $req->fetchAll(PDO::FETCH_OBJ);
$cmpt=0;
//var_dump($detailsInv);