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

require_once $rootDir . '/lib/Nette/loader.php';
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
            "SELECT `id`, `map`, `version`, `directory`, `creation`, `size` " .
            "FROM  `map` " .
            "ORDER BY `creation` DESC ");

if (!$mapRes->valid()){
  $mapRes=array();
  echo "Failed to query maps!\n";
  die();
}

foreach ($mapRes as $map){
  if (!file_exists($rootDir.$map['directory'])){
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
