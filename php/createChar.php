<?php
require 'bd.php';

if(!empty($_POST)){

	session_start();
	//var_dump($_SESSION['auth']);
	$user = $_SESSION['auth'];
	if ($_POST['classeRadios'] == 0) {
		$typePerso = 0;
		$att = 10;
		$def = 15;
		$vie = 100;
	}else if ($_POST['classeRadios'] == 1) {
		$typePerso = 1;
		$att = 10;
		$def = 10;
		$vie = 120;
	}else{
		$typePerso = 2;
		$att = 15;
		$def = 10;
		$vie = 100;
	}
	$lvl = 1;
	$xp = 0;
	$crit = 0;

	$req = $pdo->prepare('INSERT INTO personnage SET sexe = ?, type_personnage = ?, level = ?, nb_xp = ?, attaque = ?, defense = ?, vie = ?, critique = ?, id_utilisateur = ?');
	$req->execute(array($_POST['sexeRadios'], $typePerso, $lvl, $xp, $att, $def, $vie, $crit, $user->id_utilisateur));

	header('Location: Co.php');
}