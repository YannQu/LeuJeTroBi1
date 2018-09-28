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

	$req = $pdo->prepare('INSERT INTO personnage SET type_personnage = ?, level = ?, nb_xp = ?, attaque = ?, defense = ?, vie = ?, critique = ?, id_utilisateur = ?');
	$req->execute(array($typePerso, $lvl, $xp, $att, $def, $vie, $crit, $user->id_utilisateur));
	$req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
	$req->execute(['id_user' => $user->id_utilisateur]);
	$character = $req->fetch(PDO::FETCH_OBJ);
	
	$req = $pdo->prepare('SELECT * FROM campagne');
	$req->execute();
	$all_cmp = $req->fetchAll(PDO::FETCH_OBJ);
	foreach($all_cmp as $cmp)
	{
		$req = $pdo->prepare("INSERT INTO `campagne_joueur` (`is_resolut`, `id_campagne`, `id_personnage`) VALUES ('0', :id_campagne, :id_personnage)");
		$req->execute(['id_campagne' => $cmp->id_campagne,
					   'id_personnage' => $character->id_personnage]);
	}

	header('Location: Co.php');
}