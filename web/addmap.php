<?php

////////////////////////////////////////////////////////////////////////////////
// setup properties
////////////////////////////////////////////////////////////////////////////////

$wwwDir = dirname(__FILE__);
$rootDir = $wwwDir . '/';
date_default_timezone_set('UTC');

////////////////////////////////////////////////////////////////////////////////
// permission
////////////////////////////////////////////////////////////////////////////////

if (!array_key_exists('secret', $_POST)){
  header("HTTP/1.1 401 Unauthorized");
  header("Content-Type: text/plain");
  header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");
  echo "Undefined secret!\n";
  die();
}

$secret = include( $rootDir . '/secret.php' );

if ($_POST['secret'] != $secret){
  header("HTTP/1.1 401 Unauthorized");
  header("Content-Type: text/plain");
  header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");
  echo "Invalid secret!\n";
  die();
}

////////////////////////////////////////////////////////////////////////////////
// check arguments
////////////////////////////////////////////////////////////////////////////////

if (!(array_key_exists('map', $_GET) || 
    array_key_exists('version', $_GET) || 
    array_key_exists('directory', $_GET))){
  header("HTTP/1.1 400 Too few arguments");
  header("Content-Type: text/plain");
  header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");
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
    header("HTTP/1.1 400 Invalid path");
    header("Content-Type: text/plain");
    header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");
    echo "Invalid path!\n";
    die();
  }
}

////////////////////////////////////////////////////////////////////////////////
// Load libs
////////////////////////////////////////////////////////////////////////////////

require_once $rootDir . '/vendor/autoload.php';
require_once $rootDir . '/lib/Utils.php';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

$size = \Utils::checkMapFiles($rootDir . $directory);
if ( $size < 0 ){
  header("HTTP/1.1 400 Invalid path");
  header("Content-Type: text/plain");
  header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");
  echo "Failed check files in directory: ".$directory."\n";
  die();
}

$database = include( $rootDir . '/database.php' );

header("HTTP/1.1 200 OK");
header("Content-Type: text/plain");
header("Expires: ".GMDate("D, d M Y H:i:s")." GMT");

echo "map=$map\n";
echo "version=$version\n";
echo "directory=$directory\n";
echo "size=$size\n";

// add entry to database
$database->query("INSERT INTO `map`", 
  array('map' => $map, 'version' => $version, 'directory' => $directory, 
            'creation' => new \DateTime('now', new \DateTimeZone('UTC')), 'size' => $size ));

echo "\n";
echo "OK\n";
