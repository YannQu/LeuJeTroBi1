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

    $req = $pdo->prepare('SELECT * FROM campagne WHERE id_campagne = :id_campagne');
    $req->execute(['id_campagne' => $id_campagne]);
    $campagne = $req->fetch(PDO::FETCH_OBJ);
    $character->nb_xp += $campagne->xp_gagne;
    $xp_gagne = $campagne->xp_gagne;
    $niveau=1;
    $nb_xp_by_niv=100;
    $xp_perso = $character->nb_xp;
    while ($xp_perso >= $nb_xp_by_niv)
    {
        $xp_perso -= $nb_xp_by_niv;
        $nb_xp_by_niv *= 2;
        $niveau += 1;
    }
    $up = false;
    if ($niveau != $character->level)
    {
        $up = true;
    }
    $req = $pdo->prepare("UPDATE `personnage` SET `nb_xp` = :nb_xp, `level` = :level WHERE `personnage`.`id_personnage` = :id_personnage");
    $req->execute(['nb_xp' => $character->nb_xp,
                   'level' => $niveau,
                   'id_personnage' => $character->id_personnage]);
    
    $req = $pdo->prepare("UPDATE `campagne_joueur` SET `is_resolut` = '1' WHERE id_campagne = :id_campagne AND id_personnage = :id_personnage");
    $req->execute(['id_campagne' => $id_campagne,
                   'id_personnage' => $character->id_personnage]);

    $id_next_cmp = $campagne->id_campagne + 1;
    $req = $pdo->prepare('SELECT * FROM campagne WHERE id_campagne = :id_campagne');
    $req->execute(['id_campagne' => $id_next_cmp]);
    $next_cmp = $req->fetch(PDO::FETCH_OBJ);
    $bool_next = true;
    if ($next_cmp == null)
    {
        $bool_next = false;
    }    
}

?>