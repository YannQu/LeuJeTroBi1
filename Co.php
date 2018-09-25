<?php
$param = $_GET['insc'];
if ($param == 'yes') {
	$template = 'createChar';
}else{
	$template = 'character';
}
include 'layout/layout.phtml';

