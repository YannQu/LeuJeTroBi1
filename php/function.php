<?php
//Pour s'incription
///
///
////////////////////
require 'bd.php';
//Pour verifier si les donnée, on étées posté
if(!empty($_POST) && $_POST['inscInp'] == 'inscription')
{
    $success = true;
    $errors= array();
    $errors['error']['username'] = "";
    $errors['error']['email'] = "";
    $errors['error']['password'] = "";
    $errors['success'] = false;
    //$pdo->setAttribute(PDO::ATTR_DEFAULT);

    //Si vous avez pas rentrais de pseudo ou que le pseudo n'est pas valide'
    if(empty($_POST['username']) || !preg_match('/^[a-zA-Z0-9_]+$/', $_POST['username']))
    {
        $errors['error']['username'] = "<li>Votre pseudo n'est pas valide</li>";
        $success = false;
    }

    //Si l'eamil n'est pas valide
    if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
    {
        $errors['error']['email'] = "<li>Votre email n'est pas valide</li>";
        $success = false;
    }
    //verification si le email est deja pris
    else
    {
        $req = $pdo->prepare('SELECT id_utilisateur FROM users WHERE email = ?');
        $req->execute(array($_POST['email']));
        $user = $req->fetch(PDO::FETCH_ASSOC);
        if($user)
        {
            $errors['error']['email'] = '<li>Ce email est déja pris</li>';
            $success = false;
        }
    }

    if (strlen($_POST['password'])<8)
    {
        $success = false;
        $errors['error']['password'] = "<li>Vous devez rentrer un mot de passe valide superieur a 8 Caractere</li>";
    }
    elseif (strlen($_POST['password'])>21)
    {
        $success = false;
        $errors['error']['password'] = "<li>Vous devez rentrer un mot de passe valide inferieur a 21 Caractere</li>";
    }
    elseif(empty($_POST['password']) || $_POST['password'] != $_POST['password_confirm'])
    {
        //Si le mdp et le mdp confirme sont pareil
        $errors['error']['password'] = "<li>Vous devez rentrer un mot de passe identique</li>";
        $success = false;
    }
    //verification si le pseudo est deja pris
    else
    {
        $req = $pdo->prepare('SELECT id_utilisateur FROM users WHERE username = ?');
        $req->execute(array($_POST['username']));
        $user = $req->fetch(PDO::FETCH_ASSOC);
        if($user)
        {
            $errors['error']['username'] = '<li>Ce pseudo est déja pris</li>';
            $success = false;
        }
    }
    if($success)
    {
        $req = $pdo->prepare("INSERT INTO users SET username = ?, password = ?, email = ?");
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $req->execute(array($_POST['username'], $password, $_POST['email']));
        $req = $pdo->prepare('SELECT * FROM users WHERE username = ?');
        $req->execute(array($_POST['username']));
        $user = $req->fetch(PDO::FETCH_OBJ);

        session_start();
        $_SESSION['auth'] = $user;
        $errors['success'] = true;
        header('Location: Co.php?insc=yes');
        exit();


    }
    $errors['error']['html'] = "<ul>".$errors['error']['username'].$errors['error']['email'].$errors['error']['password']."</ul>";
    echo json_encode($errors);
}

//////////////
/////////////
//Pour la connection

//Si l'utilisateur a rentré un de c'est parametre
if(!empty($_POST) && !empty($_POST['username']) && !empty($_POST['password']) && $_POST['conInp'] == 'connection'){
    //Pour les appelles a la base de données
    //$pdo = new PDO('mysql:host=localhost;dbname=testPageConnection;', 'root', 'ola450');
    //$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//$pdo->setAttribute(PDO::ATTR_DEFAULT);

    //requete sql pour aller cherché les infos sur l'utilisateur
    $req = $pdo->prepare('SELECT * FROM users WHERE username = :username OR email = :username');
    $req->execute(['username' => $_POST['username']]);
    $user = $req->fetch(PDO::FETCH_OBJ);
    //debug($_POST['password']);

    //decryptage du mot de passe
    if(password_verify($_POST['password'], $user->password)){

        session_start();
        $_SESSION['auth'] = $user;
        $_SESSION['flash']['success'][] = 'Vous êtes maintenant connecter';

        $req = $pdo->prepare('SELECT * FROM personnage WHERE id_utilisateur = :id_user');
        $req->execute(['id_user' => $user->id_utilisateur]);
        $character = $req->fetch(PDO::FETCH_OBJ);
        if ($character == false) {
            header('Location: Co.php?insc=yes');
        }else{
            header('Location: Co.php?page=character');
        }
        exit();
    }
    else{
        $_SESSION['flash']['error'][] = 'Identifiant ou mot de passe incorrecte';
    }
    //debug($user->password);
}

?>