<?php

header("Content-Type: text/plain");
header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");

////////////////////////////////////////////////////////////////////////////////
// setup properties
////////////////////////////////////////////////////////////////////////////////

$wwwDir = dirname(__FILE__);
$rootDir = $wwwDir . '/';

////////////////////////////////////////////////////////////////////////////////
// permission
////////////////////////////////////////////////////////////////////////////////

if (!array_key_exists('secret', $_GET)){
	header("401 Unauthorized");
	echo "Undefined secret!\n";
	die();
}

$secret = include( $rootDir . '/secret.php' );

if ($_GET['secret'] != $secret){
	header("401 Unauthorized");
	echo "Invalid secret!\n";
	die();
}

////////////////////////////////////////////////////////////////////////////////
// check arguments
////////////////////////////////////////////////////////////////////////////////

if (!(array_key_exists('map', $_GET) || 
	  array_key_exists('version', $_GET) || 
	  array_key_exists('directory', $_GET))){
	header("400 Too few arguments");
	echo "Too few arguments!\n";
	die();
}

$map=$_GET['map'];
$version=$_GET['version'];
$directory=$_GET['directory'];

// check that path don't contains some parent dirs ("..")
$path = preg_split("/\\//", $directory);
foreach ($path as $segment){
    if ($segment == ".."){
        echo "Invalid path!\n";
        die();
    }
}

////////////////////////////////////////////////////////////////////////////////
// Load libs
////////////////////////////////////////////////////////////////////////////////

require_once $rootDir . '/lib/Nette/loader.php';
require_once $rootDir . '/lib/Utils.php';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

$size = \Utils::checkMapFiles($rootDir . $directory);
if ( $size < 0 ){
	echo "Failed check files in directory: ".$directory."\n";
	die();
}

$database = include( $rootDir . '/database.php' );

echo "map=$map\n";
echo "version=$version\n";
echo "directory=$directory\n";
echo "size=$size\n";

// add entry to database
$database->query("INSERT INTO `map`", 
	array('map' => $map, 'version' => $version, 'directory' => $directory, 
            'creation' => new \DateTime(), 'size' => $size ));

echo "\n";
echo "OK\n";
