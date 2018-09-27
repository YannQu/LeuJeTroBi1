<?php
require 'bd.php';
$id_inventaire=$_POST['id_inventaire'];
$req = $pdo->prepare('DELETE FROM `inventaire` WHERE `inventaire`.`id_inventaire` = :id_inventaire');
$req->execute(['id_inventaire' => $id_inventaire]);
?>