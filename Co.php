<?php
$param="no";
if (isset($_GET['insc']))
{
	$param = $_GET['insc'];
}
if ($param == 'yes') {
	$template = 'createChar';
}else{
	$template = 'character';
}
$template='game';
include 'layout/layout.phtml';

