<?php
//$param = $_GET['insc'];
if (isset($_GET['insc']) && $_GET['insc'] == 'yes') {
	$template = 'createChar';
}else if(isset($_GET['cmpgn']) && $_GET['cmpgn'] == "yes"){
	$template = 'game';
}else{
	$template = 'character';
}
include 'layout/layout.phtml';

