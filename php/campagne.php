<?php
//Co.php?page=game&id_campagne=1
require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM campagne WHERE id_campagne = :id_campagne');
$req->execute(['id_campagne' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);

$niveau_manche = 1;
if (isset($_POST['niveau_manche']))
{
    $niveau_manche = $_POST['niveau_manche'];
}
$req = $pdo->prepare('SELECT * FROM campagne WHERE niveau = :niveau_manche');
$req->execute(['niveau_manche' => $niveau_manche]);
$manche = $req->fetch(PDO::FETCH_OBJ);


$req = $pdo->prepare('SELECT * FROM ennemi WHERE id_ennemi = :id_ennemi');
$req->execute(['id_ennemi' => $manche->id_ennemi]);
$ennemi = $req->fetch(PDO::FETCH_OBJ);


$req = $pdo->prepare('SELECT * FROM equipement AS e INNER JOIN relation_equipement_campagne AS r 
ON r.id_equipement = e.id_equipement WHERE r.id_campagne = :id_campagne');
$req->execute(['id_campagne' => $manche->id_campagne]);
$equipement = $req->fetch(PDO::FETCH_OBJ);


