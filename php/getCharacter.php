<?php

require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);

$req = $pdo->prepare('SELECT * FROM inventaire WHERE id_personnage = :id_user');
$req->execute(['id_user' => $character->id_personnage]);
$inventaire = $req->fetchAll(PDO::FETCH_OBJ);

$detailsInv = array();
$cmpt = 0;
foreach ($inventaire as $i){
	//var_dump($i);
    $req = $pdo->prepare('SELECT * FROM equipement WHERE id_equipement = :id_equip');
	$req->execute(['id_equip' => $i->id_equipement]);
	array_push($detailsInv, $req->fetch(PDO::FETCH_OBJ));
}
//var_dump($detailsInv);