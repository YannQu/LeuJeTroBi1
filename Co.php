<?php
//$param = $_GET['insc'];
if (isset($_GET['insc']) && $_GET['insc'] == 'yes') {
	$template = 'createChar';
}else if(isset($_GET['page']) && $_GET['page'] == "cmpgn"){
	$template = 'campagne';
}else if(isset($_GET['page']) && $_GET['page'] == "game"){
	$template = 'game';
}else if(isset($_GET['page']) && $_GET['page'] == "endgame"){
	$template = 'endgame';
}else{
	$template = 'character';
}
include 'layout/layout.phtml';

