<?php
require 'bd.php';
session_start();
$id_inventaire = $_POST["id_inventaire"];
$id_personnage = $_POST["id_personnage"];
echo $id_inventaire."<br>";
echo $id_personnage."<br>";

$req = $pdo->prepare('SELECT * FROM personnage WHERE id_personnage = :id_personnage');
$req->execute(['id_personnage' => $id_personnage]);
$character = $req->fetch(PDO::FETCH_OBJ);

$req = $pdo->prepare("UPDATE `inventaire` SET `is_equip` = '1' WHERE `inventaire`.`id_inventaire` = :id_inventaire");
$req->execute(['id_inventaire' => $id_inventaire]);

$req = $pdo->prepare("SELECT * FROM equipement AS e INNER JOIN inventaire AS i ON e.id_equipement = i.id_equipement WHERE i.id_inventaire = :id_inventaire");
$req->execute(['id_inventaire' => $id_inventaire]);
$item = $req->fetch(PDO::FETCH_OBJ);

$req = $pdo->prepare("UPDATE `personnage` SET `attaque` = :attaque, `defense` = :defense, 
`vie` = :vie, `critique` = :critique WHERE `personnage`.`id_personnage` = :id_personnage");
$req->execute(['attaque' => $character->attaque + $item->attaque,
               'defense' => $character->defense + $item->defense,
               'vie' => $character->vie + $item->vie,
               'critique' => $character->critique + $item->critique,
               'id_personnage' => $id_personnage]);




?>