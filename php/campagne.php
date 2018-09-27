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
$req = $pdo->prepare('SELECT * FROM campagne AS c LEFT JOIN campagne_joueur AS cj ON c.id_campagne = cj.id_campagne WHERE cj.id_personnage = :id_user');
$req->execute(['id_user' => $character->id_personnage]);
$detailsCJ = $req->fetchAll(PDO::FETCH_OBJ);

foreach ($detailsCJ as $cmp)
{
    $req = $pdo->prepare('SELECT * FROM equipement AS e INNER JOIN relation_equipement_campagne AS r 
    ON r.id_equipement = e.id_equipement WHERE r.id_campagne = :id_campagne');
    $req->execute(['id_campagne' => $cmp->id_campagne]);
    $equipements = $req->fetchAll(PDO::FETCH_OBJ);
    $cmp->items = $equipements;
    $req = $pdo->prepare('SELECT * FROM ennemi WHERE id_ennemi = :id_ennemi');
    $req->execute(['id_ennemi' => $cmp->id_ennemi]);
    $ennemi = $req->fetch(PDO::FETCH_OBJ);
    $cmp->ennemi = $ennemi;
    //var_dump($cmp);
}
//var_dump($detailsCJ);