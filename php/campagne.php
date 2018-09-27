<?php
//Co.php?page=game&id_campagne=1
require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);
//var_dump($character);
$req = $pdo->prepare('SELECT * FROM campagne AS c INNER JOIN campagne_joueur AS cj ON c.id_campagne = cj.id_campagne WHERE cj.id_personnage = :id_user');
$req->execute(['id_user' => $character->id_personnage]);
$detailsCJ = $req->fetchAll(PDO::FETCH_OBJ);
//var_dump($detailsCJ);