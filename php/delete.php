<?php
unset($_SESSION['auth']);
$_SESSION['flash']['sucess'] = "Vous etes maintenant déconnecté";
header('Location: ../index.php');