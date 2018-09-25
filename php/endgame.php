<?php

require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);

$id_manche = $_GET['id_manche'];
$end_game = $_GET['end_game'];
if ($end_game==0)
{
    $msg_end_game="Défaite!";
}
else
{
    $msg_end_game="Victoire";
}

?>