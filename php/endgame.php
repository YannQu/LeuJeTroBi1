<?php

require 'bd.php';
session_start();
//var_dump($_SESSION['auth']);
$user = $_SESSION['auth'];
$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
$req->execute(['id_user' => $user->id_utilisateur]);
$character = $req->fetch(PDO::FETCH_OBJ);

$id_campagne = $_GET['id_campagne'];
$end_game = $_GET['end_game'];
if ($end_game==0)
{
    $msg_end_game="Défaite!";
}
else
{
    $msg_end_game="Victoire";
    $req = $pdo->prepare('SELECT * FROM equipement AS e INNER JOIN relation_equipement_campagne AS r 
    ON r.id_equipement = e.id_equipement WHERE r.id_campagne = :id_campagne');
    $req->execute(['id_campagne' => $id_campagne]);
    $item_dropable = $req->fetchAll(PDO::FETCH_OBJ);

    $item_droper = array();
    foreach($item_dropable as $item)
    {
        $nb_loot = rand(1,101);
        if ($nb_loot <= $item->pour_loot)
        {
            array_push($item_droper, $item);
            $req = $pdo->prepare('INSERT INTO inventaire (id_personnage, id_equipement) VALUES (:id_personnage, :id_equipement) ');
            $req->execute(['id_personnage' => $character->id_personnage,
                           'id_equipement' => $item->id_equipement]);
        }
    }
}

?>