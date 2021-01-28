<?php

////////////////////////////////////////////////////////////////////////////////
// setup properties
////////////////////////////////////////////////////////////////////////////////

$wwwDir = dirname(__FILE__);
$rootDir = $wwwDir . '/';

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
// Load libs
////////////////////////////////////////////////////////////////////////////////

require_once $rootDir . '/vendor/autoload.php';
require_once $rootDir . '/lib/Utils.php';

////////////////////////////////////////////////////////////////////////////////
// initialize common libraries
////////////////////////////////////////////////////////////////////////////////

$database = include( $rootDir . '/database.php' );

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

header("Expires: ".GMDate("D, d M Y H:i:s", time() + (3600))." GMT");
header("Content-Type: text/plain");

$mapRes = $database->query(
            "SELECT `id`, `map`, `version`, `directory`, `creation`, `size`, `deleted` " .
            "FROM  `map` " .
            "ORDER BY `creation` DESC ");

if (!$mapRes->valid()){
  $mapRes=array();
  echo "Failed to query maps!\n";
  die();
}

$deleted=0;
$marked=0;
$alive=0;

foreach ($mapRes as $map){
  if ($map['deleted']){
    $deleted++;
  }elseif (file_exists($rootDir.$map['directory'])){
    $alive++;
  }else{
    $marked++;
    echo "mark deleted: ".$map['directory'].";\n";

    $delRes = $database->queryArgs(
        "UPDATE `map` " . 
        "SET `deleted` = TRUE " . 
        "WHERE `id` = ?",
        array($map['id']));
    if (!$mapRes->valid()){
      echo "Failed to mark deleted!\n";
      die();
    }
  }
}

echo "\n";
echo "Already deleted maps: $deleted\n";
echo "Newly marked as deleted: $marked\n";
echo "Alive maps: $alive\n";
